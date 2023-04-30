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
            <h3 class="h3 my-5" style="color: #5DB99D;">회원 정보 수정</h3>


            <form:form modelAttribute="userEditInfoDto" method="post"
                       cssClass="userEditInfo row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
                       cssStyle="max-width: 500px;">
                <div class="row g-0 d-flex flex-column justify-content-between align-items-center gap-4">

                    <c:if test="${isEditSucceed}">
                        <div class="alert alert-success">
                            회원 정보가 변경되었습니다.
                        </div>
                    </c:if>

                    <div class="row">
                        <span class="col-12 p-0">이메일</span>
                        <input class="form-control" value="${loginUser.userEmail}" disabled>
                    </div>
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
                        <span class="col-12 p-0">닉네임</span>
                        <div class="col-12 input-group input-group-md p-0">
                            <form:input path="userNickname" class="form-control"/>
                            <button class="btn btn-outline-secondary fs-6" type="button" id="nicknameDupCheck">중복검사
                            </button>
                        </div>
                        <div id="nicknameMsg" class="col-12 text-danger p-0">
                            <form:errors path="userNickname" cssClass="p-0 text-danger"/>
                                <%--닉네임 관련 메시지.--%>
                        </div>
                    </div>

                    <div class="row gap-0">
                        <div class="col-12 d-flex">
                            <form:checkbox path="userEmailAgreement"/>
                            <span class="ms-2 termDesc d-flex align-items-center">이메일을 통한 정보 및 광고성 알림 수신(선택)</span>
                        </div>
                    </div>

                    <div class="row">
                        <span class="col-12 p-0">비밀번호 확인</span>
                        <div class="col-11 input-group input-group-md p-0">
                            <form:password path="userPassword" class="form-control"/>
                            <button class="btn btn-outline-secondary viewPassword" type="button">
                                <i class="bi bi-eye-slash"></i>
                            </button>
                        </div>
                        <form:errors path="userPassword" cssClass="p-0 text-danger"/>
                    </div>

                    <button id="submitBtn" type="button" type="col-12" class="btn btn-md"
                            style="background-color: #5DB99D; color: white">수정 완료
                    </button>

                </div>

            </form:form>


        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

<script>
    const nicknameInput = document.querySelector('#userNickname');
    const nicknameMsgDiv = document.querySelector('#nicknameMsg');

    document.querySelector('#submitBtn').onclick = (e) => {
        e.currentTarget.closest('form').submit();
    }

    document.querySelector('#nicknameDupCheck').onclick = () => {
        const request = new XMLHttpRequest();
        const userNickname = nicknameInput.value;

        request.onload = () => {
            // true: 중복, false: 사용 가능, else: 에러메시지
            const response = request.responseText;

            // 안내문 기본 빨간색
            nicknameMsgDiv.classList.toggle("text-danger", true);
            nicknameMsgDiv.classList.toggle("text-success", false);

            if (response === 'true') {
                nicknameMsgDiv.innerText = '중복되는 닉네임입니다.';
            } else if (response === 'false') {
                nicknameMsgDiv.innerText = '사용 가능한 닉네임입니다.';
                nicknameMsgDiv.classList.toggle("text-danger", false);
                nicknameMsgDiv.classList.toggle("text-success", true);
            } else {
                nicknameMsgDiv.innerText = response;
            }
        }

        request.open("GET", '/user/mypage/checkNickname?userNickname=' + userNickname);
        request.setRequestHeader("Accept", "text/plain; charset=utf-8")
        request.send();
    }

    document.querySelectorAll('.viewPassword').forEach(el => {
        el.onclick = (event) => {
            const btn = event.currentTarget;
            const input = btn.previousElementSibling;
            const icon = btn.firstElementChild;
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.toggle('bi-eye', true);
                icon.classList.toggle('bi-eye-slash', false);
            } else {
                input.type = 'password';
                icon.classList.toggle('bi-eye', false);
                icon.classList.toggle('bi-eye-slash', true);
            }
        }
    });

</script>

</body>
</html>