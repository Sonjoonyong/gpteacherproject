<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
</head>
<body>

    <a href="/">홈으로</a>
    <br>

    <h1>speaking</h1>

    <form action="/gpt/speakingPractice" method="post">
        Topic 선택 :<br>
        <input type="image" src="/images/TOEIC.png" name="TOPIC" value="TOEIC" />
        <input type="image" src="/images/TOEFL.png" name="TOPIC" value="TOEFL" />
        <input type="image" src="/images/OPIC.png" name="TOPIC" value="OPIC" />
        <input type="image" src="/images/IELTS.png" name="TOPIC" value="IELTS" />
    </form>

</body>
</html>