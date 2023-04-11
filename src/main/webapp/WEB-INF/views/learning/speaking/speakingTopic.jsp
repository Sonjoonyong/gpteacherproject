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

    <form action="/learning/writing" method="post">
        이미지 버튼 선택:<br>
            <input type="image" src="static/images/TOEIC.jpg" name="TOPIC" value="TOEIC" />
            <input type="image" src="static/images/TOEFL.jpg" name="TOPIC" value="TOEFL" />
            <input type="image" src="static/images/OPIC.jpg" name="TOPIC" value="OPIC" />
            <input type="image" src="static/images/IELTS.jpg" name="TOPIC" value="IELTS" />
    </form>

</body>
</html>