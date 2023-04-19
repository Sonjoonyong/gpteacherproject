<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>공지 수정</title>

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

<section class="container">
    <div class="col-12">
        <div class="row">
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 50px;margin-left: -68px;"><h3>고객센터</h3></div>
                <div class="row">
                    <div id="sidebar1" class="nav" style="margin-top: 20px;margin-left: 30px;">
                        <ul>
                            <li class="nav-item" style="list-style: none">
                                <a class="nav-link " href="${pageContext.request.contextPath}/help/notice/list"><i class="fa-solid fa-chevron-right"></i> 공지사항</a>
                            </li>
                            <li class="nav-item" style="list-style: none">
                                <a class="nav-link " href="${pageContext.request.contextPath}/help/faq/list"><i class="fa-solid fa-chevron-right"></i> 자주묻는 질문</a>
                            </li>
                            <li class="nav-item" style="list-style: none">
                                <a class="nav-link " href="${pageContext.request.contextPath}/help/question/list"><i class="fa-solid fa-chevron-right"></i> 문의사항</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7" style="background-color: white; margin-top: 55px;">
                <h3>글 수정</h3>
                <div class="create-form">
                    <form:form action="${pageContext.request.contextPath}/help/notice/update/${notice.id}" method="post" modelAttribute="notice">
                    <form:hidden path="id" />
                        <div class="form-group">
                            <label for="noticeTitle">글 제목 :</label>
                            <form:input path="noticeTitle" type="text" class="form-control" id="noticeTitle" value="${notice.noticeTitle}" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="noticeContent">글 내용 :</label>
                            <form:textarea path="noticeContent" class="form-control" id="noticeContent" rows="5" required="required" cssStyle="min-height: 400px" value="${notice.noticeContent}" />
                        </div>
                        <div class="clearfix">
                            <button type="submit" class="btn btn-primary submit-btn">수정</button>
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
