<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>아이디 찾</title>

    <style>
        nav .loginBtn, nav .signInBtn, nav .alarm {
            display: none;
        }
    </style>


    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container d-flex" style="max-width: 550px;">

    <div class="login row flex-column g-0 justify-content-start rounded-5 my-auto p-5 pt-3"
         style="border: 2px solid #5DB99D; min-height: 500px;">
        <div class="row g-0 justify-content-center">
            <img class="col-9" src="/images/logo.png">
            <h3 class="h3 col-12 text-center">아이디 찾기</h3>
        </div>

        <span class="col-12 p-0">이메일</span>
        <div class="col-12">
            <div class="input-group input-group-lg p-0 mb-3">
                <input id="userEmail" name="userEmail" type="text" class="form-control">
                <button class="btn btn-outline-secondary fs-6" type="button" id="sendEmailCode">
                    인증코드 발송
                </button>
            </div>
        </div>
        <div id="emailMsg" class="col-12 text-danger p-0">
            <%--이메일 관련 메시지--%>
        </div>

        <span class="col-12 p-0">이메일 인증 코드</span>
        <div class="col-12">
            <div class="input-group input-group-lg p-0">
                <input id="userEmailCode" name="userEmailCode" type="text" class="form-control" disabled>
                <button class="btn btn-outline-secondary fs-6"
                        type="button" id="validateEmailCode" disabled>
                    인증
                </button>
            </div>
        </div>
        <div id="emailCodeMsg" class="col-12 text-success p-0">
            <%--이메일 코드 관련 메시지.--%>
        </div>

        <div id="userLoginIdMsg" class="row g-0 py-5" style="display: none">
            <div class="col-12 text-center">아이디는
                <span id="userLoginId" class="fw-bold"></span>
                입니다.
            </div>
        </div>

        <a href="/user/pwsearch" id="submitBtn" class="btn btn-md btn-secondary mt-auto">
            비밀번호 재발급 받으러 가기
        </a>

    </div>

</section>


<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="/js/idsearch.js"></script>

</body>
</html>