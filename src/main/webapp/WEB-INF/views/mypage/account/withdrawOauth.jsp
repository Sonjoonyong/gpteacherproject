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
                <div class="login row">
                    <span class="col-12 p-0 mb-4">아래 탈퇴 버튼을 누르시면 회원 탈퇴가 진행됩니다.</span>
                    <form method="post" action="/mypage/user/withdraw/oauth">
                        <button class="btn btn-danger w-auto" type="button" id="withdraw">
                            회원 탈퇴
                        </button>
                    </form>
                </div>
            </div>

        </div>
    </div>
    </div>

</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.querySelector('#withdraw').onclick = (e) => {
        Swal.fire({
            title: '정말 탈퇴하시겠어요?',
            showCancelButton: true,
            confirmButtonText: '탈퇴',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                e.target.closest('form').submit();
            }
        })
    }
</script>

</body>
</html>