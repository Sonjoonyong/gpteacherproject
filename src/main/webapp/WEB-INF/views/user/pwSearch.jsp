<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>비밀번호 찾기</title>

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

<section class="container" style="max-width: 550px">

    <form class="login row flex-column g-0 justify-content-start rounded-5 my-auto p-5 mb-5"
        style="border: 2px solid #5DB99D; min-height: 500px;">

        <h3 class="h3 col-12 text-center">비밀번호 재발급</h3>

        <span class="col-12 p-0">아이디</span>
        <div class="col-12">
            <div class="input-group input-group-lg p-0 mb-3">
                <input id="userLoginId" name="userLoginId" class="form-control"/>
            </div>
        </div>

        <span class="col-12 p-0">이메일</span>
        <div class="col-12">
            <div class="input-group input-group-lg p-0 mb-3">
                <input id="userEmail" name="userEmail" class="text-danger form-control"/>
                <button class="btn btn-outline-secondary fs-6" type="button" id="sendNewPw">
                    재발급
                </button>
            </div>
        </div>

        <div id="userPasswordMsg" class="col-12 py-5 text-center">
        </div>
        <a href="/user/login" id="gotoLoginBtn" type="col-12" class="btn btn-md btn-secondary mt-auto"
           style="background-color: #5DB99D; color: white; display: none">로그인
        </a>

        <a href="/user/idsearch" id="gotoIdsearchBtn" type="col-12"
           class="btn btn-md btn-secondary mt-auto">
            아이디 찾으러 가기
        </a>

    </form>

</section>


<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="/js/pwsearch.js"></script>

</body>
</html>