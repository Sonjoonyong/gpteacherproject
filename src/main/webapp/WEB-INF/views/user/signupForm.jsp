<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title>회원가입</title>

    <style>
        nav .loginBtn, nav .signInBtn, alar {
            display: none;
        }

        .termDesc {
            color: gray;
        }
    </style>


    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container" style="max-width: 600px">

    <form method="post"
          class="login row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
          style="border: 2px solid #5DB99D;">
        <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">
            <img class="col-12 mb-3" src="/images/logo.png">

            <div class="row">
                <span class="col-12 p-0">이메일</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="email" name="userEmail" aria-label="Sizing example input"
                           class="form-control ${bindingResult.hasErrors() ? 'error' : ''}"
                           value="${bindingResult.getFieldValue('userLoginId')}">
                    <button class="btn btn-outline-secondary fs-6" type="button" id="sendEmailCode">인증코드 발송</button>
                </div>
                <div class="col-12 text-danger p-0 error-message">
                    이메일 오류메시지
                </div>
                <span class="col-12 p-0">이메일 인증 코드</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="text" aria-label="Sizing example input"
                           class="form-control ${bindingResult.hasErrors() ? 'error' : ''}"
                           value="${bindingResult.getFieldValue('userLoginId')}">
                    <button class="btn btn-outline-secondary fs-6" type="button" id="validateEmailCode">인증</button>
                </div>
                <div class="col-12 text-danger p-0 error-message">
                    이메일 인증 오류 메시지
                </div>
                <div class="col-12 text-success p-0">
                    이메일로 발송된 코드를 확인하세요.
                </div>
            </div>


            <div class="row">
                <span class="col-12 p-0">아이디</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="text" name="userLoginId" aria-label="Sizing example input"
                           class="form-control ${bindingResult.hasErrors() ? 'error' : ''}"
                           value="${bindingResult.getFieldValue('userLoginId')}">
                    <button class="btn btn-outline-secondary fs-6" type="button" id="idDupCheck">중복검사</button>
                </div>
                <div class="col-12 text-danger p-0 error-message">
                    닉네임 오류메시지
                </div>
                <div class="col-12 text-secondary p-0">
                    * 아이디 중복 확인 바랍니다.<br>
                    * 아이디는 영문자 및 숫자 4~12자 범위여야 합니다.<br>
                </div>
            </div>

            <div class="row">
                <span class="col-12 p-0">비밀번호</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="password" name="userPassword" aria-label="Sizing example input"
                           class="form-control ${bindingResult.hasErrors() ? 'error' : ''}"
                           value="${bindingResult.getFieldValue('userLoginId')}">
                </div>
                <div class="col-12 text-danger p-0 error-message">
                    비밀번호 오류메시지
                </div>
                <span class="col-12 p-0">비밀번호 확인</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="password" name="userPasswordCheck" aria-label="Sizing example input"
                           class="form-control ${bindingResult.hasErrors() ? 'error' : ''}"
                           value="${bindingResult.getFieldValue('userLoginId')}">
                </div>
                <div class="col-12 text-danger p-0 error-message">
                    비밀번호 확인 오류메시지
                </div>
            </div>

            <div class="row">
                <span class="col-12 p-0">닉네임</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="text" name="userNickname" aria-label="Sizing example input"
                           class="form-control ${bindingResult.hasErrors() ? 'error' : ''}"
                           value="${bindingResult.getFieldValue('userLoginId')}">
                    <button class="btn btn-outline-secondary fs-6" type="button" id="nicknameDupCheck">중복검사</button>
                </div>
                <div class="col-12 text-danger p-0 error-message">
                    닉네임 오류메시지
                </div>
            </div>

            <div class="row">
                <span class="col-12 p-0">생년월일</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <input type="date" name="userBirthday" aria-label="Sizing example input" class="form-control">
                </div>
            </div>

            <div class="row gap-1">
                <div class="col-12">
                    <input type="checkbox" id="allTermAgreement">
                    <span class="ms-2 termDesc">전체 동의</span>
                </div>
                    <hr class="my-1">
                <div class="col-12 d-flex">
                    <input type="checkbox" id="generalTermAgreement">
                    <span class="ms-2 termDesc">지피티쳐 이용약관 동의 (필수)</span>
                    <button type="button" id="generalTermDetail" class="termDetail btn btn-sm ms-auto text-secondary">자세히</button>
                </div>
                <div class="col-12 d-flex">
                    <input type="checkbox" id="privacyTermAgreement">
                    <span class="ms-2 termDesc">지피티쳐 개인정보 수집 및 이용 동의(필수)</span>
                    <button type="button" id="privacyTermDetail" class="termDetail btn btn-sm ms-auto text-secondary">자세히</button>
                </div>
                <div class="col-12 d-flex">
                    <input type="checkbox" id="emailSubscriptionAgreement" name="emailSubscriptionAgreement">
                    <span class="ms-2 termDesc">이메일을 통한 정보 및 광고성 알림 수신(선택)</span>
                </div>
            </div>

            <button id="submitBtn" type="button" type="col-12" class="btn btn-lg" style="background-color: #5DB99D; color: white">가입하기</button>

        </div>

    </form>

</section>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="/js/signupForm.js"></script>


</body>
</html>