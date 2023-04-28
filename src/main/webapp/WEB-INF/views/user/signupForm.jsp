<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>회원가입</title>

    <style>
        nav .loginBtn, nav .signInBtn, nav .alarm {
            display: none;
        }

        .termDesc {
            color: gray;
        }

        #termModal {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 2;

            width: 100%;
            height: 100%;

            display: none;
            background-color: rgba(0, 0, 0, 0.4);
        }

        #termModal.show {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #termModalBody {
            position: fixed;
            width: 500px;
            height: 600px;
            overflow: auto;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            background-color: white;
        }

        pre {
            white-space: pre-wrap;
        }
    </style>


    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container" style="max-width: 600px">

    <form:form modelAttribute="userSignupDto" method="post"
               class="login row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
               style="border: 2px solid #5DB99D;">
        <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">
            <div class="row g-0 justify-content-center">
                <img class="col-9" src="/images/logo.png">
                <h3 class="h3 col-12 text-center">회원가입</h3>
            </div>

            <div class="row">
                <span class="col-12 p-0">이메일</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:input path="userEmail" class="form-control" autocomplete="off"/>
                    <button class="btn btn-outline-secondary fs-6" type="button" id="sendEmailCode">
                        인증코드 발송
                    </button>
                </div>
                <div id="emailMsg" class="col-12 text-danger p-0">
                    <form:errors path="userEmail" cssClass="p-0 text-danger"/>
                        <%--이메일 관련 메시지--%>
                </div>

                <span class="col-12 p-0">이메일 인증 코드</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:input path="userEmailCode" type="text" class="form-control" disabled="true" autocomplete="off"/>
                    <button class="btn btn-outline-secondary fs-6"
                            type="button" id="validateEmailCode" disabled>
                        인증
                    </button>
                </div>
                <div id="emailCodeMsg" class="col-12 text-success p-0">
                    <form:errors path="userEmailCode" cssClass="p-0 text-danger"/>
                        <%--이메일 코드 관련 메시지.--%>
                </div>
            </div>

            <div class="row">
                <span class="col-12 p-0">아이디</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:input path="userLoginId" type="text" class="form-control" autocomplete="off"/>
                    <button class="btn btn-outline-secondary fs-6" type="button" id="idDupCheck">중복검사</button>
                </div>
                <div id="loginIdMsg" class="col-12 text-danger p-0">
                    <form:errors path="userLoginId" cssClass="p-0 text-danger"/>
                        <%--아이디 관련 메시지--%>
                </div>
                <div id="loginIdInstruction" class="col-12 text-secondary p-0">
                    * 아이디는 영문자 및 숫자 6~12자 범위여야 합니다.<br>
                </div>
            </div>

            <div class="row">
                <span class="col-12 p-0">비밀번호</span>
                <div class="col-11 input-group input-group-lg p-0">
                    <form:password path="userPassword" class="form-control"/>
                    <button class="btn btn-outline-secondary viewPassword" type="button">
                        <i class="bi bi-eye-slash"></i>
                    </button>
                </div>
                <form:errors path="userPassword" cssClass="p-0 text-danger"/>
                <div id="passwordInstruction" class="col-12 text-secondary p-0">
                    비밀번호는 6~12자리의 영문자, 숫자 및 특수문자($@$!%*#?&)를 포함해 입력해주세요.
                </div>

                <span class="col-12 p-0">비밀번호 확인</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:password path="userPasswordCheck" class="form-control" autocomplete="off"/>
                    <button class="btn btn-outline-secondary viewPassword" type="button">
                        <i class="bi bi-eye-slash"></i>
                    </button>
                </div>
                <form:errors path="userPasswordCheck" cssClass="p-0 text-danger"/>
            </div>

            <div class="row">
                <span class="col-12 p-0">닉네임</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:input path="userNickname" class="form-control" autocomplete="off"/>
                    <button class="btn btn-outline-secondary fs-6" type="button" id="nicknameDupCheck">중복검사</button>
                </div>
                <div id="nicknameMsg" class="col-12 text-danger p-0">
                    <form:errors path="userNickname" cssClass="p-0 text-danger"/>
                        <%--닉네임 관련 메시지.--%>
                </div>
            </div>

            <div class="row">
                <span class="col-12 p-0">생년월일</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:input path="userBirthday" type="date" class="form-control" autocomplete="off"/>
                </div>
                <form:errors path="userBirthday" cssClass="p-0 text-danger"/>
            </div>

            <div class="row gap-0">
                <div class="col-12">
                    <form:checkbox path="userAllTermAgreement" id="userAllTermAgreement"/>
                    <span class="ms-2 termDesc">전체 동의</span>
                </div>
                <hr class="my-1">
                <div class="col-12 d-flex">
                    <form:checkbox path="userGeneralTermAgreement" id="generalTermAgreement"/>
                    <span class="ms-2 termDesc d-flex align-items-center">지피티쳐 이용약관 동의 (필수)</span>
                    <button type="button" id="generalTermDetail"
                            class="termDetail btn btn-sm ms-auto text-secondary p-0">자세히
                    </button>
                </div>
                <form:errors path="userGeneralTermAgreement" cssClass="p-0 text-danger ps-3"/>
                <div class="col-12 d-flex">
                    <form:checkbox path="userPrivacyTermAgreement"/>
                    <span class="ms-2 termDesc d-flex align-items-center">지피티쳐 개인정보 수집 및 이용 동의(필수)</span>
                    <button type="button" id="privacyTermDetail"
                            class="termDetail btn btn-sm ms-auto text-secondary p-0">자세히
                    </button>
                </div>
                <form:errors path="userPrivacyTermAgreement" cssClass="p-0 text-danger ps-3"/>
                <div class="col-12 d-flex">
                    <form:checkbox path="userEmailAgreement"/>
                    <span class="ms-2 termDesc d-flex align-items-center">이메일을 통한 정보 및 광고성 알림 수신(선택)</span>
                </div>
            </div>

            <button id="submitBtn" type="button" type="col-12" class="btn btn-lg"
                    style="background-color: #5DB99D; color: white">가입하기
            </button>

        </div>

    </form:form>

</section>

<%--약관 모달--%>
<div id="termModal">
    <div id="termModalBody"
         class="shadow rounded-3 p-4 gap-2 d-flex flex-column algin-items-center justify-content-between">

        <div id="generalTermContent" class="flex-column align-items-center justify-content-center">
            <h6 class="h5">서비스 이용 약관</h6>
            <pre class="border rounded-3 p-3"><%@ include file="./term/generalTerm.jsp" %></pre>
        </div>

        <div id="privacyTermContent" class="flex-column align-items-center justify-content-center">
            <h6 class="h5">개인정보 취급 방침</h6>
            <pre class="border rounded-3 p-3"><%@ include file="./term/privacyTerm.jsp" %></pre>
        </div>

        <button id="termModalCloseBtn" class="btn btn-secondary rounded-2 w-100 m-0">확인</button>
    </div>
</div>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="/js/signupForm.js"></script>

<script>
    // 생일 유효성 검사 1900-01-01 ~ 오늘
    const userBirthdayInput = document.querySelector('#userBirthday');
    userBirthdayInput.min = "1900-01-01";
    userBirthdayInput.max = new Date().toISOString().split('T')[0];
</script>


</body>
</html>