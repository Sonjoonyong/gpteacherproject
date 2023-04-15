<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Writing Practice - ${topic}</title>

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
<h1>Writing Practice - ${topic}</h1>
<c:if test="${not empty errorMessage}">
    <div class="error-message">
            ${errorMessage}
    </div>
</c:if>
<form action="/learning/correction/script" method="post">
    <input type="hidden" name="question" value="${question}" />

    <p>Question: <span>${question}</span></p>

    <label for="answer">Answer: </label>
    <textarea cols="100" rows="30" name="writingScript" id="answer"></textarea>

    <button>교정받기</button>
</form>
</section>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>

