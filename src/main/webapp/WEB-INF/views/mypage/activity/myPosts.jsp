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

        .btn.btn-primary{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
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
        .tableATag {
            text-decoration: none;
            color: #373737;
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
        <div class="col-md-8 offset-md-1 p-3 mt-3 myPostList">
            <h2 class="h3 my-5" style="color: #5DB99D;">작성글</h2>
            <form action="/user/mypage/communities" id="myForm" method="post">
                <table class="table" style="text-align: center; table-layout:fixed;">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 50px;"></th>
                            <th scope="col" style="width: 475px;">제목</th>
                            <th scope="col" style="width: 125px;">작성일</th>
                            <th scope="col" style="width: 50px;">조회</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:forEach var="post" items="${pageInfo.list}">
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" name="deleteId" value="${post.id}">
                                </td>
                                <td style="text-overflow:ellipsis; overflow:hidden;">
                                    <a href="/community/${post.id}" class="tableATag form-check-label">${post.communityPostTitle}</a>
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
                <div class="row mb-2 g-0 justify-content-between">
                    <div class="col-md-4 ps-3 align-self-center">
                        <input class="form-check-input" type="checkbox" onclick="selectAll(this)" style="margin-left:10px;">
                        <label class="form-check-label ms-3">
                            전체 선택
                        </label>
                    </div>
                    <div class="col-md-auto">
                        <input type="button" class="btn btn-primary" value="글 삭제" onclick="deleteSubmit(this)"/>
                    </div>
                </div>
            </form>
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="/js/checkboxDeleteForm.js"></script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>