<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

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

<script>
    document.querySelector('#startAudio').addEventListener("click",() => {
        let assistantTalk = "${assistantTalk}";
        ttsAjax(assistantTalk);
    })

    function ttsAjax(assistantTalk) {
        let request = new XMLHttpRequest();

        let urlSearchParams = new URLSearchParams();
        urlSearchParams.append("assistantTalk", assistantTalk);

        request.onload = () => {
            console.log(request.response);
            let audioURL = URL.createObjectURL(request.response);
            let audio = new Audio(audioURL);
            audio.play();
        }

        request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
        request.responseType = "blob";
        request.send();
    }
</script>


</body>
</html>
