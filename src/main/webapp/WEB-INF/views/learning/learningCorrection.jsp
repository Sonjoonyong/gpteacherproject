<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GPTeacher's CORRECTION</title>

    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>

<body>

<%@ include file="../fragments/header.jsp" %>
<section class="container">

    <h3 class="h3 text-center my-3" style="color: #5DB99D;">GPTeacher's CORRECTION</h3>
    <p class="text-center">GPT가 교정해준 문장입니다.</p>

    <p>Question: ${question}</p>
    <p>Your Answer:</p>
    <p>${userScript}</p>
    <p>GPTeacher's Correction:</p>
    <p id="correctedScript">${correctedScript}</p>

    <div class="row g-0 gap-2 justify-content-center">
        <button type="submit" class="btn col-1" id="ttsBtn" style="background-color: #5DB99D; color: white; width: 120px">
            교정본 듣기
        </button>

        <form method="get" action="/learning/sentences" class="col-1">
            <button type="submit" class="btn" style="background-color: #5DB99D; color: white; width: 120px">
                문장별 분석
            </button>
            <input type="hidden" name="learningId" value="${learningId}">
        </form>
    </div>

</section>

<%@ include file="../fragments/footer.jsp" %>

<script>
    let correctedScript = document.querySelector('#correctedScript').innerText;
    if (correctedScript === 'retry') {
        alert('다시 시도하세요');
    }

    let ttsBtn = document.querySelector('#ttsBtn');
    ttsBtn.onclick = () => {
        ttsAjax(correctedScript);
    }

    function ttsAjax(assistantTalk) {
        let request = new XMLHttpRequest();

        let urlSearchParams = new URLSearchParams();
        urlSearchParams.append("assistantTalk", assistantTalk);

        request.onload = () => {
            let audioURL = URL.createObjectURL(request.response);
            audio = new Audio(audioURL);
            audio.play();
        }

        request.open("GET", "/learning/dialogue/tts?" + urlSearchParams.toString());
        request.responseType = "blob";
        request.send();
    }
</script>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>

</html>
