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
            <input id="question" type="hidden" name="question" value="${question}"/>

            <p class="text-center rounded-1 px-3 py-2 my-3" style="background-color: #F4F2FF; color: #7B61FF">Question:
                <span>${question}</span></p>

            <div class="form-group">
                <div class="hstack">
                    <label for="answer" style="font-weight: bold; color: #2A6976">Answer </label>
                    <button id="wordRecommendation" class="btn btn-sm btn-primary ms-auto">단어 추천받기</button>
                </div>
                <textarea class="form-control px-3 py-2 my-3" cols="100" rows="20" name="userScript" id="answer" maxlength="1500"></textarea>

            </div>

            <div class="text-center submit-container">
                <input type="button" id="submitBtn" value="교정받기" onclick="checkProfanity(); return false;"
                       class="btn btn-success shadow my-3 border-0 py-2 rounded-3"
                       style="width: 200px; background-color: #5DB99D"/>

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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    const form = document.querySelector("form");
    const submitBtn = document.getElementById("submitBtn");
    const waitingMessage = document.getElementById("waitingMessage");

    const wordRecommendationBtn = document.querySelector('#wordRecommendation');
    const answerInput = document.querySelector('#answer');
    const question = document.querySelector('#question');

    function showWaiting() {
        submitBtn.style.display = "none";
        waitingMessage.style.display = "block";
        document.getElementById("answer").readOnly = true;
        setTimeout(() => {
            form.submit();
        }, 100);
    }

    function checkProfanity() {
        let request = new XMLHttpRequest();

        if (answerInput.value.length < 10) {
            Swal.fire('10자 이상 입력해주세요.');
            return false;
        }

        if (answerInput.value.length > 1000) {
            Swal.fire('1000자 이하로 입력해주세요.\n 현재: ' + answerInput.value.length + "자");
            return false;
        }

        let writingScript = answerInput.value;

        let formData = new FormData();
        formData.append('text', writingScript);
        console.log(writingScript);

        request.onload = () => {
            let profanity = request.response.profanity;
            if (profanity == "true") {
                //document.getElementById("answer").value = '';
                Swal.fire({
                    icon: 'error',
                    title: '부적절한 문장이 포함되어 있습니다.',
                    text: '바른 말을 사용해 주세요.'
                });
            }
            if (profanity == "false") {
                showWaiting();
            }
        }

        request.open("POST", "/learning/sentence/profanity", true);
        request.responseType = "json";
        request.send(formData);
    }



    wordRecommendationBtn.onclick = () => {
        const request = new XMLHttpRequest();

        if (answerInput.value === '') {
            Swal.fire('문장을 입력해주세요.');
            return false;
        }

        wordRecommendationBtn.disabled = true;
        wordRecommendationBtn.innerText = '단어를 추천받고 있습니다';

        request.onload = () => {
            if (request.status == 200) {
                if (request.responseText === 'retry') {
                    Swal.fire('10 ~ 1000자 범위로 입력해주세요.');
                    wordRecommendationBtn.innerText = '단어 추천받기';
                    wordRecommendationBtn.disabled = false;
                    return false;
                }

                Swal.fire(
                    'GPTeacher의 제안',
                    request.responseText
                );
            }
            wordRecommendationBtn.innerText = '단어 추천받기';
            wordRecommendationBtn.disabled = false;
        }

        request.open("get", "/learning/writing/word?question=" + question.value + "&answer=" + answerInput.value);
        request.send();
    }

</script>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>

