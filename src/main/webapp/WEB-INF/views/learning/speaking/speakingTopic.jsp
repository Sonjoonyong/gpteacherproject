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

    <button type="submit" name="topic" value="TOEIC">
        <img src="/images/TOEIC.jpg">
    </button>


    <button type="submit" name="topic" value="TOEFL">
        <img src="/images/TOEFL.jpg">
    </button>

    <br>

    <button type="submit" name="topic" value="OPIC">
        <img src="/images/OPIC.jpg">
    </button>


    <button type="submit" name="topic" value="IELTS">
        <img src="/images/IELTS.jpg">
    </button>

</form>

</body>
</html>
