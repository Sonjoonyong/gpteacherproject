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

		<button id="startAudio">
			Question 듣기
		</button>
		<br>
	</div>

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


</body>
</html>
