<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <style>
        div {
            border: 1px solid hotpink;
        }

        #initialAssistantTalk {
            display: none;
        }

        #dialogue {
            display: flex;
            flex-direction: column;
        }

        #record {
            display: none;
        }

        #stop {
            color: hotpink;
            display: none;
        }

        #waitingMessage {
            display: none;
        }

        #like, #storage {
            height: 30px;
            width: 30px;
            background-color: transparent;
        }

        img {
            height: 20px;
            width: 20px;
        }

    </style>
</head>
<body onload="init()">

<input type="hidden" id="learningId" value="${learningId}"/>

<div id="dialogueBox">

    <button id="startDialogue">
        대화 시작하기
    </button>

    <%--첫번째 질문--%>
    <div class="question" id="initialAssistantTalk">
        ${assistantTalk}
    </div>

    <br>

</div>


<%-- 템플릿 --%>
<template>
    <div id="dialogue">
        <input type="hidden" id="sentenceId"/>
        <%--답변--%>
        <div class="userTalk"> <!--id="sentenceDbId"-->
            <div style="display: flex;">
                <div>
                    <div>Your sentence</div>
                    <div class="yourSentence">
                        유저 답변
                    </div>
                </div>

                <div>
                    <div>Corrected sentence</div>
                    <div class="correctedSentence">
                        교정된 답변
                    </div>
                </div>
            </div>

            <div style="display: flex;">
                <div>
                    <div>Explanation</div>
                    <div class="explanation">
                        교정에 대한 설명
                    </div>
                </div>

                <button id="like" onclick="likeAjax(this)">
                    <img src="/images/empty-heart.png">
                </button>

                <button id="storage">
                    <img src="/images/empty-storage.png">
                </button>
            </div>
        </div>

        <br/>

        <%--질문--%>
        <div class="assistantTalk">
        </div>
    </div>
</template>

<%--녹음--%>
<div>
    <input type="button" id="record" value="녹음 시작" disabled>
    <input type="button" id="stop" value="녹음 중지" disabled>
    <div id="waitingMessage">잠시 기다려주세요.</div>
    <progress id="progress" value="0" min="0" max="10" style="display:none;"></progress>
    <b id="time"></b>
</div>
<%--발음평가 테스트용(임시)--%>
<%--<br><br><br><br>--%>
<%--<input type="button" id="record" value="녹음 시작">--%>
<%--<input type="button" id="stop" value="녹음 중지">--%>
<%--발음해보세요: <div id="script">Peter Piper picked a peck of pickled peppers</div>--%>
<%--<textarea rows="10" cols="100" id="textarea"></textarea>--%>
<%--<br><br><br><br>--%>

<script>

    let learningId = document.querySelector('#learningId').value;
    let initialAssistantTalkDiv = document.querySelector('#initialAssistantTalk');
    let initialAssistantTalk = initialAssistantTalkDiv.innerText;
    let priorAssistantTalk = initialAssistantTalk;

    let audio;

    //녹음 버튼
    let recordButton = document.querySelector("#record");
    let stopButton = document.querySelector("#stop");

    // 프로그레스 바
    let progress = document.getElementById("progress"); //progress bar
    let b = document.getElementById("time"); // 초 표시할 b태그
    let timer = 0; // 타이머
    let mx = 10; // 최대 시간(초)

    let startDialogueBtn = document.querySelector('#startDialogue');

    startDialogueBtn.onclick = () => {
        ttsAjax(initialAssistantTalk);

        initialAssistantTalkDiv.style.display = 'block';
        startDialogueBtn.style.display = 'none';
        recordButton.disabled = false;
        recordButton.style.display = 'block';
    }

    /*likeBtn.onclick = () => {
        likeAjax()
    }*/

    function retry() {
        alert("잘못된 문장입니다. 다시 응답해주세요.");

        if (audio) {
            audio.pause();
        }
        stopButton.style.display = 'none';
        stopButton.disabled = true;
        recordButton.style.display = 'block';
        recordButton.disabled = false;
    }

    function init() {
        if (navigator.mediaDevices) {
            const constraints = {audio: true};
            let chunks = [];

            navigator.mediaDevices.getUserMedia(constraints).then(stream => {
                const mediaRecorder = new MediaRecorder(stream);

                // 녹음 시작
                recordButton.onclick = () => {
                    chunks = [];
                    // 진행중인 TTS 종료
                    if (audio) {
                        audio.pause();
                    }
                    mediaRecorder.start();

                    // 타이머 시작
                    progress.setAttribute("max", mx * 10); //프로그래스 바 최대 값 설정
                    let time = 0; //시간 초기화
                    timer = setInterval(() => {
                        time = time + 1;
                        let realtime = parseInt(time / 10);
                        // 상태바 진행
                        b.innerText = realtime + " s";
                        progress.value = time;

                        if (time == mx * 10 + 1) { // 시간 제한
                            stopRecording(mediaRecorder, timer)
                        }
                    }, 100);

                    recordButton.style.display = 'none';
                    recordButton.disabled = true;
                    stopButton.style.display = 'block';
                    stopButton.disabled = false;
                    progress.style.display = "inline";
                }

                // 오디오 저장
                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data);
                }

                // 녹음 종료
                stopButton.onclick = () => {
                    stopRecording(mediaRecorder, timer)
                }

                // 녹음이 종료되면 서버로 전송 및 결과 수신
                mediaRecorder.onstop = () => {
                    const blob = new Blob(chunks, {'type': 'audio/webm codecs=opus'});

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

    function ttsAjax(assistantTalk) {
        let request = new XMLHttpRequest();

        let urlSearchParams = new URLSearchParams();
        urlSearchParams.append("assistantTalk", assistantTalk);

        request.onload = () => {
            let audioURL = URL.createObjectURL(request.response);
            audio = new Audio(audioURL);
            audio.play();
        }

        request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
        request.responseType = "blob";
        request.send();
    }

    // 유저 답변 서버에 전송 후 결과 수신
    function sttAjax(formData) {
        let request = new XMLHttpRequest();
        formData.append("priorAssistantTalk", priorAssistantTalk);
        formData.append("learningId", learningId);
        request.responseType = "json";

        request.onload = () => {
            //화면에 출력
            console.log(request.response);
            addContent(request.response);

            stopButton.style.display = 'none';
            stopButton.disabled = true;
            recordButton.style.display = 'block';
            recordButton.disabled = false;
        }

        formData.enctype = "multipart/form-data";
        request.open("POST", "/learning/dialogue/transcript", true);
        request.send(formData);
    }

    function likeAjax(like) {
       let request = new XMLHttpRequest();
       let sentenceId = like.value;

       request.onload = () => {
           let likeStatus = request.response;
       }

       request.open("GET", "/learning/dialogue/like?sentenceId="+sentenceId);
       request.send();
    }

    function addContent(result) {
        // 대화창
        let dialogueBox = document.getElementById("dialogueBox");
        let dialogueDiv = document.getElementsByTagName('template')[0].content.cloneNode(true).firstElementChild;

        let yourSentenceDiv = dialogueDiv.querySelector('.yourSentence');
        let correctedSentenceDiv = dialogueDiv.querySelector('.correctedSentence');
        let explanationDiv = dialogueDiv.querySelector('.explanation');
        let assistantTalkDiv = dialogueDiv.querySelector('.assistantTalk');
        let likeBtn = dialogueDiv.querySelector('#like');

        // 결과 가져오기
        if (result.result === "fail") {
            retry();
            return false;
        }

        let newAssistantTalk = result.answer;
        let correctedSentence = result.corrected;
        let explanation = result.explanation;
        let userTalk = result.userTalk;
        let sentenceId = result.sentenceId;
        priorAssistantTalk = newAssistantTalk;

        // 결과 삽입
        yourSentenceDiv.innerText = userTalk;
        assistantTalkDiv.innerText = newAssistantTalk;
        likeBtn.value = sentenceId;

        // 고칠 부분이 없을 경우
        if (!correctedSentence ||
            correctedSentence === userTalk ||
            correctedSentence === "N/A" ||
            correctedSentence === "No correction needed."
        ) {
            correctedSentenceDiv.innerText = "No correction needed.";
            explanationDiv.innerText = "Perfect!";
        } else {
            correctedSentenceDiv.innerText = correctedSentence;
            explanationDiv.innerText = explanation;
        }

        // 화면에 추가
        dialogueBox.appendChild(dialogueDiv);
        // GPT 답변 읽어주기
        ttsAjax(newAssistantTalk)
    }

    function stopRecording(mediaRecorder, timer) {
        mediaRecorder.stop();

        // 상태바 초기화
        b.innerText = "";
        progress.value = 0;
        progress.style.display = "none";
        clearInterval(timer); // 타이머 초기화

        stopButton.disabled = true;
        recordButton.disabled = true;
    }


</script>

<%--Wav 파일 업로드 라이브러리--%>
<%--<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>--%>

<%--<script type="text/javascript" src="/js/dialoguePracticeTts.js"></script>--%>
<%--<script type="text/javascript" src="/js/dialoguePracticePronunciation.js"></script>--%>

</body>
</html>
