<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body onload="init()">

<div id="dialogueBox">

    <button id="startAudio">
        대화 시작하기
    </button>

    <%--질문--%>
    <div class="question">
        <span>${assistantTalk}</span>
    </div>

    <br>

    <%--답변--%>
    <div class="answer">
        <div style="display: flex;">
            <div class="yourSentence">
                <div>Your sentence</div>
                <div>Eating is one of my major interest</div>
            </div>

            <div class="correctedSentence">
                <div>Corrected sentence</div>
                <div>Eating is one of my major interests</div>
            </div>
        </div>

        <div style="display: flex;">
            <div class="explanation">
                <div>Explanation</div>
                <div>"interest" should be plural</div>
            </div>
            <button>좋아요</button>
            <button>보관함에 넣기</button>
        </div>

    </div>

</div>

<br><br><br><br>
<input type="button" id="record" value="녹음 시작">
<input type="button" id="stop" value="녹음 중지">
발음해보세요: <div id="script">Peter Piper picked a peck of pickled peppers</div>
<textarea rows="10" cols="100" id="textarea"></textarea>
<br><br><br><br>

<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
<script type="text/javascript" src="/js/dialoguePracticeTts.js"></script>
<script type="text/javascript" src="/js/dialoguePracticePronunciation.js"></script>
</body>
</html>
