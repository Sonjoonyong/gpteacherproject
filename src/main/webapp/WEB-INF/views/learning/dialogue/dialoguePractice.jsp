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

    <%--질문--%>
    <div class="question">
        <span>${assistantTalk}</span>
    </div>

    <br>

    <%--답변--%>
    <div class="answer">
        <div> <!--style="display: flex;"-->
            <div class="yourSentence">
                <div>Your sentence</div>
                <div id="transcriptResult"></div>
            </div><br/>

            <div class="correctedSentence">
                <div>Corrected sentence</div>
                <div id="correctdResult"></div>
            </div><br/>
        </div>

        <div> <!--style="display: flex;"-->
            <div class="explanation">
                <div>Explanation</div>
                <div id="explanationResult"></div>
            </div><br/>
            <button>좋아요</button>
            <button>보관함에 넣기</button>
        </div>

    </div>

    <%--녹음--%>
    <div class="recordbox">
        <input type="button" id="record" value="녹음 시작">
        <input type="button" id="stop" value="녹음 중지">
        <br/>
        <textarea rows="10" cols="100" id="textarea"></textarea>
    </div>

</div>

<script>
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

            // 정상 구현 시
            navigator.mediaDevices.getUserMedia(constraints).then(stream => {
                // 녹음을 시작하고 종료하는 객체
                const mediaRecorder = new MediaRecorder(stream);

                // 녹음 시작
                recordButton.onclick = () => {
                    chunks = []; // 이전에 녹음된 내용이 있으면 초기화
                    mediaRecorder.start();

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

    function getResponse(userTalk){
        let request = new XMLHttpRequest();

        let formData = new FormData();
        formData.append("assistantTalk","${assistantTalk}");
        formData.append("userTalk",userTalk);
        formData.append("learningId","${learningId}");

        request.onload = () => {
            let result = request.response;
            result = JSON.parse(result);

            document.querySelector('#transcriptResult').innerText = userTalk;
            document.querySelector('#correctdResult').innerText = result.correctedSentence;
            document.querySelector('#explanationResult').innerText = result.explanation;
        }

        request.open("POST","/learning/dialogue/talk", false);
        console.log(formData);
        request.send(formData);
    }

</script>


</body>
</html>
