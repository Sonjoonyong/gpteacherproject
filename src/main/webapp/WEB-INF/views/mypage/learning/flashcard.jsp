<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 플래시 카드</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../../fragments/bootstrapCss.jsp" %>
    <style>
        .quality {
            border-radius: 30px;
            background-color: #5DB99D;
            color: white;
        }
    </style>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">플래시 카드</h3>
            <div>
                <c:if test="${sentencesCount == 0}">
                    오늘 학습할 내용이 없습니다.
                </c:if>
                <c:if test="${sentencesCount != 0 && sentencesCount != null}">
                    <form method="post" action="/user/mypage/flashcards">
                        오늘 학습할 문장 수를 입력해 주세요 (최대 문장 수 : ${sentencesCount})
                        <br/>
                        <div class="row">
                            <input type="text" name="limit">
                            <input type="submit" class="quality" value="확인">
                        </div>
                    </form>
                </c:if>
            </div>

            <c:forEach var="sentence" items="${pageInfo.list}">
                <!-- sentence start -->
                <div class="row p-2 mx-5 sentence justify-content-center" id="sentence_${sentence.id}">
                    <div class="row g-0 my-1 align-items-end justify-content-between shadow rounded-3 p-3">
                        <div class="row justify-content-center">
                            <img src="/images/logo.png" class="col-4" alt="logo">
                        </div>
                        <div class="row px-0 g-0">
                            <div class="col-12 py-2" >
                                <div class="fw-bold" style="color: #2F4858;">Question</div>
                                <div class="explanation border p-3 my-2 rounded-1" style="color: #7054ff; background-color: #7B61FF30">
                                        "${sentence.sentenceQuestion}"
                                </div>
                            </div>
                            <div class="col-12 py-2">
                                <div class="row g-0">
                                    <div class="fw-bold" style="color: #2A6976;">
                                        Your sentence
                                        <!-- 발음해보기 버튼-->
                                        <button class="btn pronunciationBtn p-0 border-0">
                                            <i class="bi bi-mic" style="color: red;"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="row g-0 justify-content-between border p-3 my-2 rounded-1">
                                    <span class="yourSentence">
                                            "${sentence.sentenceAnswer}"
                                    </span>
                                </div>
                            </div>

                            <div class="col-12 py-2">
                                <div class="row g-0 fw-bold justify-content-between">
                                    <span class="col-12 col-md-4" style="color: #16967A;">
                                        Corrected sentence
                                        <!-- 문장 듣기 버튼 -->
                                        <button class="btn ttsBtn p-0 border-0">
                                            <i class="bi bi-volume-up-fill"></i>
                                        </button>
                                    </span>

                                    <span class="col-12 col-md-4 pronunciationAccuracy text-end">
                                        <c:if test="${not empty sentence.sentenceAccuracy}">
                                            발음 정확도: ${sentence.sentenceAccuracy}%
                                        </c:if>
                                    </span>
                                </div>
                                <div class="g-0 justify-content-between border p-3 my-2 rounded-1" style="border: #5DB99D">
                                    <span class="correctedSentence">
                                            "${sentence.sentenceCorrected}"
                                    </span>
                                </div>
                            </div>
                        </div>
                        <form method="post" action="/user/mypage/flashcards" id="updateIntervalForm">
                            <input type="hidden" name="sentenceId" value="${sentence.id}">
                            <input type="hidden" name="limit" value="${limit}">
                            <input type="hidden" name="quality" id="quality">
                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum + 1}">
                            <div class="row justify-content-center mt-4">
                                <button class="col-md-auto btn quality mx-1" value="0" onclick="updateInterval(this)">
                                    Again
                                </button>
                                <button class="col-md-auto btn quality mx-1" value="1" onclick="updateInterval(this)">
                                    Hard
                                </button>
                                <button class="col-md-auto btn quality mx-1" value="2" onclick="updateInterval(this)">
                                    Good
                                </button>
                                <button class="col-md-auto btn quality mx-1" value="3" onclick="updateInterval(this)">
                                    Easy
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- sentence end -->
            </c:forEach>
        </div>
    </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>

<script>
    function updateInterval(btn) {
        let form = document.getElementById('updateIntervalForm');
        document.getElementById('quality').value = btn.value;
        form.submit();
    }
</script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>