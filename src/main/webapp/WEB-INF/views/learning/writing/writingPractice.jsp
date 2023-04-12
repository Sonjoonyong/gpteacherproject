<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Writing Practice - ${topic}</title>
</head>
<body>
<h1>Writing Practice - ${topic}</h1>
<c:if test="${not empty errorMessage}">
    <div class="error-message">
            ${errorMessage}
    </div>
</c:if>
<form action="${pageContext.request.contextPath}/learning/correction" method="post">
    <input type="hidden" name="action" value="submit">
    <input type="hidden" name="topic" value="${topic}" />
    <input type="hidden" name="question" value="${question}" />
    <p>Question: <span>${question}</span></p>
    <label for="answer">Answer: </label>
    <textarea name="answer" id="answer"></textarea>
    <br>
    <input type="submit" value="Submit">
</form>
</body>
</html>

