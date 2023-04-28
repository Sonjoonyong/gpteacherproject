<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>문장별 분석</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/pronunciationModal.css">

    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body onload="init()">

<%@ include file="../fragments/header.jsp" %>

<section class="container" style="max-width: 900px">
    <h3 class="h3 text-center my-3" style="color: #5DB99D;">SENTENCES</h3>
    <p class="text-center">문장별 분석 화면입니다. 좋아요 표시를 하거나 플래시카드에 넣어 복습하세요!</p>

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

                <div class="col-12 col-md-10">
                    <div class="fw-bold" style="color: #2F4858;">Explanation</div>
                    <div class="explanation border p-1 rounded-1">
                            ${sentence.sentenceExplanation}
                    </div>
                </div>

                <div class="col-12 col-md-2">
                    <div class="row g-0">
                        <button class="col-1 col-md-5 btn ms-md-auto" onclick="toggleSentenceLikeAjax(this)">
                            <i class="like bi bi-heart${not empty sentence.sentenceLike && sentence.sentenceLike == '1'.charAt(0) ? '-fill' : ''}"></i>
                        </button>

                        <button class="col-1 col-md-5 btn" onclick="toggleStorageAjax(this)">
                            <i class="storage bi bi-archive${not empty sentence.flashcardId && sentence.flashcardId != -2 ? '-fill' : ''}"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- sentence end -->
    </c:forEach>

    <div class="text-center" style="margin-top: 80px; margin-bottom: 40px">
        <img src="/images/step_fourth.png" alt="Step Fourth" style="max-width: 100%;">
    </div>

</section>

<!-- 발음해보기 모달 -->
<%@ include file="../fragments/pronunciationModal.jsp" %>

<%@ include file="../fragments/footer.jsp" %>

<!-- Wav 파일 업로드 라이브러리 -->
<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>

<script src="/js/pronunciation.js"></script>
<script src="/js/ttsAjax.js"></script>
<script src="/js/toggleLikeAjax.js"></script>
<script src="/js/toggleStorageAjax.js"></script>

<script>
    let audio;
    function init() {
        if (navigator.mediaDevices) {
            navigator.mediaDevices.getUserMedia({audio: true}).then(stream => {
                // 발음 평가용 오디오 컨텍스트 초기화
                let audioContext = new AudioContext();
                let input = audioContext.createMediaStreamSource(stream);
                recorder = new Recorder(input);

                // 발음 평가 모달 녹음 버튼 설정
                setPronunciationRecordBtns();
                // 발음 평가, tts 버튼 설정
                setPronunciationBtns();
                setTtsBtns();

            }).catch(err => {
                console.log(err);
            });
        } else {
            console.log("미디어 장치 없음");
        }
    }

    function setTtsBtns() {
        let ttsBtns = document.getElementsByClassName('ttsBtn');
        for (let btn of ttsBtns) {
            // 진행중인 TTS 종료
            audio && audio.pause();

            btn.onclick = (e) => {
                ttsAjax(e.currentTarget.nextElementSibling.innerText);
            }
        }
    }

    // 발음 평가 버튼 설정
    function setPronunciationBtns() {
        let pronunciationBtns = document.getElementsByClassName('pronunciationBtn');
        for (let btn of pronunciationBtns) {
            const sentence = btn.closest('.sentence');
            let sentenceId = sentence.id.replace('sentence_', '');
            let correctedSentence = sentence.querySelector('.correctedSentence').innerText;

            btn.onclick = () => {
                pronunciationResultDiv.innerText = '녹음 버튼을 누르고 아래 문장을 큰 목소리로 발음해 보세요.';
                // 발음 평가받을 스크립트 변경
                pronunciationTargetScriptDiv.innerText = correctedSentence;
                targetSentenceId = sentenceId;

                // 발음 평가 모달 창 띄우기
                setPronunciationBtnsRecordPossible();
                pronunciationModal.classList.toggle('show', true);
                document.querySelector('body').style.overflow = 'hidden';

                // 진행중인 TTS 종료
                audio && audio.pause();
            }
        }
    }

</script>

<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>
