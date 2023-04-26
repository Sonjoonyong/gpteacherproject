<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 플래시 카드</title>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">플래시 카드</h3>
            <hr>
            <form method="post" action="/user/mypage/flashcards" class="">
                <div>
                    <div class="row justify-content-end">
                        <button class="col btn">
                            <i class="bi bi-plus-circle"></i>
                        </button>
                    </div>
                    <c:forEach var="flashcard" items="${pageInfo.list}">
                        <div class="row my-2 p-2 g-0 align-items-center" style="border-radius: 5px; border: 1px solid #;">
                            <div class="col-md-1 row g-0 justify-content-center">
                                <input class="form-check-input mt-0" type="checkbox" name="deleteId" value="${flashcard.id}">
                            </div>
                            <div class="col-md-10">${flashcard.flashcardName}</div>
                            <div class="col-md-1 row g-0">
                                <button class="btn">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </form>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>