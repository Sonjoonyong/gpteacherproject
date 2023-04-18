<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>

    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <link rel="stylesheet" href="/css/base.css">

    <style>
        nav .loginBtn, nav .signInBtn, alar {
            display: none;
        }
    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>
<section class="container" style="max-width: 500px;">
    <form action="/user/login" method="post" class="login row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto"
          style="border: 2px solid #5DB99D;">
        <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">
            <img class="col-12 mb-3" src="/images/logo.png">

            <c:if test="${bindingResult.hasErrors()}">
                <div class="alert alert-danger mb-0" role="alert">
                    아이디 또는 비밀번호가 맞지 않습니다.
                </div>
            </c:if>
            <div class="col-12 input-group input-group-lg p-0">
                <span class="input-group-text w-25 fs-6">아이디</span>
                <input type="text" name="userLoginId" aria-label="Sizing example input"
                       class="form-control"
                       value="${bindingResult.getFieldValue('userLoginId')}">
            </div>

            <div class="col-12 input-group input-group-lg p-0">
                <span class="input-group-text w-25 fs-6">비밀번호</span>
                <input type="password" name="userPassword"
                       class="form-control ${bindingResult.hasErrors() ? 'error' : ''}" aria-label="Sizing example input">
            </div>

            <button type="col-12 submit" class="btn btn-lg" style="background-color: #5DB99D; color: white">로그인</button>

            <div class="row g-0">
                <div class="col-4 text-center text-secondary py-0"><a href="/user/pwsearch">비밀번호 찾기</a></div>
                <div class="col-4 text-center text-secondary"><a href="/user/idsearch">아이디 찾기</a></div>
                <div class="col-4 text-center text-secondary"><a href="/user/new">회원가입</a></div>
            </div>

            <div class="row g-0 my-3">
                <div class="col-3 text-center text-secondary"><hr></div>
                <div class="col-6 text-center text-secondary d-flex justify-content-center align-items-center">
                    다른 방법으로 로그인하기
                </div>
                <div class="col-3 text-center text-secondary"><hr></div>
            </div>

            <div class="row g-0 my-3 rounded-3 border">
                <div class="col-1">
                    <img class="p-2" src="/images/google_logo.png" height="40">
                </div>
                <span class="col-11 text-center text-secondary d-flex justify-content-center align-items-center">
                        Login with google
                </span>
            </div>
        </div>

    </form>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>
