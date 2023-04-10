<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dialogue Topic</title>
</head>
<body>
    <h3>TOPIC</h3>
    <h4>원하는 대와 상황을 영어로 입력해 주세요.</h4>
    <form method="post" action="/learning/dialogue">
        Place
        <input type="text" name="place" placeholder="대화 장소를 입력해 주세요." /><br/>
        예시 : restaurant<br/>
        My Role
        <input type="text" name="myRole" placeholder="당신의 역할을 입력해주세요." /><br/>
        예시 : customer<br/>
        GPT's Role
        <input type="text" name="gptRole" placeholder="대화 상대방의 역할을 입력해주세요." /><br/>
        예시 : waiter<br/>
        Situation
        <input type="text" name="situation" placeholder="대화 상황을 입력해주세요." /><br/>
        예시 : ordering food<br/>
        Option
        <input type="text" name="option" placeholder="추가적인 상황에 대해 설명해주세요(옵션)." /><br/>
        예시 : select degree of cooked meat<br/>
        <input type="submit" value="대화 시작하기"/>
    </form>
</body>
</html>
