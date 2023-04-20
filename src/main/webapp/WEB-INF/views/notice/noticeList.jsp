<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>고객센터</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <style>
        .col-md-7{
            border: 1px solid lightgray;
            border-radius: 10px;
            padding:20px;
            width: 800px;

        }

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

        .notice-image {
            float: left;
            margin-right: 10px;
            width: 20px;
            height: 20px;
        }

        .notice-title-link {
            text-decoration: none;
        }

        .col-md-7 table thead tr{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
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

        .btn.btn-primary{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }
        .btn.btn-primary:active{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }
        .btn.btn-primary:focus {
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }
        .btn.btn-primary:hover{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }


    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">

    <div class="col-12">
        <div class="row">
            <!--사이드바-->
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>고객센터</h3></div>
                <div class="row" style="margin-top: 15px;">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/notice/list'" style="background-color: #CFEAE2">
                                    공지사항
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/faq/list'">
                                    자주묻는 질문
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/question/list'">
                                    문의사항
                                </button>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
            <!--고객센터-->
                    <div class="col-md-7" style="background-color: white; margin-top: 55px;">
                        <div class="noticeboard" id="noticeboard">
                            <div class="d-flex justify-content-between">
                                <span class="boardname"><h3>공지사항</h3></span>
                                <div>
                                    <a href="${pageContext.request.contextPath}/help/notice/write" class="btn btn-primary float-end" style="align-content: end" role="button">글 작성</a>
                                </div>
                            </div>
                            <table class="table table-striped" style="text-align: center; border:1px solid black;">
                                <thead>
                                <tr>
                                    <th style="text-align: center; ">제목</th>
                                    <th style="text-align: center; width:100px; margin-right: 5px;">작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="notice" items="${pageInfo.list}">
                                    <tr>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/help/notice/view?noticeId=${notice.id}" class="notice-title-link">
                                                <img src="/images/notice_titleimage.png" alt="Notice" class="notice-image">
                                                    ${notice.noticeTitle}
                                            </a>
                                        </td>
                                        <td style="margin-right: 5px;"><fmt:formatDate value="${notice.noticeWriteDate}" pattern="yyyy.MM.dd" /></td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
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
                                                        <li class="page-item active">
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

                            <div class="row">
                                <div class="col-md-12 d-flex justify-content-center">
                                    <form action="/help/notice/list" method="get" id="searchForm">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                        <input type="text" class="searchbox" name="search" />
                                        <button type="submit">검색</button>
                                    </form>
                                </div>
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
