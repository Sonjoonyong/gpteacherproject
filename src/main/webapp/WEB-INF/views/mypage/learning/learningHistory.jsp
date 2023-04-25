<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>학습이력</title>

    <link rel="stylesheet" href="/css/base.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body onload="initSelect()">

<%@ include file="../../fragments/header.jsp" %>

<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">학습 이력</h3>
            <div class="pb-2">
                <form action="/user/mypage/learnings" method="post" id="selectForm">
                    <input type="hidden" id="learningType" value="${learningType}">
                    <input type="hidden" id="sortType" value="${sortType}">
                    <input type="hidden" id="onlyLike" name="onlyLike" value="${onlyLike}">
                    <input type="hidden" id="pageNum" name="pageNum">
                    <div class="row align-items-center">
                        <div class="col-md-3">
                            <select class="form-select" aria-label="Default select example" name="learningType" id="learningTypeSelect" onchange="reLoad()">
                                <option value="all">전체</option>
                                <option value="SPEAKING">말하기 연습</option>
                                <option value="DIALOGUE">회화 연습</option>
                                <option value="WRITING">글쓰기 연습</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="form-select" aria-label="Default select example" name="sortType" id="sortTypeSelect" onchange="reLoad()">
                                <option value="id_desc">최신순</option>
                                <option value="id_asc">오래된 순</option>
                            </select>
                        </div>
                        <div class="form-check col-md-4 ms-1">
                            <input class="form-check-input" type="checkbox" id="flexCheckDefault" name="likeCheck" onclick="reLoad()">
                            <label class="form-check-label" for="flexCheckDefault">좋아요 표시만 보기</label>
                        </div>
                    </div>
                </form>
            </div>
            <c:forEach var="learning" items="${pageInfo.list}">
                <div class="row p-2 pe-5 justify-content-center">
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
            <div class="row pe-5 mt-3 mb-4 justify-content-end">
                <div class="col-md-auto g-0">
                    <input type="button" class="btn btn-primary" value="전체 삭제" onclick=""/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 d-flex justify-content-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="reLoad(1)" aria-label="First">
                                        <span aria-hidden="true">«</span>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="reLoad(${pageInfo.prePage})" aria-label="Previous">
                                        <span aria-hidden="true">‹</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" step="1">
                                <c:choose>
                                    <c:when test="${i == pageInfo.pageNum}">
                                        <li class="page-item active">
                                            <a class="page-link" href="javascript:void(0)" onclick="reLoad(${i})">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="javascript:void(0)" onclick="reLoad(${i})">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${pageInfo.hasNextPage}">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="reLoad(${pageInfo.nextPage})" aria-label="Next">
                                        <span aria-hidden="true">›</span>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="reLoad(${pageInfo.pages})" aria-label="Last">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>

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
    let likeCheck = document.getElementById('flexCheckDefault');

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
function reLoad(pageNum) {
    let likeCheck = document.getElementById('flexCheckDefault');
    let form = document.getElementById('selectForm');

    if (likeCheck.checked == true) {
        document.getElementById('onlyLike').value = '1';
    } else {
        document.getElementById('onlyLike').value = null;
    }

    if(pageNum != null) {
        document.getElementById('pageNum').value = pageNum;
    }

    form.submit();
}

</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>