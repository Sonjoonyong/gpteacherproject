<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 작성댓글</title>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">작성댓글</h3>
            <div class="commentList">
                <c:forEach var="comment" items="${pageInfo.list}">
                    <div class="comment">
                        <div class="row justify-content-between">
                            <div class="col-md-9">${comment.communityReplyContent}</div>
                            <div class="col-md-2">
                                <fmt:formatDate value="${comment.communityReplyWritedate}" pattern="yyyy.MM.dd"/>
                            </div>
                        </div>
                        <div>
                            원글 링크
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>