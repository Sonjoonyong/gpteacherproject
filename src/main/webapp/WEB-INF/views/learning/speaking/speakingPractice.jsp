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

<form method="post" style="display: none" id="sttForm" action="/learning/correction/script"
      enctype="multipart/form-data">
    <input type="file" name="audio" id="audioFile"/>
    <input type="hidden" name="question" class="question" value="${question}"/>
    <input type="hidden" name="learningTestType" value="${learningTestType}"/>
</form>

<%@ include file="../../fragments/header.jsp" %>

<section class="container">

    <h3 class="h3 text-center my-3" style="color: #5DB99D;">SPEAKING</h3>
    <p class="text-center">주어진 문장에 음성으로 답변하세요.</p>

    <!--TTS-->
    <div class="row g-0 justify-content-center">
        <div id="question" class="assistantTalk rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;">
            ${question}
        </div>
    </div>

    <div class="row justify-content-center">
        <button id="startAudio" class="btn shadow" style="background-color: #5DB99D; color: white; width: 200px">
            Question 듣기
        </button>
    </div>

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
        startBtn.style.display = 'none';
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
                    mediaRecorder.stop();
                    setBtnsWaiting();
                }

                // 녹음이 종료되면 서버로 녹음 내용을 보내고 결과를 받아오는 처리 **어려움**
                mediaRecorder.onstop = () => {
                    const blob = new Blob(chunks, {'type': 'audio/webm codecs=opus'});

                    let formData = new FormData();
                    formData.append("audio", blob);

                    let file = new File(chunks, "answerFile");
                    console.log(chunks);
                    let temp = new DataTransfer();
                    temp.items.add(file);
                    audioFile.files = temp.files;
                    checkProfanity(formData);
                    // sttForm.submit();
                }

            }).catch(err => {
                console.log(err);
            });
        } else {
            console.log("미디어 장치 없음");
        }

    }

    function checkProfanity(formData) {
        let request = new XMLHttpRequest();

        request.onload = () => {
            let profanity = request.response;

            if (profanity == 'true') {
                alert("부적절한 문장입니다. 바른 말을 사용해 주세요.");
                setBtnsRecordPossible();
            } else {
                sttForm.submit()
            }
        }

        formData.enctype = "multipart/form-data";
        request.open("POST","/learning/sentence/profanity", true);
        request.send(formData)
    }

    function stopRecording(mediaRecorder, timer) {
        mediaRecorder.stop();
        setBtnsWaiting()
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
