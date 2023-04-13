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

	<div class="answer">
		<!--whisper-->
		<H2>대답입력</H2>
		<input type="button" id="record" value="녹음 시작">
		<input type="button" id="stop" value="녹음 중지">
	</div>


	<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
	<script type="text/javascript" src="/js/speakingPracticeTts.js"></script>
	<script type="text/javascript" src="/js/speakingPracticePronunciation.js"></script>

</body>
</html>
