<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 회원탈퇴</title>

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

        <div class="col">
            <div class="row">

                <h3 class="h3 col-8 my-5" style="color: #5DB99D;">회원 탈퇴</h3>
                <div class="login row flex-column g-0 justify-content-start rounded-5 my-auto p-5 pt-3"
                     style="min-height: 500px;">

                    <span class="col-12 p-0 mb-4">비밀번호 입력 후 탈퇴 버튼을 누르시면 회원 탈퇴가 진행됩니다.</span>

                    <span class="col-12 p-0">비밀번호</span>
                    <div class="col-12">
                        <div class="input-group input-group-sm p-0 mb-3" style="max-width: 300px;">
                            <input id="userPassword" name="userPassword" type="password" class="form-control">
                            <button class="btn btn-secondary fs-6" type="button" id="withdraw">
                                탈퇴
                            </button>
                        </div>
                        <div class="col-12 text-danger" id="passwordMsg"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

<script>

    const userPasswordInput = document.querySelector('#userPassword');
    const withdrawBtn = document.querySelector('#withdraw');
    const passwordMsgDiv = document.querySelector('#passwordMsg');

    withdrawBtn.onclick = () => {
        Swal.fire({
            title: '정말 탈퇴하시겠어요?',
            showCancelButton: true,
            confirmButtonText: '탈퇴',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                withdrawAjax();
            }
        })
    }

    function withdrawAjax() {
        const request = new XMLHttpRequest();

        request.onload = () => {
            const response = request.responseText;

            if (response === 'true') {
                Swal.fire("회원 탈퇴가 완료되었습니다.");
                location.href = '/main';
            } else {
                passwordMsgDiv.innerText = '비밀번호가 일치하지 않습니다.';
            }
        }
        const params = new URLSearchParams();
        params.append("userPassword", userPasswordInput.value);

        request.open("POST", "/user/mypage/withdraw")
        request.send(params);
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>