<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="/">홈으로</a>
    <br>
    <h1>speaking correction</h1>


    <form action=
        Question : <br>
        <textarea rows="10" cols="100" name="Quesion" th:text="${"


    <form action="/gpt/correction" method="post">
        Your Answer : <br>
        <textarea rows="10" cols="100" name="userScript" th:text="${userScript}"></textarea>
        <input type="submit">
    </form>
    <br>

    문장별 교정 내용:<br>
    <ol>
        <li th:each="script : ${splitScript}" >
            <strong>original:</strong> <span th:text="${script.get('original')}"></span><br>
            <strong>corrected:</strong> <span th:text="${script.get('corrected')}"></span><br>
            <strong>explanation:</strong> <span th:text="${script.get('explanation')}"></span><br>
        </li>
    </ol>
</body>
</html>
