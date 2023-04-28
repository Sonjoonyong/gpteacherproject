<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회화 연습</title>

    <style>
        /* scrollbar track 노출 문제 해결 */
        /* Firefox */
        #dialogueBox {
            scrollbar-width: auto;
            scrollbar-color: #a2ddb8 #ffffff;
        }

        /* Chrome, Edge, and Safari */
        #dialogueBox::-webkit-scrollbar {
            width: 16px;
        }

        #dialogueBox::-webkit-scrollbar-track {
            background: #ffffff;
        }

        #dialogueBox::-webkit-scrollbar-thumb {
            background-color: #a2ddb8;
            border-radius: 10px;
            border: 3px solid #ffffff;
        }
    </style>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>


    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/pronunciationModal.css">


</head>
<body onload="init()">

<%@ include file="../../fragments/header.jsp" %>

<section class="container" style="max-width: 900px;">

    <h3 class="h3 text-center my-3" style="color: #5DB99D;">CONVERSATION</h3>
    <p class="text-center">영어 표현을 잘 모르겠으면 한국어로 말해보세요. 영어로 자동 변역됩니다.</p>

    <input type="hidden" id="learningId" value="${learningId}"/>



    <div id="dialogueBox" class="row align-content-start overflow-scroll p-2 my-3" style="height: 60vh;">
        <div class="row justify-content-center">
            <button id="startDialogue" class="btn btn-light mt-5 shadow py-2 rounded-3"
                    style="width: 150px; color: #5DB99D">
                대화 시작하기
            </button>
        </div>
        <div id="initialAssistantTalk" class="col-10 col-lg-8 me-auto">
            <div class="row g-0">
                <div class="col-1 d-flex py-2 my-2 me-2 align-items-start">
                    <img src="/images/favicon.ico" class="shadow rounded-circle" height="35px" alt="bot image">
                </div>
                <div class="assistantTalk col-10 rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;">
                    ${assistantTalk}
                </div>
            </div>
        </div>

    </div>
    <!-- dialogueBox end -->

    <div class="row g-0 justify-content-center g-0 gap-3 mb-5">
        <!-- 녹음 시작 -->
        <div class="row justify-content-center">
            <button id="record" class="btn rounded-circle text-center p-0 shadow" disabled>
                <i class="bi bi-mic fs-2" style="color: white"></i>
            </button>
            <!-- 녹음 종료 -->
            <button id="stop" class="btn rounded-circle fs-5 text-center p-0 shadow" disabled>
                <i class="bi bi-square-fill"></i>
            </button>
        </div>

        <!-- 프로그레스 바 -->
        <div class="row justify-content-center align-items-center" style="max-width: 400px;">
            <div class="col-2 align-self-center"></div><!--dummy-->
            <progress class="col-8" id="progress" value="0" max="10" style="display:none;"></progress>
            <b id="time" class="col-2"></b>
        </div>

        <!-- 분석 중 -->
        <div id="waitingMessage" class="row justify-content-center">
            <div class="col-12 text-center mb-2">
                <div class="spinner-border text-secondary" role="status"></div>
            </div>
            <div class="col-12 text-center">문장을 분석 중입니다.</div>
        </div>
    </div>

    <form method="get" action="/learning/correction/sentences">
        <input type="hidden" name="learningId" value="${learningId}">
        <div class="row justify-content-center">
            <input type="submit" id="stopDialogue" value="대화 그만하기"
                   class="btn btn-success shadow my-3 border-0 py-2 rounded-3"
                   style="width:120px; background-color: #5DB99D;">
        </div>
    </form>

</section>

<!-- 발음해보기 모달 -->
<%@ include file="../../fragments/pronunciationModal.jsp" %>

<%@ include file="../../fragments/footer.jsp" %>

<%-- 채팅 템플릿 --%>
<template>
    <div class="dialogue row">
        <!-- userTalk start -->
        <div class="col-10 ms-auto my-3 shadow rounded-3">
            <div class="sentence row g-0 py-3 align-items-end justify-content-between">  <!-- sentenceId 설정되는 태그 -->
                <div class="row px-0 g-0">
                    <div class="col-12 col-md-6 pe-1">
                        <div class="fw-bold" style="color: #2A6976;">
                            Your sentence
                        </div>
                        <div class="row g-0 justify-content-between border p-1 rounded-1">
                                <span class="yourSentence col-11 p-0">
                                    elit. Iusto, exercitationem de se ru nt om nis molestiae laborum
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
                                        <!-- 발음 정확도: 90% -->
                                </span>
                        </div>
                        <div class="row g-0 justify-content-between border p-1 rounded-1">
                            <!-- 문장 듣기 버튼 -->
                            <button class="btn ttsBtn col-1 p-0 border-0">
                                <i class="bi bi-volume-up-fill"></i>
                            </button>
                            <span class="col-11 p-0 correctedSentence">
                                        delectus dolore vero quidem laudantium eaque nemo!
                                </span>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-10">
                    <div class="fw-bold mt-2" style="color: #2F4858;">Explanation</div>
                    <div class="explanation border p-1 rounded-1">
                        교정에 대한 설명
                    </div>
                </div>

                <div class="col-12 col-md-2">
                    <div class="row g-0">
                        <button class="col-1 col-md-5 btn ms-md-auto" onclick="toggleSentenceLikeAjax(this)">
                            <i class="like bi bi-heart"></i>
                        </button>

                        <button class=" col-1 col-md-5 btn" onclick="toggleStorageAjax(this)">
                            <i class="storage bi bi-archive"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- userTalk end -->

        <!--assistantTalk-->
        <div class="col-10 col-lg-8 me-auto">
            <div class="row g-0">
                <div class="col-1 d-flex py-2 my-2 me-2 align-items-start">
                    <img src="/images/favicon.ico" class="shadow rounded-circle" height="35px" alt="bot image">
                </div>
                <div class="assistantTalk col-9 rounded-2 px-3 py-2 my-3 shadow" style="color: #7054ff;">
                    GPT의 톡
                </div>
            </div>
        </div>
    </div>
    <!--dialogue end-->

    <div class="text-center" style="margin-top: 80px; margin-bottom: 40px">
        <img src="/images/step_2and3.png" alt="Step Second" style="max-width: 100%;">
    </div>

</template>

<!--Wav 파일 업로드 라이브러리 -->
<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
<!-- 발음 평가 JS -->
<script src="/js/pronunciation.js"></script>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleStorageAjax.js"></script>
<script src="/js/ttsAjax.js"></script>
<script src="/js/dialoguePractice.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
