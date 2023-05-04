<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 회원 정보 조회/수정</title>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <div class="col-3">
            <%@ include file="../../fragments/mypageMenu.jsp" %>
        </div>

        <div class="col-12 col-md">
            <h3 class="h3 my-5" style="color: #5DB99D;">회원 정보 조회/수정</h3>


            <form:form modelAttribute="userEditInfoDto" method="post"
                       cssClass="userEditInfo row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
                       cssStyle="max-width: 500px;">
            <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">
                <c:if test="${not empty isEditSucceed}">
                    <div class="alert alert-success">
                        회원 정보가 변경되었습니다.
                    </div>
                </c:if>
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger">
                            ${errorMsg}
                    </div>
                </c:if>

                <div class="row">
                    <span class="col-12 p-0">아이디</span>
                    <input class="form-control" value="${userEditInfoDto.userLoginId}" disabled>
                </div>
                <div class="row">
                    <span class="col-12 p-0">생년월일</span>
                    <input class="form-control" value="<fmt:formatDate
                            value="${loginUser.userBirthday}" pattern="yyy-MM-dd" />"
                           disabled>
                </div>

                <div class="row">
                    <span class="col-12 p-0">닉네임<span class="text-muted ms-1"> (2~8자 범위로 입력해주세요.)</span></span>
                    <div class="col-12 input-group input-group-md p-0">
                        <form:input path="userNickname" class="form-control"/>
                        <button class="btn btn-outline-secondary fs-6" type="button" id="nicknameDupCheck">
                            중복검사
                        </button>
                    </div>
                    <div id="nicknameMsg" class="col-12 text-danger p-0">
                        <form:errors path="userNickname" cssClass="p-0 text-danger"/>
                            <%--닉네임 관련 메시지.--%>
                    </div>

                    <div class="row gap-0">
                        <div class="col-12 d-flex">
                            <form:checkbox id="userEmailAgreement" path="userEmailAgreement"/>
                            <span class="ms-2 termDesc d-flex align-items-center">이메일을 통한 정보 및 광고성 알림 수신(선택)</span>
                        </div>
                    </div>

                    <span class="col-12 p-0 mt-3">이메일</span>
                    <div class="input-group p-0">
                        <input id="userEmail" name="userEmail" type="text" class="form-control"
                               value="${loginUser.userEmail}" disabled>
                        <button class="btn btn-outline-secondary fs-6" type="button" id="sendEmailCode">
                            인증코드 발송
                        </button>
                    </div>

                    <div id="emailMsg" class="col-12 text-danger p-0">
                            <%--이메일 관련 메시지--%>
                    </div>

                    <span class="col-12 p-0">이메일 인증 코드</span>
                    <div class="input-group p-0">
                        <input id="userEmailCode" name="userEmailCode" type="text" class="form-control fs-6"
                               disabled>
                        <button class="btn btn-outline-secondary fs-6"
                                type="button" id="validateEmailCode" disabled>
                            인증
                        </button>
                    </div>
                    <div id="emailCodeMsg" class="col-12 text-success p-0">
                            <%--이메일 코드 관련 메시지.--%>
                    </div>

                </div>

                <button id="submitBtn" type="button" type="col-12" class="btn btn-md mt-3"
                        style="background-color: #5DB99D; color: white">
                    회원 정보 수정
                </button>

                </form:form>


            </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/editUserInfo.js"></script>


</body>
</html>