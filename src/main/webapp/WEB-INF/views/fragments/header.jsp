<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="darkModeCookie" value="${fn:escapeXml(cookie.darkMode.value)}" />
<c:set var="isDarkMode" value="${empty darkModeCookie or darkModeCookie eq 'true'}" />


<header id="header" class="${isDarkMode ? 'dark-mode' : ''}">
    <nav class="navbar navbar-expand-lg ${isDarkMode ? 'dark-mode' : 'bg-white'} mb-3">
        <div class="container-lg">
            <a class="navbar-brand" href="/main">
                <img src="/images/logo.png" alt="logo" width="200px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
                    aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 gap-3">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/learning/speaking">말하기 연습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/learning/dialogue">회화 연습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/learning/writing">글쓰기 연습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/community/list">커뮤니티</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/help/notice/list">고객센터</a>
                    </li>
                </ul>


                <c:if test="${empty loginUser}">
                    <a type="button" class="loginBtn btn btn-outline-success mx-2" href="/user/login">로그인</a>
                    <a type="button" class="signInBtn btn btn-outline-secondary" href="/user/signup">회원가입</a>
                </c:if>
                <c:if test="${not empty loginUser}">
                    <button class="btn p-0 border-0">
                        <i class="alarm bi bi-bell fs-5 me-3 fw-bold"></i>
                    </button>
                    <c:choose>
                        <c:when test="${loginUser.userRole == 'ADMIN'}">
                            <a type="button" class="myPageBtn btn mx-2" href="/admin/trend" style="background-color: #716FAA; color: white;">관리페이지</a>
                        </c:when>
                        <c:otherwise>
                            <a type="button" class="myPageBtn btn mx-2" href="/user/mypage/dashboard" style="background-color: #5DB99D; color: white;">마이페이지</a>
                        </c:otherwise>
                    </c:choose>
                    <a type="button" class="logoutBtn btn btn-outline-secondary" href="/user/logout">로그아웃</a>
                </c:if>

            </div>
        </div>
    </nav>
</header>