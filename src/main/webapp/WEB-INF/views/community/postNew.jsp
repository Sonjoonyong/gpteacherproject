<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h3>글 작성</h3>
            <div class="create-form">
                <form:form action="${pageContext.request.contextPath}/community" method="post" modelAttribute="communityPostDto">
                    <div class="form-group">
                        <label for="communityPostTitle">제목 :</label>
                        <form:input path="communityPostTitle" type="text" class="form-control" id="communityPostTitle" required="required"/>
                    </div>
                    <div class="form-group">
                        <label for="communityPostContent">내용 :</label>
                        <form:textarea path="communityPostContent" class="form-control" id="communityPostContent" rows="5" required="required" cssStyle="min-height: 400px"/>
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
