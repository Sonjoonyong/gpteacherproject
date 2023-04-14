<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Speaking</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

    <style>
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

        .assistantTalk {
            background-color: #F4F2FF;
            width: fit-content;
        }
    </style>

</head>

<body onload="mediaStart()">

topic: ${topic} <br>
${question}
<!--**어려움**-->
<form method="post" style="display: none" id="sttForm" action="/learning/learningCorrection"
      enctype="multipart/form-data">
    <input type="file" name="audio" id="audioFile"/>
    <input type="hidden" id="badBoy" name="question" class="question" value="${question}" />
    <input type="hidden" id="badFriend" name="learningTestType" value="${topic}" />
</form>

<%@ include file="../../fragments/header.jsp" %>

<section class="container">

    <h1>Speaking</h1>
    <div>

        <!--TTS-->
        <p>Question: <span id="question">${question}</span></p>
        <button id="startAudio">
            Question 듣기
        </button>

        <br>
    </div>


    <!-- 녹음 버튼 -->
    <div class="row g-0 justify-content-center g-0 gap-3">
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
</section>
<%@ include file="../../fragments/footer.jsp" %>

<!--tts : text to speech -->
<script>
    let startBtn = document.querySelector('#startAudio');
    let initialQuestion = document.querySelector('#question').innerText;
    
    startBtn.onclick = () => {
        let question = initialQuestion;
        setBtnsRecordPossible();
        startBtn.disabled = true;
        ttsAjax(question);
    }

    //녹음 버튼
    let recordButton = document.querySelector("#record");
    let stopButton = document.querySelector("#stop");
    let waitingMessage = document.querySelector('#waitingMessage');

    // 프로그레스 바
    let progress = document.getElementById("progress"); //progress bar
    let b = document.getElementById("time"); // 초 표시할 b태그
    let timer = 0; // 타이머
    let mx = 30; // 최대 시간(초)

    let sttForm = document.querySelector("#sttForm");
    let audioFile = document.querySelector("#audioFile");

    function mediaStart() {

        if (navigator.mediaDevices) {
            const constraints = {audio: true};
            let chunks = [] // 녹음된 내용을 저장할 변수

            // 정상 구현 시
            navigator.mediaDevices.getUserMedia(constraints).then(stream => {
                // 녹음을 시작하고 종료하는 객체
                const mediaRecorder = new MediaRecorder(stream);

                // 녹음 시작
                recordButton.onclick = () => {
                    chunks = []; // 이전에 녹음된 내용이 있으면 초기화
                    mediaRecorder.start();

                    setBtnsRecording();
                }

                // 오디오 저장
                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data);
                }

                // 녹음 종료
                stopButton.onclick = () => {
                    mediaRecorder.stop();
                    setBtnsWaiting();
                }

                // 녹음이 종료되면 서버로 녹음 내용을 보내고 결과를 받아오는 처리 **어려움**
                mediaRecorder.onstop = () => {
                    let file = new File(chunks, "answerFile");
                    console.log(chunks);
                    let temp = new DataTransfer();
                    temp.items.add(file);
                    audioFile.files = temp.files;
                    sttForm.submit();
                }

            }).catch(err => {
                console.log(err);
            });
        } else {
            console.log("미디어 장치 없음");
        }

    }

    function ttsAjax(question) {
        let request = new XMLHttpRequest();

        let urlSearchParams = new URLSearchParams();

        urlSearchParams.append("question", question);

        request.onload = () => {
            console.log(request.response);
            let audioURL = URL.createObjectURL(request.response);
            let audio = new Audio(audioURL);
            audio.play();
        }

        request.open("GET", "/learning/speaking/tts?" + urlSearchParams.toString());
        request.responseType = "blob";
        request.send();
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

</body>
</html>
