<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Correction</title>

    <style>
        .bi-heart-fill {
            color: red;
        }

        .bi-archive-fill {
            color: rgb(57, 116, 25);
        }
    </style>

    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<h3 class="h3 text-center my-3" style="color: #5DB99D;">SENTENCES</h3>
<p class="text-center">문장별 분석 화면입니다. 좋아요 표시를 하거나 플래시카드에 넣어 복습하세요!</p>


<section class="container">
    <c:forEach var="sentence" items="${sentences}">
        <div class="dialogue row p-2 sentence justify-content-center" id="${sentence.id}">
            <!-- sentence start -->
            <div class="col-10 my-3 shadow rounded-3">

                <div class="row g-0 py-3 gap-2">

                    <div class="userTalk col g-0 justify-content-center">
                        <div class="row px-0">
                            <div class="col-12 col-md-6">
                                <div class="fw-bold" style="color: #2A6976;">
                                    Your sentence
                                </div>
                                <div class="yourSentence border p-1 rounded-1">
                                        ${sentence.sentenceAnswer}
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="fw-bold" style="color: #16967A;">
                                    Corrected sentence
                                </div>
                                <div class="correctedSentence border p-1 rounded-1">
                                        ${sentence.sentenceCorrected}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row g-0 align-items-end justify-content-between">
                        <div class="col-12 col-md-10">
                            <div class="fw-bold" style="color: #2F4858;">Explanation</div>
                            <div class="explanation border p-1 rounded-1">
                                    ${sentence.sentenceExplanation}
                            </div>
                        </div>

                        <div class="col-12 col-md-2">
                            <div class="row g-0">
                                <button class="col-1 col-md-5 btn ms-md-auto" id="like" value="${sentence.id}" onclick="statusUpdateAjax(this)">
                                    <i class="bi bi-heart"></i>
                                    <i class="bi bi-heart-fill danger" style="display: none;"></i>
                                </button>


                                <button class="col-1 col-md-5 btn" id="storage" value="${sentence.id}" onclick="statusUpdateAjax(this)">
                                    <i class="bi bi-archive"></i>
                                    <i class="bi bi-archive-fill danger" style="display: none;"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- sentence end -->
    </c:forEach>


</section>

<script>
    function statusUpdateAjax(btn) {
        let request = new XMLHttpRequest();
        let sentenceId = btn.value;
        let type = btn.getAttribute('id'); //like or storage

        request.onload = () => {
            let status = request.response;
            if (status=="1") {
                btn.children[0].style.display = 'none'; //emptyHeart or emptyStorage
                btn.children[1].style.display = 'block'; //fillHeart or fillStorage
            } else {
                btn.children[0].style.display = 'block';
                btn.children[1].style.display = 'none';
            }
        }

        request.open("GET", "/learning/sentence/statusUpdate?sentenceId="+sentenceId+"&type="+type);
        request.send();
    }

</script>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>
