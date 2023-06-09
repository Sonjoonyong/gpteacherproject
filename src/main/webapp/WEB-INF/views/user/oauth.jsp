<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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

    <form:form modelAttribute="userOauthSignupDto" method="post"
               class="login row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
               style="border: 2px solid #5DB99D;">
        <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">
            <img class="col-12 mb-3" src="/images/logo.png">

            <div class="row">
                <span class="col-12 p-0">닉네임</span>
                <div class="col-12 input-group input-group-lg p-0">
                    <form:input path="userNickname" class="form-control"/>
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
                    <form:input path="userBirthday" type="date" class="form-control"/>
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

        <div id="privacyTermContent" class="flex-column align-items-center justify-content-center" >
            <h6 class="h5">개인정보 취급 방침</h6>
            <pre class="border rounded-3 p-3"><%@ include file="./term/privacyTerm.jsp" %></pre>
        </div>

        <button id="termModalCloseBtn" class="btn btn-secondary rounded-2 w-100 m-0">확인</button>
    </div>
</div>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="/js/oauthSignupForm.js"></script>


</body>
</html>