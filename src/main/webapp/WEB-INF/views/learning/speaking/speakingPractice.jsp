<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Quesion+speaking</title>
</head>
<body>
	<h1>Speaking</h1>
	<div class="question">

		<form action="${pageContext.request.contextPath}/learning/correction" method="post">
			<input type="hidden" name="action" value="submit">
			<input type="hidden" name="topic" value="${topic}" />
			<input type="hidden" name="question" value="${question}" />
			<p>Question: <span>${assistantQuestion}</span></p>
			<!--<label for="answer">Answer: </label>
			<textarea name="answer" id="answer"></textarea>
			<br>
			<input type="submit" value="Submit">-->
		</form>
		<!--TTS-->
		<button id="startAudio">
			Question 듣기
		</button>
		<br>
	</div>


	<!--whisper-->
	<H2>대답입력</H2>
	<input type="button" id="record" value="녹음 시작">
	<input type="button" id="stop" value="녹음 중지">

	<textarea rows="10" cols="100" id="textarea"></textarea>





	<!--tts : text to speech -->
	<script>
		document.querySelector('#startAudio').addEventListener("click",() => {
			let assistantQuestion = "${assistantQuestion}";
			ttsAjax(assistantQuestion);
		})

		function ttsAjax(assistantQuestion) {
			let request = new XMLHttpRequest();

			let urlSearchParams = new URLSearchParams();

			urlSearchParams.append("assistantQuestion", assistantQuestion);

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
	</script>

	<!--whisper : speech to text-->
	<script>
		let recordButton = document.querySelector("#record");
		let stopButton = document.querySelector("#stop");
		let recorder;
		stopButton.disabled = true;

		function init() {
			if (navigator.mediaDevices) {
				navigator.mediaDevices.getUserMedia({audio: true}).then(stream => {
					let audioContext = new AudioContext();
					let input = audioContext.createMediaStreamSource(stream);
					recorder = new MediaRecorder(input);

					recordButton.onclick = ()  => {
						recorder && recorder.start();

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
			recorder && recorder.exports(function (blob) {
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
				document.querySelector("#textarea").innerText = responseText;

				recordButton.style.color = "";
				recordButton.disabled = false;
			}

			request.open("POST", "/learning/speaking/speakingPractice", true);
			request.send(formData);
		}
	</script>



</body>
</html>
