<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>커뮤니티</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>
        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }
        .container
        .btn.list{
            width: 70px;
            height: 35px;
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }
        .col-md-7 table tbody tr,
        .col-md-7 table tbody tr td {
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
        }

        .col-md-7{
            border: 1px solid lightgray;
            border-radius: 20px;
            padding:20px;
        }

    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">
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
            <div class="col-md-7" style="background-color: white ;margin-top: 55px; ">
                <table class="table table-striped" style="text-align:center; border:1px solid black;" >
                    <thead >

                    </thead>
                    <tbody >
                    <tr>
                        <td style="width:20%;"><h4>글 제목</h4></td>
                        <td colspan="2">${notice.noticeTitle}</td>
                    </tr>
                    <tr>
                        <td >글 내용</td>
                        <td colspan="2" style="height: 200px; text-align: left;">${notice.noticeContent}</td>
                    </tr>
                    </tbody>
                </table>
                <form action="${pageContext.request.contextPath}/help/notice/delete/${notice.id}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <button type="submit" class="btn list">삭제</button>
                </form>

                <a href="${pageContext.request.contextPath}/help/notice/list" class="btn list" style="">목록</a>
            </div>

        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
