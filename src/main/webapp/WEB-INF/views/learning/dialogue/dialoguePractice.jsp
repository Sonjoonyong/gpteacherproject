<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body onload="mediaStart()">

<div id="dialogueBox">

    <button id="startAudio">
        대화 시작하기
    </button>

    <%--첫번째 질문--%>
    <div class="question">
        <span>${assistantTalk}</span>
    </div>

    <br>


</div>
<template>
    <div id="dialogue">
        <%--답변--%>
        <div class="answer">
            <div> <!--style="display: flex;"-->
                <div class="yourSentence">
                    <div>Your sentence</div>
                    <div id="transcriptResult"></div>
                </div><br/>

                <div class="correctedSentence">
                    <div>Corrected sentence</div>
                    <div id="correctedResult"></div>
                </div><br/>
            </div>

            <div style="display: flex;">
                <div class="explanation">
                    <div>Explanation</div>
                    <div id="explanationResult"></div>
                </div>
                <button>좋아요</button>
                <button>보관함에 넣기</button>
            </div>
        </div>

        <br/>

        <%--질문--%>
        <div class="question">
            <span></span>
        </div>
    </div>
</template>
<%--녹음--%>
<div class="recordbox">
    <input type="button" id="record" value="녹음 시작">
    <input type="button" id="stop" value="녹음 중지">
    <p id="timeView"></p>
</div>

<%--발음평가 테스트용(임시)--%>
<%--<br><br><br><br>--%>
<%--<input type="button" id="record" value="녹음 시작">--%>
<%--<input type="button" id="stop" value="녹음 중지">--%>
<%--발음해보세요: <div id="script">Peter Piper picked a peck of pickled peppers</div>--%>
<%--<textarea rows="10" cols="100" id="textarea"></textarea>--%>
<%--<br><br><br><br>--%>

<script>
    function addContent(result,userTalk) {
        let parent = document.getElementById("dialogueBox");
        let divDialogue = document.getElementsByTagName("template")[0].content.cloneNode(true).firstElementChild;

        // 결과 삽입 위치 찾기
        let divAnswer = divDialogue.children[0];
        let divQuestion = divDialogue.children[2];

        let divSentence = divAnswer.children[0].children[0].children[1];
        let divCorrect = divAnswer.children[0].children[2].children[1];
        let divExplanation = divAnswer.children[1].children[0].children[1];
        let spanQuestion = divQuestion.children[0];

        // 결과 가져오기
        let newAssistantTalk = result.newAssistantTalk;
        let correctedSentence = result.correctedSentence;
        let explanation = result.explanation;

        //결과 삽입
        divSentence.innerHTML = userTalk;
        spanQuestion.innerHTML = newAssistantTalk;

        //고칠 부분이 없을 경우
        if(correctedSentence=="" | correctedSentence==userTalk | correctedSentence==null | correctedSentence=="N/A") {
            divCorrect.innerHTML = userTalk;
            divExplanation.innerHTML = "No correction needed.";
        }else {
            divCorrect.innerHTML = correctedSentence;
            divExplanation.innerHTML = explanation;
        }

        //화면에 추가
        parent.appendChild(divDialogue);
    }
    document.querySelector('#startAudio').addEventListener("click",() => {
        let assistantTalk = "${assistantTalk}";
        ttsAjax(assistantTalk);
    })

    function ttsAjax(assistantTalk) {
        let request = new XMLHttpRequest();

        let urlSearchParams = new URLSearchParams();
        urlSearchParams.append("assistantTalk", assistantTalk);

        request.onload = () => {
            console.log(request.response);
            let audioURL = URL.createObjectURL(request.response);
            let audio = new Audio(audioURL);
            audio.play();
        }

        request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
        request.responseType = "blob";
        request.send();
    }

    //녹음 & stt
    let recordButton = document.querySelector("#record");
    let stopButton = document.querySelector("#stop");
    stopButton.disabled = true;

    function mediaStart() {

        if (navigator.mediaDevices) {
            const constraints = {audio:true};
            let chunks = [] // 녹음된 내용을 저장할 변수
            let timer = 0; // 타이머
            clearInterval(timer); //타이머 초기화

            // 정상 구현 시
            navigator.mediaDevices.getUserMedia(constraints).then(stream => {
                // 녹음을 시작하고 종료하는 객체
                const mediaRecorder = new MediaRecorder(stream);

                // 녹음 시작
                recordButton.onclick = () => {
                    chunks = []; // 이전에 녹음된 내용이 있으면 초기화
                    let time = 0; //시간 초기화

                    mediaRecorder.start();
                    // 타이머 시작
                    timer = setInterval(function() {
                        time = time + 1;
                        document.getElementById("timeView").innerHTML = time;
                        if(time==10) { // 시간 제한
                            clearInterval(timer);

                            mediaRecorder.stop();
                            document.getElementById("timeView").innerHTML = "";

                            recordButton.style.backgroundColor = "";
                            stopButton.disabled = true;
                            recordButton.disabled = true;
                        }
                    },1000);

                    recordButton.style.backgroundColor = "red";
                    recordButton.style.color = "white";
                    recordButton.disabled = true;
                    stopButton.disabled = false;
                }

                // 오디오 저장
                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data);
                }

                // 녹음 종료
                stopButton.onclick = () => {
                    mediaRecorder.stop();

                    clearInterval(timer); // 타이머 초기화
                    document.getElementById("timeView").innerHTML = "";

                    recordButton.style.backgroundColor = "";
                    stopButton.disabled = true;
                    recordButton.disabled = true;
                }

                // 녹음이 종료되면 서버로 녹음 내용을 보내고 결과를 받아오는 처리
                mediaRecorder.onstop = () => {
                    // chunks에 저장된 데이터를 바이너리코드로 변환
                    const blob = new Blob(chunks, {'type':'audio/webm codecs=opus'});

                    // 서버로 전송
                    let formData = new FormData();
                    formData.append("audio", blob);
                    sttAjax(formData);
                }

            }).catch(err => {
                console.log(err);
            });
        } else {
            console.log("미디어 장치 없음");
        }

    }

    function sttAjax(formData) {
        let request = new XMLHttpRequest();

        request.onload = () => {
            let responseText = request.responseText;
            getResponse(responseText); //script

            recordButton.style.color = "";
            recordButton.disabled = false;
    }
        formData.enctype="multipart/form-data";
        request.open("POST", "/learning/dialogue/transcript", false);
        request.send(formData);
    }

    //유저 문장 보내고 교정본 받기
    function getResponse(userTalk){
        let request = new XMLHttpRequest();

        let formData = new FormData();
        formData.append("assistantTalk","${assistantTalk}");
        formData.append("userTalk",userTalk);
        formData.append("learningId","${learningId}");

        request.onload = () => {
            let result = request.response;
            result = JSON.parse(result);
            console.log(result);
            addContent(result,userTalk); //화면에 출력력
        }

       request.open("POST","/learning/dialogue/talk", false);
        console.log(formData);
        request.send(formData);
    }

</script>

<%--Wav 파일 업로드 라이브러리--%>
<%--<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>--%>

<%--<script type="text/javascript" src="/js/dialoguePracticeTts.js"></script>--%>
<%--<script type="text/javascript" src="/js/dialoguePracticePronunciation.js"></script>--%>


</body>
</html>
