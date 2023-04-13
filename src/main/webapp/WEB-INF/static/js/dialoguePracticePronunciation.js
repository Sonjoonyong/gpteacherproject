<!-- Recorder.js (for wav file export)-->
let script = document.querySelector('#script');
let recordButton = document.querySelector("#record");
let stopButton = document.querySelector("#stop");

let recorder;
stopButton.disabled = true;

function init() {
    if (navigator.mediaDevices) {
        navigator.mediaDevices.getUserMedia({audio: true}).then(stream => {
            let audioContext = new AudioContext();
            let input = audioContext.createMediaStreamSource(stream);
            recorder = new Recorder(input);

            recordButton.onclick = () => {
                recorder && recorder.record();

                recordButton.style.backgroundColor = "red";
                recordButton.style.color = "white";
                recordButton.disabled = true;
                stopButton.disabled = false;
            }

            stopButton.onclick = () => {
                recorder && recorder.stop();
                recordButton.style.backgroundColor = "";
                stopButton.disabled = true;
                recordButton.disabled = true;
                sendToServer();
                recorder.clear();
            }

        }).catch(err => {
            console.log(err);
        });
    } else {
        console.log("미디어 장치 없음");
    }
}

function sendToServer() {
    // wav 파일로 전송
    recorder && recorder.exportWAV(function (blob) {
        // 서버로 전송
        let formData = new FormData();
        formData.append("audio", blob);
        formData.append("userTalk", script.innerText);
        ajax(formData);
    });
}

function ajax(formData) {
    let request = new XMLHttpRequest();

    request.onload = () => {
        let responseText = request.responseText;
        console.log(responseText);
        document.querySelector('#textarea').innerText = responseText;

        recordButton.style.color = "";
        recordButton.disabled = false;
    }

    request.open("POST", "/learning/dialogue/pronunciation", true);
    request.send(formData);
}
