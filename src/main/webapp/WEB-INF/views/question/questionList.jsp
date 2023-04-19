<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <title>문의사항</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <!--추가-->
    <style>
        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }


        .btn.btn-primary{

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
            <div class="col-md-7" style="background-color: white ;margin-top: 55px; ">
                <div class="d-flex justify-content-between">
                    <span class="boardname"><h3>문의사항</h3></span>
                    <div>
                        <input type="submit" class="btn btn-primary float-end" value="문의하기" style="align-content: end"/>
                    </div>
                </div>
                <table class="table table-striped" style="text-align:center; border:1px solid black;" >
                    <thead>
                    <tr>
                        <th style="width: 50px;">번호</th>
                        <th >제목</th>
                        <th style="width: 100px;">작성일</th>
                        <th style="width: 100px;">상태</th>
                    </tr>
                    </thead>
                    <tbody >
                        <c:forEach var="question" items="${pageInfo.list}">
                            <tr>
                                <td>${question.id}</td>
                                <td>[${question.questionCategory}] ${question.questionTitle}</td>
                                <td><fmt:formatDate value="${question.questionWriteDate}" pattern="yyyy.MM.dd" /></td>
                                <td>${question.questionStatus}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>
