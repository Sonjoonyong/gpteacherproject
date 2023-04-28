<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPage - 플래시 카드</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/pronunciationModal.css">

    <%@ include file="../../fragments/bootstrapCss.jsp" %>
    <style>
        .quality {
            border-radius: 30px;
            background-color: #5DB99D;
            color: white;
        }
    </style>

</head>
<body onload="init()">
<%@ include file="../../fragments/header.jsp" %>

<section class="container">
    <div class="row">
        <%@ include file="../../fragments/mypageMenu.jsp" %>
        <div class="col-md-8 offset-md-1">
            <h3 class="h3 my-5" style="color: #5DB99D;">플래시 카드</h3>
            <c:if test="${limit == 0 || limit == null}">
                <div class="py-5" style="border: 1px solid lightgray; border-radius: 15px;" >
                    <c:if test="${sentencesCount == 0}">
                        <h4 class="text-center">오늘 복습할 내용이 없습니다.</h4>
                    </c:if>
                    <c:if test="${sentencesCount == -1}">
                        <h4 class="text-center">모든 학습이 종료 되었습니다.</h4>
                    </c:if>
                    <c:if test="${sentencesCount > 0 && sentencesCount != null}">
                        <form method="post" action="/user/mypage/flashcards">
                            <h4 class="text-center" style="color: #373737">
                                복습할 문장 수를 입력해 주세요 (최대 문장 수 : ${sentencesCount})
                            </h4>
                            <br/>
                            <div class="row g-0 my-2 py-1 justify-content-center">
                                <input type="text" class="col-md-3 form-control g-0 m-1" name="limit" style="width:150px;">
                                <input type="submit" class="col-md-auto btn btn-primary m-1" value="복습 시작">
                            </div>
                        </form>
                    </c:if>
                </div>
            </c:if>

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
                                        <button class="btn pronunciationBtn p-0 border-0" id="pronunciationBtn" style="display: none;">
                                            <i class="bi bi-mic" style="color: red;"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="row g-0 justify-content-between border p-3 my-2 rounded-1">
                                    <span class="yourSentence">
                                            ${sentence.sentenceAnswer}
                                    </span>
                                </div>
                            </div>
                            <div class="col-12 row g-0 py-3 justify-content-center">
                                <button class="col-md-auto btn btn-primary fw-bold" onclick="showAnswer(this)">Show Corrected Sentence</button>
                            </div>
                            <div class="col-12 g-0" id="showLater" style="display: none">
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
                                    <span class="correctedSentence">${sentence.sentenceCorrected}</span>
                                    </div>
                                </div>
                                <form method="post" action="/user/mypage/flashcards" id="updateIntervalForm">
                                    <input type="hidden" name="sentenceId" value="${sentence.id}">
                                    <input type="hidden" name="limit" value="${limit - 1}">
                                    <input type="hidden" name="quality" id="quality">
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
                    </div>
                </div>
                <!-- sentence end -->
            </c:forEach>
        </div>
    </div>
</section>
<!-- 발음해보기 모달 -->
<%@ include file="../../fragments/pronunciationModal.jsp" %>

<%@ include file="../../fragments/footer.jsp" %>

<!-- Wav 파일 업로드 라이브러리 -->
<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="/js/pronunciation.js"></script>
<script src="/js/ttsAjax.js"></script>


<script>
    let audio;

    function updateInterval(btn) {
        let form = document.getElementById('updateIntervalForm');
        document.getElementById('quality').value = btn.value;
        form.submit();
    }

    function showAnswer(btn) {
        let showDiv = document.getElementById('showLater');
        showDiv.style.display = 'block';
        document.getElementById('pronunciationBtn').style.display = 'inline-block';
        btn.style.display = 'none';
    }

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
                ttsAjax(document.querySelector('.correctedSentence').innerText);
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

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>