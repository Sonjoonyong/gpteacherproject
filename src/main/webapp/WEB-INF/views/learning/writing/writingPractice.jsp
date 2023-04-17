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

        #waitingMessage {
            display: none;
        }
    </style>

</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <h1 class="h3 text-center my-3" style="color: #5DB99D">QUESTION & ANSWER</h1>

    <form action="/learning/correction/script" method="post">
        <input type="hidden" name="question" value="${question}" />

        <p class="text-center rounded-1 px-3 py-2 my-3" style="background-color: #F4F2FF; color: #7B61FF">Question: <span>${question}</span></p>

        <div class="form-group">
            <label for="answer">Answer : </label>
            <textarea class="form-control px-3 py-2 my-3 shadow" cols="100" rows="30" name="writingScript" id="answer"></textarea>
        </div>

        <div class="text-center submit-container">
            <button type="submit" id="submitBtn" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="width: 200px; background-color: #5DB99D">교정받기</button>

            <div id="waitingMessage" class="row justify-content-center" style="display:none;">
                <div class="col-12 text-center mb-2">
                    <div class="spinner-border text-secondary" role="status"></div>
                </div>
                <div class="col-12 text-center">문장을 분석중입니다.</div>
            </div>
        </div>


    </form>
</section>

<%@ include file="../../fragments/footer.jsp" %>

<script>
    const form = document.querySelector("form");
    const submitBtn = document.getElementById("submitBtn");
    const waitingMessage = document.getElementById("waitingMessage");

    submitBtn.addEventListener("click", (e) => {
        e.preventDefault();
        submitBtn.style.display = "none";
        waitingMessage.style.display = "block";
        setTimeout(() => {
            form.submit();
        }, 100);
    });
</script>


<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>

