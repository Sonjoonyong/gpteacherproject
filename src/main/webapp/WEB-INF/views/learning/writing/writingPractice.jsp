<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QUESTION & ANSWER</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../../fragments/bootstrapCss.jsp" %>

    <style>
        .container {
            max-width: 900px;
        }

        .wrapper {
            position: relative;
        }

        #waitingMessage {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
        }

    </style>

</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="wrapper">
    <h1 class="h3 text-center my-3" style="color: #5DB99D">QUESTION & ANSWER</h1>

    <form action="/learning/correction/script" method="post">
        <input type="hidden" name="question" value="${question}" />

        <p class="text-center rounded-1 px-3 py-2 my-3" style="background-color: #F4F2FF; color: #7B61FF">Question: <span>${question}</span></p>

        <div class="form-group">
            <label for="answer" style="font-weight: bold; color: #2A6976">Answer </label>
            <textarea class="form-control px-3 py-2 my-3" cols="100" rows="30" name="userScript" id="answer"></textarea>
        </div>

        <div class="text-center submit-container">
            <input type="button" id="submitBtn" value="교정받기" onclick="checkProfanity(); return false;" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="width: 200px; background-color: #5DB99D"/>

            <div id="waitingMessage" class="row justify-content-center" style="display:none;">
                <div class="col-12 text-center mb-2">
                    <div class="spinner-border text-secondary" role="status"></div>
                </div>
                <div class="col-12 text-center">문장을 분석중입니다.</div>
            </div>
        </div>
    </form>

    <div class="text-center" style="margin-top: 80px; margin-bottom: 40px">
        <img src="/images/step_second.png" alt="Step Second" style="max-width: 100%;">
    </div>
    </div>
</section>

<script>
    const form = document.querySelector("form");
    const submitBtn = document.getElementById("submitBtn");
    const waitingMessage = document.getElementById("waitingMessage");

    function showWaiting() {
        submitBtn.style.display = "none";
        waitingMessage.style.display = "block";
        setTimeout(() => {
            form.submit();
        }, 100);
    }

    function checkProfanity() {
        let request = new XMLHttpRequest();

        let writingScript = document.getElementById("answer").value;

        let formData = new FormData();
        formData.append('text', writingScript);
        console.log(writingScript);

        request.onload = () => {
            let profanity = request.response.profanity;
            if (profanity == "true") {
                document.getElementById("answer").value = '';
                alert("부적절한 문장입니다. 바른 말을 사용해 주세요.");
            }
            if (profanity == "false") {
                showWaiting();
            }
        }

        request.open("POST","/learning/sentence/profanity", true);
        request.responseType = "json";
        request.send(formData);
    }
</script>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>

