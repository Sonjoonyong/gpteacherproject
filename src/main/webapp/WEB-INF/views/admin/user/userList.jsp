<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리 페이지</title>

    <link rel="stylesheet" href="/css/base.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>

    .select-container {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
        height: 100px;
    }

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

</style>
    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/adminMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <div class="userlist" id="userlist">
                <div class="wrapper">
                    <div class="d-flex justify-content-between" style="color: #716FAA;">
                        <span class="userlistname"><h3>회원 조회</h3></span>
                    </div>
                    <table class="table table-hover " style="text-align: center">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>로그인ID</th>
                            <th>닉네임</th>
                            <th>생년월일</th>
                            <th>관리</th>
                            <th>계정 생성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.userLoginId}</td>
                                <td>${user.userNickname}</td>
                                <td><fmt:formatDate value="${user.userBirthday}" pattern="yyyy-MM-dd" /></td>
                                <td>
                                    <button type="button">작성 글</button>
                                    <button type="button">작성 댓글</button>
                                    <button type="button">차단하기</button>
                                </td>
                                <td><fmt:formatDate value="${user.userCreatedate}" pattern="yyyy-MM-dd" /></td>
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
                            <form action="/admin/users" method="get" id="searchForm">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                <select name="searchOption" class="searchbox">
                                    <option value="user_login_id">로그인ID</option>
                                    <option value="user_nickname">닉네임</option>
                                    <option value="user_email">이메일</option>
                                </select>
                                <input type="text" class="searchbox" name="search" />
                                <button type="submit">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>
</body>
</html>
