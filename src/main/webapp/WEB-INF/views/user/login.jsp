<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title>로그인</title>

    <meta name="google-signin-client_id" content="267882054644-vu2virieofr6r971p1ht9fhgo7qkp4t8.apps.googleusercontent.com">

    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <link rel="stylesheet" href="/css/base.css">

    <style>
        nav .loginBtn, nav .signInBtn, alar {
            display: none;
        }

        .error {
            border: 1px solid red;
        }
    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>
<section class="container" style="max-width: 500px;">
    <form:form modelAttribute="loginDto" method="post"
        class="login row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-3"
        style="border: 2px solid #5DB99D;">

        <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">
            <img class="col-12 mb-3" src="/images/logo.png">

            <form:errors path="*">
                <div class="alert alert-danger mb-0">
                    아이디 또는 비밀번호가 맞지 않습니다.
                </div>
            </form:errors>

            <div class="col-12 input-group input-group-lg p-0">
                <span class="input-group-text w-25 fs-6">아이디</span>
                <form:input path="userLoginId" type="text" class="form-control"/>
            </div>

            <div class="col-12 input-group input-group-lg p-0">
                <span class="input-group-text w-25 fs-6">비밀번호</span>
                <form:input path="userPassword" type="password" class="form-control"/>
            </div>

            <button type="col-12 submit" class="btn btn-lg" style="background-color: #5DB99D; color: white">로그인</button>

            <div class="row g-0">
                <div class="col-4 text-center text-secondary py-0"><a href="/user/pwsearch">비밀번호 찾기</a></div>
                <div class="col-4 text-center text-secondary"><a href="/user/idsearch">아이디 찾기</a></div>
                <div class="col-4 text-center text-secondary"><a href="/user/signup">회원가입</a></div>
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
                <button id="loginWithGoogle" type="button"
                        class="btn col-11 text-center text-secondary d-flex justify-content-center align-items-center"
                        style="background-color: white">
                        Login with google
                </button>
            </div>
        </div>

    </form:form>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%--- Google 3P Authorization JS 라이브러리--%>
<script src="https://accounts.google.com/gsi/client"></script>

<script>
    document.querySelector('#userLoginId').focus();

    const client = google.accounts.oauth2.initCodeClient({
        client_id: '267882054644-vu2virieofr6r971p1ht9fhgo7qkp4t8.apps.googleusercontent.com',
        scope: 'openid https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email',
        ux_mode: 'redirect',
        redirect_uri: "http://localhost:8080/user/login/oauth",
        state: 'YOUR_BINDING_VALUE',
        access_type: 'offline'
    });

    document.querySelector('#loginWithGoogle').onclick = () => {
        client.requestCode();
    }
</script>

<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>
