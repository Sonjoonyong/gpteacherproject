<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>새 글 작성</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>

        #noticeboard .table thead trboardname{
            margin-left: 20px;
        }
        .col-md-7 table tbody tr,
        .col-md-7 table tbody tr td {
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
        }

        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }
        #searchbar fa-solid,
        #searchbar searchbox{

        }

        .btn.btn-primary{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }

        .col-md-7 table thead tr{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }

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

<section class="container">

    <%@ include file="../fragments/header.jsp" %>

    <div class="col-12">
        <div class="row">
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>고객센터</h3></div>
            <div class="row">
                <div id="sidebar1" class="nav" style="margin-top: 10px;margin-left: 30px;">
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
                <h3>글 작성</h3>
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
