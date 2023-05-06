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
    .nav-link {
      display: none;
    }
  </style>

  <link rel="stylesheet" href="/css/base.css">
  <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container d-flex" style="max-width: 600px">
  <div class="row align-content-center justify-content-center">
    <img src="/images/favicon.ico" class="w-auto mb-2" height="70px" alt="bot image">
    <h4 class="h4 mb-5 text-center">성공적으로 가입되었습니다.</h4>
    <a class="btn btn-primary w-auto shadow" href="/user/login">로그인 하러 가기</a>
  </div>
</section>


<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>


</body>
</html>