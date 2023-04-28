<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    .center-align {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .searchbox{
        border-top: 1px solid white;
        border-left: 1px solid white;
        border-right: 1px solid white;
        border-bottom:1px solid lightslategray;
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
            <div class="userlist" id="userlist">
                <div class="wrapper">
                    <div class="d-flex justify-content-between" style="color: #716FAA;">
                        <span class="userlistname"><h3>회원 관리</h3></span>
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
                                <td class="center-align">
                                    <div class="d-flex">
                                        <form action="/admin/userPosts" method="GET">
                                            <input type="hidden" name="userId" value="${user.id}"/>
                                            <button type="submit" class="btn btn-primary" style="color: #716FAA; border-color: #716FAA">작성 글</button>
                                        </form>
                                        <form action="/admin/userComments" method="GET" >
                                            <input type="hidden" name="userId" value="${user.id}"/>
                                            <button type="submit" class="btn btn-primary" style="color: #716FAA; border-color: #716FAA">작성 댓글</button>
                                        </form>
                                        <c:if test="${user.blockDate eq null}">
                                            <form action="/admin/blockUser" method="post" onsubmit="return blockReason();">
                                                <input type="hidden" name="userId" value="${user.id}" />
                                                <input type="hidden" name="reason" id="reason"/>
                                                <button type="submit" class="btn btn-primary" style="color: #716FAA; border-color: #716FAA">차단하기</button>
                                            </form>
                                        </c:if>
                                        <c:if test="${user.blockDate ne null}">
                                            <form>
                                                <button  class="btn btn-primary" disabled style="color: white; border-color: black; background-color: lightslategray;" >차단완료</button>
                                            </form>
                                        </c:if>
                                    </div>
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
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script>
    function blockReason() {
        if(confirm('차단하시겠습니까?')) {
            let reason = prompt('차단 사유를 입력해 주세요.');

            if(reason != null) { //취소가 아닐 경우
                document.getElementById('reason').value = reason;
                return true;
            } else{
                return false;
            }
        } else{
            return false;
        }
    }
</script>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
