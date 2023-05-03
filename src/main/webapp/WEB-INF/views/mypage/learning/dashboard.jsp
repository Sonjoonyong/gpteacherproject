<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 학습관리</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/calendarHeatMap.css">

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
                <h4 class="my-3" style="color: #2F4858">최근 학습</h4>
                <c:if test="${fn:length(learnings) == 0}">
                <div class="py-5" style="border: 1px solid lightgray; border-radius: 15px;" >
                    <h4 class="text-center">새로운 학습을 시작해 보세요!</h4>
                </div>
                </c:if>
                <c:forEach var="learning" items="${learnings}">
                    <div class="row g-0 justify-content-center">
                        <div class="row g-0 learning my-1 shadow rounded-3 p-3" id="learning_${learning.id}">
                            <div class="row g-0 justify-content-between ">
                                <div class="row g-0 col-md-3">
                                    <div class="col-auto mx-2 align-self-center text-center fw-bold" style="color: #2A6976">${learning.learningType}</div>
                                    <c:if test="${not empty learning.learningTestType}">
                                        <div class="col-auto p-1 align-self-center text-center fw-bold rounded-1" style="color: #ffffff; background-color: darkcyan">${learning.learningTestType}</div>
                                    </c:if>
                                </div>
                                <div class="col-md-6 align-self-center" style="color: #373737">
                                    <fmt:formatDate value="${learning.learningDate}" pattern="yyy.MM.dd"/>
                                </div>
                                <div class="col-md-2 offset-md-1">
                                    <div class="row g-0">
                                        <button class="col-1 col-md-5 btn ms-md-auto" onclick="toggleLearningLikeAjax(this)">
                                            <i class="like bi bi-heart${not empty learning.learningLike && learning.learningLike == '1'.charAt(0) ? '-fill' : ''}"></i>
                                        </button>

                                        <button class="col-1 col-md-5 btn" onclick="toggleLearningDeleteAjax(this)">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-0 rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff; background-color: #7B61FF30">
                                <div class="col-md-2 align-self-center text-center fw-bold">
                                    <c:if test="${learning.learningType == 'DIALOGUE'}">
                                        Situation
                                    </c:if>
                                    <c:if test="${learning.learningType != 'DIALOGUE'}">
                                        Question
                                    </c:if>
                                </div>
                                <div class="col-md-10">
                                    <a href="/learning/correction/sentences?learningId=${learning.id}" style="text-decoration:none; color: #7054ff;">"${learning.learningTopic}"</a>
                                </div>
                            </div>
                            <div class="row g-0 px-1">
                                <div class="col-10 col-md-4" style="color: rgb(35, 28, 181);">
                                    <c:if test="${not empty learning.averageAccuracy}">
                                        평균 발음 정확도: ${learning.averageAccuracy}%
                                    </c:if>
                                </div>
                                <div class="col-10 col-md-4" style="color: rgb(35, 28, 181);">
                                    문장수: ${learning.sentenceCount}
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="mb-5">
                <h4 class="mb-3 mt-5" style="color: #2F4858">연간 학습</h4>
                <div id="calendar" class="py-3 calendar-heatmap"></div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleDeleteAjax.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.10.2/d3.min.js" charset="utf-8"></script>
<script src="/js/calendarHeatMap.js"></script>

<script>
    var jsonData = JSON.parse('${data}');
    calendarHeatmap.init(jsonData);

</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>
</body>
</html>
