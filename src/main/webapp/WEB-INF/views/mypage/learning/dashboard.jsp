<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 학습이력</title>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">학습 관리</h3>
            <div>
                <h2>최근 학습</h2>
            </div>
            <div>
                <h2>연간 학습</h2>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleDeleteAjax.js"></script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
