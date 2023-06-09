<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <%@ include file="../fragments/bootstrapCss.jsp" %>

    <title>자주 묻는 질문</title>

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
            padding: 10px;
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
        .btn.btn-secondary{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
            float: right;
            border-radius: 20px;
            padding-left: 20px;
            padding-right: 20px;
        }
        .btn.btn-secondary:hover{
            border: 1px solid #5DB99D;
            color: white;
            background-color: #5DB99D;
            float: right;
            border-radius: 20px;
        }
        .btn.btn-secondary:visited{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
            float: right;
            border-radius: 20px;
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
            <!--본문-->
            <div class="col-md-7" style="background-color: white ;margin-top: 55px; ">
                <!--본문제목 + 카테고리 버튼-->
                <div class="col-lg-12 d-flex justify-content-start" style="margin-top: 10px; margin-bottom: 5px; margin-left: 10px;">
                    <span class="boardname"><h3>자주 묻는 질문</h3></span>
                </div>
                <div class="d-flex " >
                    <div class="p-2 " >
                        <button style="margin-right: 5px; " type="button" class="btn btn-secondary" onclick="location.href='http://localhost:8080/help/faq/list?search=%ED%95%99%EC%8A%B5'" >학습</button>
                        <button style="margin-right: 5px; " type="button" class="btn btn-secondary" onclick="location.href='http://localhost:8080/help/faq/list?search=%EA%B3%84%EC%A0%95%EA%B4%80%EB%A6%AC'">계정관리</button>
                        <button style="margin-right: 5px; " type="button" class="btn btn-secondary" onclick="location.href='http://localhost:8080/help/faq/list?search=%EB%82%98%EC%9D%98%ED%99%9C%EB%8F%99'">나의활동</button>
                        <button style="margin-right: 5px; " type="button" class="btn btn-secondary" onclick="location.href='http://localhost:8080/help/faq/list?search=%ED%95%99%EC%8A%B5%ED%98%84%ED%99%A9'">학습현황</button>
                        <button style="margin-right: 5px; " type="button" class="btn btn-secondary" onclick="location.href='http://localhost:8080/help/faq/list'" >전체</button>
                    </div>
                </div>
                <!--글작성 버튼-->
                <div class="p-1 " style="margin-left: 50px; ">
                    <c:if test="${loginUser.userRole == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/help/faq/write" class="btn btn-primary float-end" role="button">글 작성</a>
                    </c:if>
                </div>
                <!-- 본문 -->
                <table class="table "  style="border:1px solid black;" >
                    <thead style="text-align: center;" >
                    </thead>
                    <tbody style="text-align:start; ">
                    <c:forEach var="faq" items="${pageInfo.list}">
                        <tr >
                            <td >
                                <a href="${pageContext.request.contextPath}/help/faq/view?faqId=${faq.id}" class="faq-title-link" style="margin-left: 20px;" >

                                    [${faq.faqCategory}] ${faq.faqTitle}
                                </a>
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
                        <form action="/help/faq/list" method="get" id="searchForm">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" class="searchbox" name="search" />
                            <button type="submit" >검색</button>
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
