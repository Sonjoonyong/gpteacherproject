<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h3 class="h3 text-center my-3" style="color: #5DB99D;">나의 문장</h3>

<section class="container" style="max-width: 900px">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-9">
            <form action="/user/mypage/sentences" method="post" id="selectForm">
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

            <c:forEach var="sentence" items="${sentences}">
                <!-- sentence start -->
                <div class="row p-2 sentence justify-content-center" id="sentence_${sentence.id}">
                    <div class="row g-0 my-1 align-items-end justify-content-between shadow rounded-3 p-3">
                        <div class="row px-0 g-0">
                            <div class="col-12 col-md-6 pe-1">
                                <div class="fw-bold" style="color: #2A6976;">
                                    Your sentence
                                </div>
                                <div class="row g-0 justify-content-between border p-1 rounded-1">
                                <span class="yourSentence col-11 p-0">
                                        ${sentence.sentenceAnswer}
                                </span>
                                    <!-- 발음해보기 버튼-->
                                    <button class="btn pronunciationBtn col-1 p-0 border-0">
                                        <i class="bi bi-mic" style="color: red;"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 ps-1">
                                <div class="row g-0 fw-bold justify-content-between align-content-center">
                                <span class="col-12 col-md-8" style="color: #16967A;">
                                    Corrected sentence
                                </span>
                                    <span class="col-12 col-md-4 pronunciationAccuracy text-end">
                                <c:if test="${not empty sentence.sentenceAccuracy}">
                                    발음 정확도: ${sentence.sentenceAccuracy}%
                                </c:if>
                                </span>
                                </div>
                                <div class="row g-0 justify-content-between border p-1 rounded-1">
                                    <!-- 문장 듣기 버튼 -->
                                    <button class="btn ttsBtn col-1 p-0 border-0">
                                        <i class="bi bi-volume-up-fill"></i>
                                    </button>
                                    <span class="col-11 p-0 correctedSentence">
                                            ${sentence.sentenceCorrected}
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-9">
                            <div class="fw-bold" style="color: #2F4858;">Explanation</div>
                            <div class="explanation border p-1 rounded-1">
                                    ${sentence.sentenceExplanation}
                            </div>
                        </div>

                        <div class="col-12 col-md-3">
                            <div class="row g-0">
                                <button class="col-1 col-md-3 btn ms-md-auto" onclick="toggleSentenceLikeAjax(this)">
                                    <i class="like bi bi-heart${not empty sentence.sentenceLike && sentence.sentenceLike == '1'.charAt(0) ? '-fill' : ''}"></i>
                                </button>

                                <button class="col-1 col-md-3 btn" onclick="toggleStorageAjax(this)">
                                    <i class="storage bi bi-archive${not empty sentence.flashcardId && sentence.flashcardId != -2 ? '-fill' : ''}"></i>
                                </button>

                                <button class="col-1 col-md-3 btn" onclick="toggleSentenceDeleteAjax(this)">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- sentence end -->
            </c:forEach>
        </div>
    </div>


</section>

<%@ include file="../../fragments/footer.jsp" %>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleStorageAjax.js"></script>
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
