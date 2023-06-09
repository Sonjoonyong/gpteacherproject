<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>아이디 찾기</title>

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

    <div class="login row flex-column g-0 justify-content-start rounded-5 p-5 pt-1 my-auto shadow"
         style="border: 2px solid #5DB99D;">
        <div class="row g-0 justify-content-center">
            <img class="col-9" src="/images/logo.png">
            <h3 class="h3 col-12 text-center">아이디 찾기</h3>
        </div>

            <span class="col-12 p-0 mt-3">아이디 찾기 질문</span>
            <div class="col-12 input-group p-0">
                <select id="userSecurityQuestion" name="userSecurityQuestion" class="form-select">
                    <option value="" disabled selected>아이디 찾기 질문을 선택하세요</option>
                    <c:forEach var="question" items="${userSecurityQuestions}">
                        <option class="form-control" value="${question}">${question}</option>
                    </c:forEach>
                </select>
            </div>
            <div id="securityQuestionMsg" class="col-12 text-danger p-0">
                <%--아이디 찾기 질문 관련 메시지--%>
            </div>

            <span class="col-12 p-0">아이디 찾기 답변</span>
            <div class="col-12 input-group p-0">
                <input type="text" id="userSecurityAnswer" name="userSecurityAnswer" class="form-control" autocomplete="off"/>
            </div>
            <div id="securityAnswerMsg" class="col-12 text-danger p-0">
                <%--아이디 찾기 답변 관련 메시지--%>
            </div>

        <span class="col-12 p-0 mt-3">이메일</span>
        <div class="col-12">
            <div class="input-group p-0">
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
            <div class="input-group p-0">
                <input id="userEmailCode" name="userEmailCode" type="text" class="form-control" disabled>
                <button class="btn btn-outline-secondary fs-6"
                        type="button" id="validateEmailCode" disabled>
                    인증 후 아이디 조회
                </button>
            </div>
        </div>
        <div id="emailCodeMsg" class="col-12 text-success p-0">
            <%--이메일 코드 관련 메시지.--%>
        </div>

        <div id="userLoginIdMsg" class="row g-0 pt-5" style="display: none">
            <div class="col-12 text-center">아이디는
                <span id="userLoginId" class="fw-bold"></span>
                입니다.
            </div>
        </div>

        <a href="/user/pwsearch" id="submitBtn" class="btn btn-md btn-secondary mt-5">
            비밀번호 재발급 받으러 가기
        </a>

    </div>

</section>


<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="/js/idsearch.js"></script>

</body>
</html>