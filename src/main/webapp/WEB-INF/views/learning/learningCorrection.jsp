<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>GPTeacher's CORRECTION</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <style>
        .container {
            max-width: 768px;
        }

    </style>
</head>

<body>

<%@ include file="../fragments/header.jsp" %>
<section class="container">

    <h3 class="h3 text-center my-3" style="color: #5DB99D;">GPTeacher's CORRECTION</h3>
    <p class="text-center">GPTeaher가 교정해준 문장입니다.</p>

    <p class="text-center rounded-1 px-3 py-2 my-3" style="background-color: #F4F2FF; color: #7B61FF">Question: ${question}</p>
    <p style="font-weight: bold; color: #2A6976">Your Answer</p>
    <p class="rounded-1 px-3 py-2 my-3" style="border: 1px solid #ccc">${userScript}</p>
    <p style="font-weight: bold; color: #16967A">GPTeacher's Correction</p>
    <p id="correctedScript" class="rounded-1 px-3 py-2 my-3" style="border: 1px solid #ccc">${correctedScript}</p>

    <div class="d-flex justify-content-center">
        <div class="btn-group">
            <button type="submit" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" id="ttsBtn" style="background-color: #5DB99D; color: white; width: 120px; height: 40px; margin-right: 30px;">
                교정본 듣기
            </button>

            <form method="get" action="/learning/correction/sentences">
                <button type="submit" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="background-color: #5DB99D; color: white; width: 120px">
                    문장별 분석
                </button>
                <input type="hidden" name="learningId" value="${learningId}">
            </form>
        </div>
    </div>

    <div class="text-center" style="margin-top: 80px; margin-bottom: 40px">
        <img src="/images/step_third.png" alt="Step Third" style="max-width: 100%;">
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<script>
    let correctedScript = document.querySelector('#correctedScript').innerText;

    if (correctedScript === 'retry') {
        alert('다시 시도하세요');
        history.back();
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
