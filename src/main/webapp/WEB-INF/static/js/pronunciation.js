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


function setPronunciationRecordBtns() {
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

function stopPronunciationRecording() {
    recorder && recorder.stop();
    setPronunciationBtnsWaiting();
    sendPronunciationToServer();
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