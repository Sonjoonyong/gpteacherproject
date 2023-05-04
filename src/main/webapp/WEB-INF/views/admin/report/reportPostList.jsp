<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리 페이지</title>

    <link rel="stylesheet" href="/css/base.css">
<style>

    .select-container .form-select {
        width: 280px;
        font-size: 30px;
        border: 0.1px solid #2F4858;
        border-radius: 5px;
        padding: 5px 10px;
        color: white;
        text-align: center;
        background-color: #716FAA;
    }

    .wrapper {
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 5px;
        margin-top: 70px;
        margin-bottom: 50px;
    }

    .table-hover thead th {
        font-size: 16px;
        font-weight: bold;
        background-color: #716FAA;
        color: white;
        padding: 8px;
    }

    #searchForm button{
        margin-left: 10px;
        border: 1px solid #716FAA;
        color: white;
        background-color: #716FAA;
        float :right;
        border-radius: 5px;
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
        color: white;
        font-weight:bold;
        background-color: #716FAA;
        border-color: #ccc;

    }

    .page-link:focus, .page-link:hover {
        color: #000;
        background-color: #fafafa;
        border-color: #ccc;
    }

</style>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/adminMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <div class="reportpostlist" id="reportpostlist">
                <div class="wrapper">
                    <div class="d-flex justify-content-beween" style="color: #716FAA">
                        <span class="reportpostlistname"><h3>신고 글 목록</h3></span>
                    </div>
                    <table class="table table-hover" style="text-align: center">
                        <thead>
                        <tr>
                            <th>유저ID</th>
                            <th>제목</th>
                            <th>사유</th>
                            <th>작성일</th>
                            <th>신고일</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="post" items="${reportedPosts}">
                                <tr>
                                    <td>
                                        <form action="/admin/blockUser" method="post" onsubmit="return blockReason(this);">
                                            <input type="hidden" name="userId" value="${post.userId}" />
                                            <input type="hidden" name="reason" id="reason"/>
                                            <input type="submit" name="userLoginId" value="${post.userLoginId}" style="background-color: white; border: none;">
                                        </form>
                                    </td>
                                    <td style="text-overflow:ellipsis; overflow:hidden;">
                                        <a href="${pageContext.request.contextPath}/community/${post.reportSubjectId}" class="tableATag form-check-label" style="text-decoration: none;">${post.postTitle}</a>
                                    </td>
                                    <td>${post.reportReason}</td>
                                    <td><fmt:formatDate value="${post.creationDate}" pattern="yyyy-MM-dd" /></td>
                                    <td><fmt:formatDate value="${post.reportDate}" pattern="yyyy-MM-dd" /></td>
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
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script>
    function blockReason(form) {
        Swal.fire({
            title: "차단 사유를 입력해주세요",
            input: "text",
            inputAttributes: {
                autocapitalize: "off"
            },
            showCancelButton: true,
            confirmButtonText: "확인",
            cancelButtonText: "취소",
            showLoaderOnConfirm: true,
            preConfirm: (reason) => {
                if (reason) {
                    form.querySelector("#reason").value = reason;
                    return true;
                } else {
                    Swal.showValidationMessage("사유를 입력해주세요");
                    return false;
                }
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                // 확인 버튼을 눌렀을 때
                if (form.checkValidity()) { // 폼이 유효하면 제출
                    form.submit();
                } else { // 폼이 유효하지 않으면 실패로 처리
                    return false;
                }
            } else { // 취소 버튼을 눌렀을 때
                return false;
            }
        });
        return false;
    }
</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
