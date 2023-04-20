<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 작성글</title>

    <style>
        .myPostList{
            border: 1px solid lightgray;
            border-radius: 10px;
            padding:20px;
            width: 750px;
            min-height: 750px;
        }

        .col-md-7 table thead tr{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }

        .myPostList table tbody tr,
        .myPostList table tbody tr td{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }

        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }

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
    </style>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1 myPostList">
            <h3 class="h3 my-4">작성글</h3>
            <table class="table table-striped" style="text-align: center; border:1px solid black;">
                <thead>
                    <tr>
                        <th style="text-align: center; width: 500px;">제목</th>
                        <th style="text-align: center;">작성일</th>
                        <th style="text-align: center;">조회</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="post" items="${pageInfo.list}">
                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/community/view?communityId=${post.id}" style="text-decoration: none;">${post.communityPostTitle}</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${post.communityPostWritedate}" pattern="yyyy.MM.dd"/>
                            </td>
                            <td>
                                <span>${post.communityPostHit}</span>
                            </td>
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
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>