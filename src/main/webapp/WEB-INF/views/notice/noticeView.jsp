<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>고객센터</title>

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
            float: right;
        }

        .col-md-7 table thead tr{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }
    </style>

</head>
<body>

<section class="container">

    <%@ include file="../fragments/header.jsp" %>

    <div class="col-12">
        <div class="row">
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 57px; margin-left: -71px;"><h3>고객센터</h3></div>
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
            <div class="col-md-7" style="background-color: white ;margin-top: 55px; ">
                <table class="table table-striped" style="text-align:center; border:1px solid black;" >
                    <thead >

                    </thead>
                    <tbody>
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
                    <a href="${pageContext.request.contextPath}/help/notice/list" class="btn btn-primary">목록</a>
                    <a href="${pageContext.request.contextPath}/help/notice/edit/${notice.id}" class="btn btn-primary">수정</a>
                    <button type="submit" class="btn btn-primary">삭제</button>
                </form>
            </div>

        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
