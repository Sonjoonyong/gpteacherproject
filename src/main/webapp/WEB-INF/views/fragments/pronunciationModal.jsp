<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="pronunciationModal">
  <div id="pronunciationModalBody" class="shadow rounded-3 p-4 gap-2">
    <div id="pronunciationResult" class="fw-bold" style="color: #3b9d7f">
      녹음 버튼을 누르고 아래 문장을 큰 목소리로 발음해 보세요.
      <!-- 정확도 100% 입니다! -->
    </div>
    <!-- 목표 스크립트 -->
    <div class="border p-1 rounded-1 d-flex align-self-stretch my-3 p-2">
      <!-- 문장 듣기 버튼 -->
      <button id="pronunciationTtsBtn" class="btn col-1 p-0 d-flex align-items-center">
        <i class="bi bi-volume-up-fill"></i>
      </button>
      <div id="pronunciationTargetScript">
        pronunciationTargetScript

      </div>
    </div>
    <!-- 녹음 시작 -->
    <div class="justify-content-center">
      <button id="pronunciationRecord" class="btn rounded-circle text-center p-0 shadow">
        <i class="bi bi-mic fs-2" style="color: white"></i>
      </button>
      <!-- 녹음 종료 -->
      <button id="pronunciationStop" class="btn rounded-circle fs-5 text-center p-0 shadow">
        <i class="bi bi-square-fill"></i>
      </button>
    </div>

    <!-- 프로그레스 바 -->
    <div class="d-flex justify-content-center align-items-center" style="width: 300px">
      <div class="col-2 align-self-center"></div><!--dummy-->
      <progress class="col-8 me-1" id="pronunciationProgress" value="0" max="10" style="display:none;"></progress>
      <b id="pronunciationTime" class="col-2"></b>
    </div>

    <!-- 분석 중 -->
    <div id="pronunciationWaitingMessage" class="row justify-content-center my-3">
      <div class="col-12 text-center mb-2">
        <div class="spinner-border text-secondary" role="status"></div>
      </div>
      <div class="col-12 text-center">발음을 분석 중입니다.</div>
    </div>
    <button id="pronunciationClose" class="btn btn-secondary">
      닫기
    </button>
  </div>
</div>
