<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>학습이력</title>

    <style>

    </style>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body onload="initSelect()">

<%@ include file="../../fragments/header.jsp" %>
<h3 class="h3 text-center my-3" style="color: #5DB99D;">학습관리 - 학습이력</h3>

<section class="container" style="max-width: 900px">
    <form action="/user/mypage/learnings" method="post" id="selectForm">
        <input type="hidden" id="learningType" value="${learningType}">
        <input type="hidden" id="sortType" value="${sortType}">
        <input type="hidden" id="onlyLike" name="onlyLike" value="${onlyLike}">
        <div class="row">
            <div class="col-10 col-md-2">
                <select name="learningType" id="learningTypeSelect" onchange="reLoad()">
                    <option value="all">전체</option>
                    <option value="SPEAKING">말하기 연습</option>
                    <option value="DIALOGUE">회화 연습</option>
                    <option value="WRITING">글쓰기 연습</option>
                </select>
            </div>
            <div class="col-10 col-md-2">
                <select name="sortType" id="sortTypeSelect" onchange="reLoad()">
                    <option value="id_desc">최신순</option>
                    <option value="id_asc">오래된 순</option>
                </select>
            </div>
            <div class="col-10 col-md-4">
                <input type="checkbox" id="likeCheck" onclick="reLoad()">좋아요 표시만 보기
            </div>
        </div>
    </form>
    <c:forEach var="learning" items="${learnings}">
        <div class="row g-0 learning my-1 align-items-end justify-content-between shadow rounded-3 p-3" id="learning_${learning.id}">
            <div class="row">
                <div class="col-12 col-md-4">
                    ${learning.learningType}
                    ${learning.learningTestType}
                </div>
                <div class="col-12 col-md-6">
                    ${learning.learningDate}
                </div>
                <div class="col-12 col-md-2">
                    <div class="row g-0">
                        <button class="col-1 col-md-5 btn ms-md-auto" onclick="toggleLearningLikeAjax(this)">
                            <i class="like bi bi-heart${not empty learning.learningLike && learning.learningLike == '1'.charAt(0) ? '-fill' : ''}"></i>
                        </button>

                        <button class="col-1 col-md-5 btn" onclick="toggleDeleteAjax(this)">
                            <i class="storage bi bi-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div>
                    Question "${learning.learningTopic}"
                </div>
            </div>
            <div class="row">
                <div class="col-10 col-md-4">
                    <c:if test="${not empty learning.averageAccuracy}">
                        평균 발음 정확도: ${learning.averageAccuracy}%
                    </c:if>
                </div>
                <div class="col-10 col-md-4">
                    문장수: ${learning.sentenceCount}
                </div>
            </div>
        </div>
    </c:forEach>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleDeleteAjax.js"></script>

<script>
function initSelect() {
    let learningType = document.getElementById('learningType').value;
    let sortType = document.getElementById('sortType').value;
    let like = document.getElementById('onlyLike').value;

    let learningTypeSelect = document.getElementById('learningTypeSelect');
    let sortTypeSelect = document.getElementById('sortTypeSelect');
    let likeCheck = document.getElementById('likeCheck');

    if (learningType != null) {
        for (let i=0; i<learningTypeSelect.options.length; i++) {
            if(learningTypeSelect.options[i].value == learningType) {
                learningTypeSelect.options[i].selected = true;
            }
        }
    }

    if (sortType != null) {
        for (let i=0; i<sortTypeSelect.options.length; i++) {
            if(sortTypeSelect.options[i].value == sortType) {
                sortTypeSelect.options[i].selected = true;
            }
        }
    }

    if (like == '1') { //reload를 분리시키면 like유지 해제 가능할 듯
        likeCheck.checked = true;
    }
}
function reLoad() {
    let likeCheck = document.getElementById('likeCheck');
    let form = document.getElementById('selectForm');

    if (likeCheck.checked == true) {
        document.getElementById('onlyLike').value = '1';
    } else {
        document.getElementById('onlyLike').value = null;
    }
    form.submit();
}

</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>