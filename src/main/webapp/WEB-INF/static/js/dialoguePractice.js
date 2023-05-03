const learningId = document.querySelector('#learningId').value;
const initialAssistantTalkDiv = document.querySelector('#initialAssistantTalk');
const initialAssistantTalk = initialAssistantTalkDiv.querySelector('.assistantTalk').innerText;

let priorAssistantTalk = initialAssistantTalk;
let audio;

// 유저 톡 녹음 관련
const recordButton = document.querySelector('#record');
const stopButton = document.querySelector('#stop');
const waitingMessage = document.querySelector('#waitingMessage');

// 프로그레스 바
const progress = document.getElementById("progress"); //progress bar
const b = document.getElementById("time"); // 초 표시할 b태그
let timer = 0; // 타이머
let mx = 1500; // 최대 시간(초)

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

                    if (realtime === 2) { // 2초 이상 제출 가능
                        stopButton.disabled = false;
                        progress.style.accentColor = '';
                    }

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
                checkProfanity(formData);
            }

            // 발음 평가용 오디오 컨텍스트 초기화
            let audioContext = new AudioContext();
            let input = audioContext.createMediaStreamSource(stream);
            recorder = new Recorder(input);

            // 발음 평가 모달 녹음 버튼 설정
            setPronunciationRecordBtns();

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
        let result = request.response;
        console.log(result);
        if (result.profanity == 'true') {
            Swal.fire({
                icon: 'error',
                title: '부적절한 문장이 포함되어 있습니다.',
                text: '바른 말을 사용해 주세요.'
            });
            setBtnsRecordPossible();
        } else {
            let data = new FormData();
            data.append("userTalk", result.userScript);
            sttAjax(data);
        }
    }

    formData.enctype = "multipart/form-data";
    request.open("POST", "/learning/sentence/profanity", true);
    request.responseType = "json";
    request.send(formData)
}

// 유저 톡 서버에 전송 후 결과 수신
function sttAjax(formData) {
    let request = new XMLHttpRequest();
    formData.append("priorAssistantTalk", priorAssistantTalk);
    formData.append("learningId", learningId);
    request.responseType = "json";

    request.onload = () => {
        //화면에 출력
        addContent(request.response);

        setBtnsRecordPossible();
    }

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

    // 결과 가져오기
    if (!result || result.result === "fail") {
        retry();
        return false;
    }
    let newAssistantTalk = result.answer;
    let correctedSentence = result.correctedSentence;
    let explanation = result.explanation;
    let userTalk = result.userTalk;
    let sentenceId = result.sentenceId;
    priorAssistantTalk = newAssistantTalk;
    dialogueDiv.querySelector('.sentence').id = 'sentence_' + sentenceId;

    // 결과 삽입
    yourSentenceDiv.innerText = userTalk;
    assistantTalkDiv.innerText = newAssistantTalk;

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
        document.querySelector('body').style.overflow = 'hidden';

        // 진행중인 TTS 종료
        audio && audio.pause();
    }

    // 화면에 추가
    dialogueBox.appendChild(dialogueDiv);
    dialogueBox.scrollTop = dialogueBox.scrollHeight;
    // GPT 답변 읽어주기
    ttsAjax(newAssistantTalk)
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
    progress.style.accentColor = 'gray';
    progress.style.display = 'none';
    clearInterval(timer); // 타이머 초기화
    setBtnsDisabled(false);
}

// 녹음 중
function setBtnsRecording() {
    progress.style.display = "inline";
    recordButton.disabled = true;
    recordButton.style.display = 'none';
    // stopButton.disabled = false; // 녹음 시작 2초 후 타이머에서 disable 해제
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