<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새 글 작성</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>
        .create-form {
            border: 1px solid lightgray;
            border-radius: 5px;
            padding: 20px;
        }

        .submit-btn {
            float: right;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<%@ include file="../fragments/header.jsp" %>
section class="container">
<div class="col-12">
    <div class="row">
        <div class="col-md-3" id="sidebar">
            <div class="row text-center" style="margin-top: 50px;margin-left: -68px;"><h3>Community</h3></div>
            <div class="row">
                <div id="sidebar1" class="nav" style="margin-top: 20px;margin-left: 30px;">
                    <ul>
                        <li class="nav-item" style="list-style: none">
                            <a class="nav-link " href="${pageContext.request.contextPath}/community/?"><i class="fa-solid fa-chevron-right"></i> 커뮤니티</a>
                            <%--                                         원래 위에가 /community/list 이고 밑에가 /community/? 이다--%>
                        </li>
                        <li class="nav-item" style="list-style: none">
                            <a class="nav-link " href="${pageContext.request.contextPath}/community/list"><i class="fa-solid fa-chevron-right"></i> WeeklyTop10</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-7" style="background-color: white; margin-top: 55px;">
            <h3>새 글 작성</h3>
            <div class="create-form">
                <form:form action="${pageContext.request.contextPath}/help/notice" method="post" modelAttribute="noticeCreateDto">
                    <div class="form-group">
                        <label for="noticeTitle">제목 :</label>
                        <form:input path="noticeTitle" type="text" class="form-control" id="noticeTitle" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="noticeContent">내용 :</label>
                        <form:textarea path="noticeContent" class="form-control" id="noticeContent" rows="5" required="required" cssStyle="min-height: 400px"/>
                    </div>
                    <div class="clearfix">
                        <button type="submit" class="btn btn-primary submit-btn">등록</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</section>
<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
