<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/learning/speaking" method="post" id="TOPIC">
            이미지 버튼 선택:<br>
                <input type="image" src="/images/TOEIC.png" name="TOPIC" value="TOEIC" />
                <input type="image" src="/images/TOEFL.png" name="TOPIC" value="TOEFL" />
                <input type="image" src="/images/OPIC.png" name="TOPIC" value="OPIC" />
                <input type="image" src="/images/IELTS.png" name="TOPIC" value="IELTS" />
        </form>
</body>
</html>
