<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회화 연습</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>
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

        #initialAssistantTalk, #record, #stop, #waitingMessage, #stopDialogue {
            display: none;
        }

        #stop, #pronunciationStop {
            color: rgb(255, 0, 0);
            width: 45px;
            height: 45px;
            border-color: gray;
        }

        #record, #pronunciationRecord {
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
        }

        #pronunciationModal {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 2;

            width: 100%;
            height: 100%;

            display: none;
            background-color: rgba(0, 0, 0, 0.4);
        }

        #pronunciationModal.show {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #pronunciationModalBody {
            position: absolute;
            width: 500px;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            background-color: white;
        }

        *:disabled {
            border: none;
        }

    </style>


</head>
<body onload="init()">

<%@ include file="../../fragments/header.jsp" %>

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

        <div id="initialAssistantTalk" class="col-10 col-lg-8 me-auto">
            <div class="row g-0">
                <div class="col-1 d-flex py-2 my-2 me-2 align-items-start">
                    <img src="/images/favicon.ico" class="shadow rounded-circle" height="35px" alt="bot image">
                </div>
                <div class="assistantTalk col-10 rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;">
                    ${assistantTalk}
                </div>
            </div>
        </div>

    </div>
    <!-- dialogueBox end -->

    <div class="row g-0 justify-content-center g-0 gap-3 mb-5">
        <!-- 녹음 시작 -->
        <div class="row justify-content-center">
            <button id="record" class="btn rounded-circle text-center p-0 shadow" disabled>
                <i class="bi bi-mic fs-2" style="color: white"></i>
            </button>
            <!-- 녹음 종료 -->
            <button id="stop" class="btn rounded-circle fs-5 text-center p-0 shadow" disabled>
                <i class="bi bi-square-fill"></i>
            </button>
        </div>

        <!-- 프로그레스 바 -->
        <div class="row justify-content-center align-items-center" style="max-width: 400px;">
            <div class="col-2 align-self-center"></div><!--dummy-->
            <progress class="col-8" id="progress" value="0" max="10" style="display:none;"></progress>
            <b id="time" class="col-2"></b>
        </div>

        <!-- 분석 중 -->
        <div id="waitingMessage" class="row justify-content-center">
            <div class="col-12 text-center mb-2">
                <div class="spinner-border text-secondary" role="status"></div>
            </div>
            <div class="col-12 text-center">문장을 분석 중입니다.</div>
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

<!-- 발음해보기 모달 -->
<div id="pronunciationModal">
    <div id="pronunciationModalBody" class="shadow rounded-3 p-4 gap-2">
        <div id="pronunciationResult" class="fw-bold" style="color: #3b9d7f">
            녹음 버튼을 누르고 아래 문장을 큰 목소리로 발음해 보세요.
            <!-- 정확도 100% 입니다! -->
        </div>
        <!-- 목표 스크립트 -->
        <div class="border p-1 rounded-1 d-flex align-self-stretch my-3 p-2">
            <!-- 문장 듣기 버튼 -->
            <button id="pronunciationTtsBtn" class="btn col-1 p-0 d-flex align-items-center">
                <i class="bi bi-volume-up-fill"></i>
            </button>
            <div id="pronunciationTargetScript">
                pronunciationTargetScript

            </div>
        </div>
        <!-- 녹음 시작 -->
        <div class="justify-content-center">
            <button id="pronunciationRecord" class="btn rounded-circle text-center p-0 shadow">
                <i class="bi bi-mic fs-2" style="color: white"></i>
            </button>
            <!-- 녹음 종료 -->
            <button id="pronunciationStop" class="btn rounded-circle fs-5 text-center p-0 shadow">
                <i class="bi bi-square-fill"></i>
            </button>
        </div>

        <!-- 프로그레스 바 -->
        <div class="d-flex justify-content-center align-items-center" style="width: 300px">
            <div class="col-2 align-self-center"></div><!--dummy-->
            <progress class="col-8 me-1" id="pronunciationProgress" value="0" max="10" style="display:none;"></progress>
            <b id="pronunciationTime" class="col-2"></b>
        </div>

        <!-- 분석 중 -->
        <div id="pronunciationWaitingMessage" class="row justify-content-center my-3">
            <div class="col-12 text-center mb-2">
                <div class="spinner-border text-secondary" role="status"></div>
            </div>
            <div class="col-12 text-center">발음을 분석 중입니다.</div>
        </div>
        <button id="pronunciationClose" class="btn btn-secondary">
            닫기
        </button>
    </div>
</div>
</div>
<!-- 발음해보기 모달 끝 -->

<%@ include file="../../fragments/footer.jsp" %>

<%-- 채팅 템플릿 --%>
<template>
    <div class="dialogue row">
        <!-- userTalk start -->
        <div class="col-10 ms-auto my-3 shadow rounded-3">

            <div class="row g-0 py-3 gap-2">

                <div class="row g-0 align-items-end justify-content-between">
                    <div class="row px-0 g-0">
                        <div class="col-12 col-md-6 pe-1">
                            <div class="fw-bold" style="color: #2A6976;">
                                Your sentence

                            </div>
                            <div class="row g-0 justify-content-between border p-1 rounded-1">
                                <span class="yourSentence col-11 p-0">
                                    elit. Iusto, exercitationem de se ru nt om nis molestiae laborum
                                </span>
                                <!-- 발음해보기 버튼-->
                                <button class="btn pronunciationBtn col-1 p-0">
                                    <i class="bi bi-mic" style="color: red;"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 ps-1">
                            <div class="row g-0 fw-bold justify-content-between align-content-center">
                                <span class="col-12 col-md-8" style="color: #16967A;">
                                    Corrected sentence
                                </span>
                                <span class="col-12 col-md-4 pronunciationAccuracy"
                                      style="font-size: 12px; line-height: 24px; font-weight: lighter; color: rgb(35, 28, 181);">
                                        <!-- 발음 정확도: 90% -->
                                </span>
                            </div>
                            <div class="row g-0 justify-content-between border p-1 rounded-1">
                                <!-- 문장 듣기 버튼 -->
                                <button class="btn ttsBtn col-1 p-0">
                                    <i class="bi bi-volume-up-fill"></i>
                                </button>
                                <span class="col-11 p-0 correctedSentence">
                                        delectus dolore vero quidem laudantium eaque nemo!
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-10">
                        <div class="fw-bold" style="color: #2F4858;">Explanation</div>
                        <div class="explanation border p-1 rounded-1">
                            교정에 대한 설명
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="row g-0">
                            <button class="col-1 col-md-5 btn ms-md-auto" id="like"
                                    onclick="statusUpdateAjax(this)">
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
                <div class="col-1 d-flex py-2 my-2 me-2 align-items-start">
                    <img src="/images/favicon.ico" class="shadow rounded-circle" height="35px" alt="bot image">
                </div>
                <div class="assistantTalk col-9 rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;">
                    GPT의 톡
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


<!--Wav 파일 업로드 라이브러리-->
<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>

<script>
    const learningId = document.querySelector('#learningId').value;
    const initialAssistantTalkDiv = document.querySelector('#initialAssistantTalk');
    const initialAssistantTalk = initialAssistantTalkDiv.innerText;
    const body = document.querySelector('body');

    let priorAssistantTalk = initialAssistantTalk;
    let audio;


    // 발음 평가 녹음 관련
    let recorder;
    let targetSentenceId;
    document.querySelector('pronunciation')
    const pronunciationRecordButton = document.querySelector('#pronunciationRecord');
    const pronunciationStopButton = document.querySelector('#pronunciationStop');
    const pronunciationWaitingMessage = document.querySelector('#pronunciationWaitingMessage');
    const pronunciationClose = document.querySelector('#pronunciationClose');
    const pronunciationModal = document.querySelector('#pronunciationModal');
    const pronunciationTargetScriptDiv = document.querySelector('#pronunciationTargetScript');
    const pronunciationResultDiv = document.querySelector('#pronunciationResult');
    const pronunciationTtsBtn = document.querySelector('#pronunciationTtsBtn');
    pronunciationTtsBtn.onclick = () => {
        ttsAjax(pronunciationTargetScriptDiv.innerText);
    }

    function closePronunciationModal() {
        pronunciationModal.classList.toggle('show', false);
    }

    pronunciationClose.onclick = closePronunciationModal;

    // 발음 평가 프로그레스 바
    const pronunciationProgress = document.getElementById("pronunciationProgress"); //progress bar
    const pronunciationB = document.getElementById("pronunciationTime"); // 초 표시할 b태그
    let pronunciationTimer = 0; // 타이머
    const pronunciationMx = 10; // 최대 시간(초)


    // 유저 톡 녹음 관련
    const recordButton = document.querySelector('#record');
    const stopButton = document.querySelector('#stop');
    const waitingMessage = document.querySelector('#waitingMessage');

    // 프로그레스 바
    const progress = document.getElementById("progress"); //progress bar
    const b = document.getElementById("time"); // 초 표시할 b태그
    let timer = 0; // 타이머
    let mx = 10; // 최대 시간(초)

    // 대화 시작하기 버튼
    const startDialogueBtn = document.querySelector('#startDialogue');
    const stopDialogueBtn = document.querySelector('#stopDialogue');

    startDialogueBtn.onclick = () => {
        ttsAjax(initialAssistantTalk);
        startDialogueBtn.style.display = 'none';
        initialAssistantTalkDiv.style.display = 'block';
        stopDialogueBtn.style.display = 'block';
        setBtnsRecordPossible();
    }

    function retry() {
        Swal.fire({
            icon: 'error',
            title: '다시 입력해주세요.',
            text: '부적절한 답변입니다.',
        });
        if (audio) {
            audio.pause();
        }
        setBtnsRecordPossible();
    }

    function init() {
        if (navigator.mediaDevices) {
            let chunks = [];
            navigator.mediaDevices.getUserMedia({audio: true}).then(stream => {
                // 유저 답변용 오디오 초기화
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
                    stopRecording(mediaRecorder, timer);
                }

                // 녹음이 종료되면 서버로 전송 및 결과 수신
                mediaRecorder.onstop = () => {
                    const blob = new Blob(chunks, {'type': 'audio/webm codecs=opus'});

                    let formData = new FormData();
                    formData.append("audio", blob);
                    sttAjax(formData);
                }

                // 발음 평가용 오디오 컨텍스트 초기화
                let audioContext = new AudioContext();
                let input = audioContext.createMediaStreamSource(stream);
                recorder = new Recorder(input);

                // 발음 평가 모달 녹음 버튼 설정
                pronunciationRecordButton.onclick = () => {
                    recorder && recorder.record();
                    setPronunciationBtnsRecording();

                    // 발음 평가 타이머 시작
                    pronunciationProgress.setAttribute("max", pronunciationMx * 100); //프로그래스 바 최대 값 설정
                    let time = 0;
                    pronunciationTimer = setInterval(() => {
                        time = time + 1;
                        let realtime = parseInt(time / 100);
                        pronunciationB.innerText = (pronunciationMx - realtime) + " s";
                        pronunciationProgress.value = time;

                        if (realtime == pronunciationMx) {
                            stopPronunciationRecording();
                        }
                    }, 10);

                    setPronunciationBtnsRecording();
                }

                pronunciationStopButton.onclick = () => {
                    stopPronunciationRecording();
                }

            }).catch(err => {
                console.log(err);
            });
        } else {
            console.log("미디어 장치 없음");
        }
    }

    // 발음 데이터 전송
    function sendPronunciationToServer() {
        // wav 파일로 전송
        recorder && recorder.exportWAV(function (blob) {
            // 서버로 전송
            let formData = new FormData();
            formData.append("audio", blob);
            formData.append("userTalk", pronunciationTargetScriptDiv.innerText);
            formData.append("sentenceId", targetSentenceId);
            pronunciationAjax(formData);
            recorder.clear();
        });
    }

    // 발음 평가 결과 수신
    function pronunciationAjax(formData) {
        let request = new XMLHttpRequest();

        request.onload = () => {
            let responseText = request.responseText;

            if (responseText != '다시 발음해주세요.') {
                pronunciationResultDiv.innerHTML = '발음 정확도 <b>' + responseText + '%</b> 입니다.';
                let targetSentence = document.querySelector('#' + 'sentence_' + targetSentenceId);
                let pronunciationAccuracySpan = targetSentence.querySelector('.pronunciationAccuracy');
                pronunciationAccuracySpan.innerText = '발음 정확도: ' + responseText + '%';
            } else {
                pronunciationResultDiv.innerText = responseText;
            }

            setPronunciationBtnsRecordPossible();
        }

        request.open("POST", "/learning/dialogue/pronunciation", true);
        request.send(formData);
    }

    function ttsAjax(assistantTalk) {
        if (audio) {
            audio.pause();
        }
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

    // 유저 톡 서버에 전송 후 결과 수신
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
        let correctedSentenceSpan = dialogueDiv.querySelector('.correctedSentence');
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
        dialogueDiv.id = 'sentence_' + sentenceId;

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
            correctedSentenceSpan.innerText = userTalk;
            explanationDiv.innerText = "No correction needed. Perfect!";
        } else {
            correctedSentenceSpan.innerText = correctedSentence;
            explanationDiv.innerText = explanation;
        }

        // 교정문 듣기
        let ttsBtn = dialogueDiv.querySelector('.ttsBtn');
        ttsBtn.onclick = () => {
            ttsAjax(correctedSentence);
        }

        // 발음 평가 버튼 설정
        let pronunciationBtn = dialogueDiv.querySelector('.pronunciationBtn');
        pronunciationBtn.onclick = () => {
            pronunciationResultDiv.innerText = '녹음 버튼을 누르고 아래 문장을 큰 목소리로 발음해 보세요.';
            // 발음 평가받을 스크립트 변경
            pronunciationTargetScriptDiv.innerText = correctedSentence;
            targetSentenceId = sentenceId;

            // 발음 평가 모달 창 띄우기
            setPronunciationBtnsRecordPossible();
            pronunciationModal.classList.toggle('show', true);
            body.style.overflow = 'hidden';

            // 진행중인 TTS 종료
            if (audio) {
                audio.pause();
            }
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

        request.open("GET", '/learning/sentence/statusUpdate?sentenceId=' + sentenceId + '&type=' + type);
        request.send();
    }

    function stopRecording(mediaRecorder, timer) {
        mediaRecorder.stop();
        setBtnsWaiting()
    }

    function stopPronunciationRecording() {
        recorder && recorder.stop();
        setPronunciationBtnsWaiting();
        sendPronunciationToServer();
    }

    // 녹음 시작 가능
    function setBtnsRecordPossible() {
        recordButton.disabled = false;
        recordButton.style.display = 'block';
        stopButton.disabled = true;
        stopButton.style.display = 'none';
        waitingMessage.style.display = 'none';
        progress.style.display = 'none';
        clearInterval(timer); // 타이머 초기화
        setBtnsDisabled(false);
    }

    // 녹음 중
    function setBtnsRecording() {
        progress.style.display = "inline";
        recordButton.disabled = true;
        recordButton.style.display = 'none';
        stopButton.disabled = false;
        stopButton.style.display = 'block';
        waitingMessage.style.display = 'none';
        setBtnsDisabled(true);
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

    // 발음평가 녹음 시작 가능
    function setPronunciationBtnsRecordPossible() {
        pronunciationTtsBtn.disabled = false;
        pronunciationRecordButton.disabled = false;
        pronunciationRecordButton.style.display = 'block';
        pronunciationStopButton.disabled = true;
        pronunciationStopButton.style.display = 'none';
        pronunciationWaitingMessage.style.display = 'none';
        pronunciationClose.style.display = 'block';
    }

    // 발음평가 녹음 중
    function setPronunciationBtnsRecording() {
        pronunciationTtsBtn.disabled = true;
        pronunciationProgress.style.display = "inline";
        pronunciationRecordButton.disabled = true;
        pronunciationRecordButton.style.display = 'none';
        pronunciationStopButton.disabled = false;
        pronunciationStopButton.style.display = 'block';
        pronunciationWaitingMessage.style.display = 'none';
        pronunciationClose.style.display = 'none';
    }

    // 발음평가 대기 중
    function setPronunciationBtnsWaiting() {
        // 상태바 초기화
        pronunciationTtsBtn.disabled = true;
        pronunciationB.innerText = "";
        pronunciationProgress.value = 0;
        pronunciationProgress.style.display = "none";
        clearInterval(pronunciationTimer); // 타이머 초기화

        pronunciationRecordButton.disabled = true;
        pronunciationRecordButton.style.display = 'none';
        pronunciationStopButton.disabled = true;
        pronunciationStopButton.style.display = 'none';
        pronunciationWaitingMessage.style.display = 'block';
        pronunciationClose.style.display = 'none';
    }

    function setBtnsDisabled(bool) {
        let pronunciationBtns = document.getElementsByClassName('pronunciationBtn');
        for (btn of pronunciationBtns) {
            btn.disabled = bool;
        }

        let ttsBtns = document.getElementsByClassName('ttsBtn');
        for (btn of ttsBtns) {
            btn.disabled = bool;
        }
    }

</script>

<!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

<%--<script type="text/javascript" src="/js/dialoguePracticePronunciation.js"></script>--%>

</body>
</html>
