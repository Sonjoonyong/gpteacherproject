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
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">회원 탈퇴</h3>
            <div class="login row flex-column g-0 justify-content-start rounded-5 my-auto p-5 pt-3"
                 style="min-height: 500px;">

                <span class="col-12 p-0">이메일</span>
                <div class="col-12">
                    <div class="input-group input-group-lg p-0 mb-3">
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
                    <div class="input-group input-group-lg p-0">
                        <input id="userEmailCode" name="userEmailCode" type="text" class="form-control" disabled>
                        <button class="btn btn-outline-secondary fs-6"
                                type="button" id="validateEmailCode" disabled>
                            인증
                        </button>
                    </div>
                </div>
                <div id="emailCodeMsg" class="col-12 text-success p-0">
                    <%--이메일 코드 관련 메시지.--%>
                </div>

                <a href="/user/pwsearch" id="submitBtn" class="btn btn-md btn-secondary mt-auto">
                    회원 탈퇴
                </a>

            </div>

        </div>
    </div>

</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>