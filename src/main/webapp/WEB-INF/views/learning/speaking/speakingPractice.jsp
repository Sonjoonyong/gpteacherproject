<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Quesion+speaking</title>
</head>
<body onload="mediaStart()">
<h1>Speaking</h1>
<div class="QQQ">

	<form action="${pageContext.request.contextPath}/learning/correction" method="post">
		<input type="hidden" name="action" value="submit">
		<input type="hidden" name="topic" value="${topic}" />
		<input type="hidden" name="question" value="${question}" />
		<p>Question: <span>${question}</span></p>

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
		let question= "${question}";
		ttsAjax(question);
	})

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
</script>



<!--whisper : speech to text-->
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
			console.log(responseText);
			document.querySelector("#textarea").innerText = responseText;
			recordButton.style.color = "";
			recordButton.disabled = false;

		}


		request.open("POST", "/learning/stt", false);
		request.send(formData);

	}
</script>

</body>
</html>
