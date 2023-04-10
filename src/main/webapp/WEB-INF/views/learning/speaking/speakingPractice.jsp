<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OpenAI Whisper</title>
</head>
<body onload="mediaStart()">

<a href="/">홈으로</a>
<br>

<h1>whisper</h1>
<br>
<input type="button" id="record" value="녹음 시작">
<input type="button" id="stop" value="녹음 중지">
<br>
<br>
<textarea rows="10" cols="100" id="textarea"></textarea>

<script>
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
                    ajax(formData);
                }

            }).catch(err => {
                console.log(err);
            });
        } else {
            console.log("미디어 장치 없음");
        }

    }

    function ajax(formData) {
        let request = new XMLHttpRequest();

        request.onload = () => {
            let responseText = request.responseText;
            document.querySelector('#textarea').innerText = responseText;

            recordButton.style.color = "";
            recordButton.disabled = false;
        }

        request.open("POST", "/gpt/whisper", false);
        request.send(formData);
    }
</script>
</body>
</html>