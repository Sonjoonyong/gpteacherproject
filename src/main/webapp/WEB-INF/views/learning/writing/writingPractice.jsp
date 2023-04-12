<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Writing Practice - [${topic}]</title>
</head>
<body>
<h1>Writing Practice - [${topic}]</h1>
<form th:action="@{/learning/submitQuestionAndAnswer}" method="post">
    <input type="hidden" name="topic" th:value="${topic}" />
    <p>Question: <span th:text="${question}"></span></p>
    <label for="answer">Answer: </label>
    <textarea name="answer" id="answer"></textarea>
    <br>
    <input type="submit" value="Submit">
</form>
</form>
</body>
</html>

