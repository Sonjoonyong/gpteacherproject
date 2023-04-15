<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회화 연습</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>
    <%@ include file="../../fragments/header.jsp" %>

    <style>
        /* scrollbar track 노출 문제 해결 */
        /* Firefox */
        #dialogueBox {
            scrollbar-width: auto;
            scrollbar-color: #a2ddb8 #ffffff;
        }

        /* Chrome, Edge, and Safari */
        #dialogueBox::-webkit-scrollbar {
            width: 16px;
        }

        #dialogueBox::-webkit-scrollbar-track {
            background: #ffffff;
        }

        #dialogueBox::-webkit-scrollbar-thumb {
            background-color: #a2ddb8;
            border-radius: 10px;
            border: 3px solid #ffffff;
        }

        .container {
            max-width: 900px;
        }

        #initialAssistantTalk, #record, #stop, #waitingMessage {
            display: none;
        }

        #stop {
            color: rgb(255, 0, 0);
            width: 45px;
            height: 45px;
            border-color: gray;
        }

        #record {
            width: 45px;
            height: 45px;
            background-color: #5DB99D;
            border-color: #5DB99D;
        }

        .bi-heart-fill {
            color: red;
        }

        .bi-archive-fill {
            color: rgb(57, 116, 25);
        }

        #dialogueBox {
            height: 60vh;
        }

        .assistantTalk {
            background-color: #F4F2FF;
            width: fit-content;
        }
    </style>


</head>
<body onload="init()">

<section class="container">

    <h3 class="h3 text-center my-3" style="color: #5DB99D;">CONVERSATION</h3>
    <p class="text-center">영어 표현을 잘 모르겠으면 한국어로 말해보세요. 영어로 자동 변역됩니다.</p>

    <input type="hidden" id="learningId" value="${learningId}"/>

    <div class="row justify-content-center">
        <button id="startDialogue" class="btn btn-light mt-5 shadow py-2 rounded-3"
                style="width: 150px; color: #5DB99D">
            대화 시작하기
        </button>
    </div>

    <div id="dialogueBox" class="row align-content-start overflow-scroll p-2 my-3">

        <div class="col-10 col-lg-8 me-auto">
            <div class="row g-0">
                <div>
                    <div class="col assistantTalk rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;"
                         id="initialAssistantTalk">
                        ${assistantTalk}
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- dialogueBox end -->

    <!-- 녹음 버튼 -->
    <div class="row g-0 justify-content-center g-0 gap-3 mb-5">
        <div class="row justify-content-center">
            <button id="record" class="btn rounded-circle text-center p-0 shadow" disabled>
                <i class="bi bi-mic fs-2" style="color: white"></i>
            </button>
            <button id="stop" class="btn rounded-circle fs-5 text-center p-0 shadow" disabled>
                <i class="bi bi-square-fill"></i>
            </button>
        </div>

        <div id="waitingMessage" class="row justify-content-center">
            <div class="col-12 text-center mb-2">
                <div class="spinner-border text-secondary" role="status"></div>
            </div>
            <div class="col-12 text-center">문장을 분석중입니다.</div>
        </div>

        <div class="row justify-content-center align-items-center" style="max-width: 400px;">
            <div class="col-2 align-self-center"></div><!--dummy-->
            <progress class="col-8" id="progress" value="0" min="0" max="10" style="display:none;"></progress>
            <b id="time" class="col-2"></b>
        </div>
    </div>

    <form method="get" action="/learning/correction/sentences">
        <input type="hidden" name="learningId" value="${learningId}">
        <div class="row justify-content-center">
            <input type="submit" id="stopDialogue" value="대화 그만하기"
                   class="btn btn-success shadow my-3 border-0 py-2 rounded-3"
                   style="width:120px; background-color: #5DB99D;">
        </div>
    </form>

</section>

<%@ include file="../../fragments/footer.jsp" %>

<%-- 채팅 템플릿 --%>
<template>
    <div class="dialogue row p-2">
        <!-- userTalk start -->
        <div class="col-10 ms-auto my-3 shadow rounded-3"> <!--sentenceId 설정-->

            <div class="row g-0 py-3 gap-2">

                <div class="userTalk col g-0 justify-content-center">
                    <div class="row px-0">
                        <div class="col-12 col-md-6">
                            <div class="fw-bold" style="color: #2A6976;">
                                Your sentence
                            </div>
                            <div class="yourSentence border p-1 rounded-1">
                                elit. Iusto, exercitationem deserunt omnis molestiae laborum
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="fw-bold" style="color: #16967A;">
                                Corrected sentence <i class="bi bi-play-fill playBtn"></i>
                            </div>
                            <div class="correctedSentence border p-1 rounded-1">
                                delectus dolore vero quidem laudantium eaque nemo!
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-0 align-items-end justify-content-between">
                    <div class="col-12 col-md-10">
                        <div class="fw-bold" style="color: #2F4858;">Explanation</div>
                        <div class="explanation border p-1 rounded-1">
                            교정에 대한 설명
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="row g-0">
                            <button class="col-1 col-md-5 btn ms-md-auto" id="like" onclick="statusUpdateAjax(this)">
                                <i class="bi bi-heart" id="emptyHeart"></i>
                                <i class="bi bi-heart-fill danger" id="fillHeart"></i>
                            </button>


                            <button class="col-1 col-md-5 btn" id="storage" onclick="statusUpdateAjax(this)">
                                <i class="bi bi-archive" id="emptyStorage"></i>
                                <i class="bi bi-archive-fill danger" id="fillStorage"></i>
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- userTalk end -->

        <!--assistantTalk-->
        <div class="col-10 col-lg-8 me-auto">
            <div class="row g-0">
                <div>
                    <div class="assistantTalk rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;">
                        ${assistantTalk}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--dialogue end-->
</template>

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
    let waitingMessage = document.querySelector('#waitingMessage')

    // 프로그레스 바
    let progress = document.getElementById("progress"); //progress bar
    let b = document.getElementById("time"); // 초 표시할 b태그
    let timer = 0; // 타이머
    let mx = 10; // 최대 시간(초)

    let startDialogueBtn = document.querySelector('#startDialogue');

    startDialogueBtn.onclick = () => {
        ttsAjax(initialAssistantTalk);
        startDialogueBtn.style.display = 'none';
        initialAssistantTalkDiv.style.display = 'block';
        setBtnsRecordPossible();
    }

    function retry() {
        alert("잘못된 문장입니다. 다시 응답해주세요.");
        if (audio) {
            audio.pause();
        }
        setBtnsRecordPossible();
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
                    progress.setAttribute("max", mx * 100); //프로그래스 바 최대 값 설정
                    let time = 0; //시간 초기화
                    timer = setInterval(() => {
                        time = time + 1;
                        let realtime = parseInt(time / 100);
                        // 상태바 진행
                        b.innerText = (mx - realtime) + " s";
                        progress.value = time;

                        if (realtime == mx) { // 시간 제한
                            stopRecording(mediaRecorder, timer)
                        }
                    }, 10);

                    setBtnsRecording();
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

            setBtnsRecordPossible();
        }

        formData.enctype = "multipart/form-data";
        request.open("POST", "/learning/dialogue/transcript", true);
        request.send(formData);
    }

    function addContent(result) {
        // 대화창
        let dialogueBox = document.getElementById("dialogueBox");
        let dialogueDiv = document.getElementsByTagName('template')[0].content.cloneNode(true).firstElementChild;

        let yourSentenceDiv = dialogueDiv.querySelector('.yourSentence');
        let correctedSentenceDiv = dialogueDiv.querySelector('.correctedSentence');
        let explanationDiv = dialogueDiv.querySelector('.explanation');
        let assistantTalkDiv = dialogueDiv.querySelector('.assistantTalk');

        //좋아요 & 보관함
        let likeBtn = dialogueDiv.querySelector('#like');
        let fillHeart = dialogueDiv.querySelector('#fillHeart');
        let storageBtn = dialogueDiv.querySelector('#storage');
        let fillStorage = dialogueDiv.querySelector('#fillStorage');

        // 결과 가져오기
        if (!result || result.result === "fail") {
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
        storageBtn.value = sentenceId;
        fillHeart.style.display = 'none';
        fillStorage.style.display = 'none';

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
        dialogueBox.scrollTop = dialogueBox.scrollHeight;
        // GPT 답변 읽어주기
        ttsAjax(newAssistantTalk)
    }

    function statusUpdateAjax(btn) {
        let request = new XMLHttpRequest();
        let sentenceId = btn.value;
        let type = btn.getAttribute('id'); //like or storage

        request.onload = () => {
            let status = request.response;
            if (status == "1") {
                btn.children[0].style.display = 'none'; //emptyHeart or emptyStorage
                btn.children[1].style.display = 'block'; //fillHeart or fillStorage
            } else {
                btn.children[0].style.display = 'block';
                btn.children[1].style.display = 'none';
            }
        }

        request.open("GET", "/learning/sentence/statusUpdate?sentenceId=" + sentenceId + "&type=" + type);
        request.send();
    }

    function stopRecording(mediaRecorder, timer) {
        mediaRecorder.stop();
        setBtnsWaiting()
    }

    // 녹음 시작 가능
    function setBtnsRecordPossible() {
        recordButton.disabled = false;
        recordButton.style.display = 'block';
        stopButton.disabled = true;
        stopButton.style.display = 'none';
        waitingMessage.style.display = 'none';
    }

    // 녹음 중
    function setBtnsRecording() {
        progress.style.display = "inline";
        recordButton.disabled = true;
        recordButton.style.display = 'none';
        stopButton.disabled = false;
        stopButton.style.display = 'block';
        waitingMessage.style.display = 'none';
    }

    // 대기 중
    function setBtnsWaiting() {
        // 상태바 초기화
        b.innerText = "";
        progress.value = 0;
        progress.style.display = "none";
        clearInterval(timer); // 타이머 초기화

        recordButton.disabled = true;
        recordButton.style.display = 'none';
        stopButton.disabled = true;
        stopButton.style.display = 'none';
        waitingMessage.style.display = 'block';
    }

</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

<%--Wav 파일 업로드 라이브러리--%>
<%--<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>--%>

<%--<script type="text/javascript" src="/js/dialoguePracticeTts.js"></script>--%>
<%--<script type="text/javascript" src="/js/dialoguePracticePronunciation.js"></script>--%>

</body>
</html>
