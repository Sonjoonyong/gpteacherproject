<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form action="/learning/speaking" method="post">
        주제를 선택 해주세요. : <br>
        <a href="/learning/speaking?TOPIC=TOEIC">
            <button type="submit" name="TOPIC" value="TOEIC">
                <img src="/images/TOEIC.jpg">
            </button>
        </a>
        <a href="/learning/speaking?TOPIC=TOEIC">
            <button type="submit" name="TOPIC" value="TOEFL">
                <img src="/images/TOEFL.jpg">
            </button>
        </a>
        <br>
        <a href="/learning/speaking?TOPIC=TOEIC">
            <button type="submit" name="TOPIC" value="OPIC">
                <img src="/images/OPIC.jpg">
            </button>
        </a>
        <a href="/learning/speaking?TOPIC=TOEIC">
            <button type="submit" name="TOPIC" value="IELTS">
                <img src="/images/IELTS.jpg">
            </button>
        </a>
    </form>

</body>
</html>
