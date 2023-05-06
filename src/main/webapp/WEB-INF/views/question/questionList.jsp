<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <title>문의 사항</title>

    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <!--추가-->
    <style>
        .col-md-7{
            border: 1px solid lightgray;
            border-radius: 10px;
            padding:20px;
            width: 800px;

        }

        .col-md-7 table tbody tr,
        .col-md-7 table tbody tr td {
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
        }
        .col-md-7 table tbody tr td .questiontitle{
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            display: -webkit-box;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }

        .col-md-7 table thead tr{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }

        #icon1{
            float: left;
            margin-right: 10px;
            width: 20px;
            height: 20px;
        }

         .page-link {
             color: #000;
             background-color: #fff;
             border: 1px solid #ccc;
         }

        .page-item.active .page-link {
            z-index: 1;
            color: #555;
            font-weight:bold;
            background-color: #CFEAE2;
            border-color: #ccc;

        }

        .page-link:focus, .page-link:hover {
            color: #000;
            background-color: #fafafa;
            border-color: #ccc;
        }

        .searchbox{
            border-top: 1px solid white;
            border-left: 1px solid white;
            border-right: 1px solid white;
            border-bottom:1px solid lightslategray;
        }

        #searchForm button{
            margin-left: 10px;
            border: 1px solid #7AD4B9;
            color: white;
            background-color: #7AD4B9;
            float :right;
            border-radius: 5px;
        }

    </style>
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">
    <div class="col-12">
        <div class="row">
            <!--사이드바-->
            <%@ include file="../fragments/customerServiceMenu.jsp" %>
            <!--문의사항-->
            <div class="col-md-7" style="background-color: white ;margin-top: 55px; ">
                <div class="d-flex justify-content-between">
                    <span class="boardname"><h3>문의 사항</h3></span>
                    <div>
                        <a href="${pageContext.request.contextPath}/help/question/write" class="btn btn-primary float-end" style="align-content: end" role="button">글 작성</a>
                    </div>
                </div>
                <table class="table " style="text-align:center; border:1px solid black; " >
                    <thead>
                    <tr>
                        <th style="width: 50px;">번호</th>
                        <th style="width: 20px;"></th>
                        <th>제목</th>
                        <th style="width: 100px;">작성일</th>
                        <th style="width: 100px;">상태</th>
                    </tr>
                    </thead>
                    <tbody >
                        <c:forEach var="question" items="${pageInfo.list}">
                            <tr>
                                <td>${question.id}</td>
                                <td style="width: 20px; padding-left: 1px;padding-right: 1px;">
                                    <c:if test="${question.userId eq loginUser.getId()}">
                                        <i class="fa-solid fa-lock-open" id="icon1" aria-disabled="true"></i>
                                    </c:if>
                                    <c:if test="${question.userId ne loginUser.getId()}">
                                        <i class="fa-solid fa-lock" id="icon1" aria-disabled="true"></i>
                                    </c:if>
                                </td>
                                <td  style="text-align: left;">
                                    <div class="questiontitle" style="display: -webkit-box; position: relative;">
                                        <a href="${pageContext.request.contextPath}/help/question/view?questionId=${question.id}" class="question-title-link" style="margin-right: 30px;">
                                        [${question.questionCategory}] ${question.questionTitle}
                                        </a>
                                    </div>
                                </td>
                                <td><fmt:formatDate value="${question.questionWriteDate}" pattern="yyyy.MM.dd" /></td>
                                <td>
                                    <c:if test="${question.questionStatus }">답변완료</c:if>
                                    <c:if test="${not question.questionStatus }">답변중</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!--페이징-->
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <c:if test="${pageInfo.hasPreviousPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="?pageNum=1" aria-label="First">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">‹</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach var="i" begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" step="1">
                                    <c:choose>
                                        <c:when test="${i == pageInfo.pageNum}">
                                            <li class="page-item active" id="pageicon">
                                                <a class="page-link" href="?pageNum=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="page-link" href="?pageNum=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${pageInfo.hasNextPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">›</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="?pageNum=${pageInfo.pages}" aria-label="Last">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!--검색-->
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-center">
                        <form action="/help/question/list" method="get" id="searchForm">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" class="searchbox" name="search" />
                            <button type="submit">검색</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>
