<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QUESTION & ANSWER</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

    <style>
        .container {
            max-width: 900px;
        }

        #initialAssistantTalk, #record, #stop, #waitingMessage {
            display: none;
        }

        #stop {
            color: rgb(255, 0, 0);
            width: 45px;
            height: 45px;
            border-color: gray;
        }

        #record {
            width: 45px;
            height: 45px;
            background-color: #5DB99D;
            border-color: #5DB99D;
        }

        .bi-heart-fill {
            color: red;
        }

        .bi-archive-fill {
            color: rgb(57, 116, 25);
        }

        .assistantTalk {
            background-color: #F4F2FF;
            width: fit-content;
        }
    </style>

</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <h1 class="h3 text-center my-3" style="color: #5DB99D">QUESTION & ANSWER</h1>
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
                ${errorMessage}
        </div>
    </c:if>
    <form action="/learning/correction/script" method="post">
        <input type="hidden" name="question" value="${question}" />

        <p class="text-center">Question: <span>${question}</span></p>

        <div class="form-group">
            <label for="answer">Answer: </label>
            <textarea class="form-control" cols="100" rows="30" name="writingScript" id="answer"></textarea>
        </div>

        <div class="text-center">
            <input type="button" value="교정받기" onclick="checkProfanity(); return false;" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="width: 200px; background-color: #5DB99D">
        </div>
    </form>
</section>

<script>
    function checkProfanity() {
        let request = new XMLHttpRequest();

        let form = document.querySelector('form');
        let writingScript = document.getElementById("answer").value;

        let formData = new FormData();
        formData.append('text', writingScript);
        console.log(writingScript);

        request.onload = () => {
            let profanity = request.response;
            console.log(profanity)

            if (profanity == "true") {
                document.getElementById("answer").value = '';
                alert("부적절한 문장입니다. 바른 말을 사용해 주세요.");
            }
            if (profanity == "false") {
                form.submit();
            }
        }

        request.open("POST","/learning/writing/profanity", true);
        request.send(formData);
    }
</script>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>

