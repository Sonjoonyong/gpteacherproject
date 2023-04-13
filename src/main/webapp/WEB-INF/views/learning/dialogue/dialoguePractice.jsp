<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <style>
        div {
            border: 1px solid hotpink;
        }

        #dialogue {
            display: flex;
            flex-direction: column;
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

                <button>좋아요</button>

                <button>보관함에 넣기</button>
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
    <input type="button" id="record" value="녹음 시작">
    <input type="button" id="stop" value="녹음 중지">
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
    let initialAssistantTalk = document.querySelector('#initialAssistantTalk').innerText;
    let priorAssistantTalk = initialAssistantTalk;

    let startDialogueBtn = document.querySelector('#startDialogue');

    startDialogueBtn.onclick = () => {
        ttsAjax(initialAssistantTalk);
        startDialogueBtn.hidden = true;
    }

    //녹음 & stt
    let recordButton = document.querySelector("#record");
    let stopButton = document.querySelector("#stop");
    stopButton.disabled = true;


    function addContent(result, userTalk) {
        // 대화창
        let dialogueBox = document.getElementById("dialogueBox");
        let dialogueDiv = document.getElementsByTagName('template')[0].content.cloneNode(true).firstElementChild;

        let yourSentenceDiv = dialogueDiv.querySelector('.yourSentence');
        let correctedSentenceDiv = dialogueDiv.querySelector('.correctedSentence');
        let explanationDiv = dialogueDiv.querySelector('.explanation');
        let assistantTalkDiv = dialogueDiv.querySelector('.assistantTalk');

        // 결과 가져오기
        let newAssistantTalk = result.answer;
        let correctedSentence = result.corrected;
        let explanation = result.explanation;
        priorAssistantTalk = newAssistantTalk;

        //결과 삽입
        yourSentenceDiv.innerText = userTalk;
        assistantTalkDiv.innerText = newAssistantTalk;

        //고칠 부분이 없을 경우
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

    function init() {

        if (navigator.mediaDevices) {
            const constraints = {audio: true};
            let chunks = [];

            navigator.mediaDevices.getUserMedia(constraints).then(stream => {
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
            console.log(request.response);
            let audioURL = URL.createObjectURL(request.response);
            let audio = new Audio(audioURL);
            audio.play();
        }

        request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
        request.responseType = "blob";
        request.send();
    }


    function sttAjax(formData) {
        let request = new XMLHttpRequest();
        formData.append("priorAssistantTalk", priorAssistantTalk);
        formData.append("learningId", learningId);

        request.onload = () => {
            let responseText = request.responseText;
            getResponse(responseText); //script

            recordButton.style.color = "";
            recordButton.disabled = false;
        }

        formData.enctype = "multipart/form-data";
        request.open("POST", "/learning/dialogue/transcript", false);
        request.send(formData);
    }

    //유저 문장 보내고 교정본 받기
    function getResponse(userTalk) {
        let request = new XMLHttpRequest();

        let formData = new FormData();
        formData.append("priorAssistantTalk", priorAssistantTalk);
        formData.append("userTalk", userTalk);
        formData.append("learningId", learningId);

        request.onload = () => {
            let result = request.response;
            result = JSON.parse(result);
            addContent(result, userTalk); //화면에 출력
        }

        request.open("POST", "/learning/dialogue/talk", false);
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
