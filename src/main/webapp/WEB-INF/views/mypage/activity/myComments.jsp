<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 작성댓글</title>

    <style>
        .myCommentList{
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
            color: #cccccc;
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
        <div class="col-md-8 offset-md-1 p-4 myCommentList">
            <h2 class="h3 my-5" style="color: #5DB99D;">작성댓글</h2>
            <form action="/user/mypage/comments" method="post">
                <div>
                    <c:forEach var="comment" items="${pageInfo.list}">
                        <div class="row comment mb-3" style="border-bottom: #555555 1px">
                            <div class="col-1 px-4 pt-2">
                                <input class="form-check-input" type="checkbox" name="deleteId" value="${comment.id}" style="display: inline-block; vertical-align: middle">
                            </div>
                            <div class="col-11 p-1">
                                <div class="row justify-content-between">
                                    <div class="col-md-9">${comment.communityReplyContent}</div>
                                    <div class="col-md-2">
                                        <fmt:formatDate value="${comment.communityReplyWritedate}" pattern="yyyy.MM.dd"/>
                                    </div>
                                </div>
                                <div>
                                    <a href="${pageContext.request.contextPath}/community/view?communityId=${comment.communityPostId}" class="tableATag">원글 : ${comment.communityPostTitle}</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row mb-2 mx-1 justify-content-between">
                    <div class="col-md-4">
                        <input class="form-check-input" type="checkbox" onclick="selectAll(this)">
                        <label class="form-check-label ms-3">
                            전체 선택
                        </label>
                    </div>
                    <div class="col-md-2">
                        <input type="submit" class="btn btn-primary" value="댓글 삭제" onclick="return deleteSubmit(this)" />
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
<script src="/js/checkboxDeleteForm.js"></script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>