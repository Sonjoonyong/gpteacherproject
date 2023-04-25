<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 회원 정보 수정</title>

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
            <h3 class="h3 my-5" style="color: #5DB99D;">비밀번호 변경</h3>

            <form:form modelAttribute="userEditPwDto" method="post"
                       cssClass="userEditInfo row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
                       cssStyle="max-width: 500px;">
                <c:if test="${isEditSucceed}">
                    <div class="alert alert-success">
                        비밀번호가 변경되었습니다.
                    </div>
                </c:if>

                <div class="row g-0 d-flex flex-column justify-content-between align-items-center">

                    <div class="row">
                        <span class="col-12 p-0">현재 비밀번호</span>
                        <div class="col-11 input-group input-group-md p-0">
                            <form:password path="userPassword" class="form-control"/>
                            <button class="btn btn-outline-secondary viewPassword" type="button">
                                <i class="bi bi-eye-slash"></i>
                            </button>
                        </div>
                        <div id="userPasswordMsg" class="text-danger p-0">
                            <form:errors path="userPassword" cssClass="p-0 text-danger"/>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <span class="col-12 p-0">새 비밀번호</span>
                        <div class="col-11 input-group input-group-md p-0">
                            <form:password path="userNewPassword" class="form-control"/>
                            <button class="btn btn-outline-secondary viewPassword" type="button">
                                <i class="bi bi-eye-slash"></i>
                            </button>
                        </div>
                        <div id="userNewPasswordMsg" class="text-danger p-0">
                            <form:errors path="userNewPassword" cssClass="p-0 text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <span class="col-12 p-0">새 비밀번호 확인</span>
                        <div class="col-11 input-group input-group-md p-0">
                            <form:password path="userNewPasswordCheck" class="form-control"/>
                            <button class="btn btn-outline-secondary viewPassword" type="button">
                                <i class="bi bi-eye-slash"></i>
                            </button>
                        </div>
                        <div id="userNewPasswordCheckMsg" class="text-danger p-0">
                            <form:errors path="userNewPasswordCheck" cssClass="p-0 text-danger"/>
                        </div>
                    </div>

                    <button id="submitBtn" type="button" type="col-12" class="btn btn-md mt-5"
                            style="background-color: #5DB99D; color: white">
                        변경
                    </button>

                </div>

            </form:form>


        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

<script>

    const userPasswordInput = document.querySelector('#userPassword');
    const userNewPasswordInput = document.querySelector('#userNewPassword');
    const userNewPasswordCheckInput = document.querySelector('#userNewPasswordCheck');

    const userPasswordMsg = document.querySelector('#userPasswordMsg');
    const userNewPasswordMsg = document.querySelector('#userNewPasswordMsg');
    const userNewPasswordCheckMsg = document.querySelector('#userNewPasswordCheckMsg');

    document.querySelector('#submitBtn').onclick = (e) => {
        const newPw = userNewPasswordInput.value;
        const newPwCheck = userNewPasswordCheckInput.value;

        userPasswordMsg.innerText = '';
        userNewPasswordMsg.innerText = '';
        userNewPasswordCheckMsg.innerText = '';

        if (userPasswordInput.value === '') {
            userPasswordMsg.innerText = '비밀번호를 입력해주세요.';
            userPasswordInput.focus();
            return false;
        }

        if (userNewPasswordInput.value.search(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/g)) {
            userNewPasswordMsg.innerText = '비밀번호는 6~12 자리의 영문자, 숫자 및 특수문자($@$!%*#?&)를 포함해 입력해주세요.';
            userNewPasswordInput.focus();
            return false;
        }

        if (userNewPasswordCheckInput.value === '') {
            userNewPasswordCheckMsg.innerText = '비밀번호 확인을 입력해주세요.';
            userNewPasswordCheckInput.focus();
            return false;
        }

        if (newPw !== newPwCheck) {
            userNewPasswordCheckMsg.innerText = '새 비밀번호와 다릅니다.';
            userNewPasswordCheckInput.focus();
            return false;
        }

        e.currentTarget.closest('form').submit();
    }

    // 비밀번호 보기
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