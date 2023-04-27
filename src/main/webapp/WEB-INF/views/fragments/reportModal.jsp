<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--신고하기 모달--%>
<div id="reportModal">
    <form id="reportModalBody" method="post"
          class="form-check login row g-0 justify-content-center px-5 py-4 rounded-3 my-auto flex-row"
          style="border: 2px solid #5DB99D; max-height: 80vh; overflow: scroll">

        <input type="hidden" id="reportSubjectId" name="reportSubjectId">
        <input type="hidden" id="reportSubject" name="reportSubject" value="communityPost">

        <h3 class="h3 col-12 text-center" id="title">신고하기</h3>
        <hr class="my-1">
        <div class="col-12 border-bottom pt-3 ps-3" id="information">
            <dl>
                <dt style="float:left;width: 65px;">작성자:</dt>
                <dd id="reportTargetWriter" style="padding-left: 8px;">윤대현</dd> <!--닉네임입력해주세요!!!-->
            </dl>
            <dl>
                <dt style="float:left; display: block; width: 65px;">내용 :</dt>
                <dd id="reportTargetContent" class="content" style="display: -webkit-box; position: relative;">
                    나쁜말나쁜말나쁜말나쁜말
                </dd> <!--글내용 또는 댓글 입력해주세요!!!-->
            </dl>
        </div>
        <div class="col-12">
            <ul class="list-group list-group-flush">
                <li class="list-group-item ps-5"><!--스팸홍보/도배글-->
                    <input class="form-check-input" type="radio" name="reportReason" id="0" value="스팸/광고" checked>
                    <label class="form-check-label fw-bold" for="0">
                        스팸홍보/도배글입니다.
                    </label>
                    <ul class="answer_area" id="sub">
                        <li class="list_answer" style="list-style: none;">- 사행성 오락이나 도박을 홍보하거나 권장하는 내용 등의 부적절한 스팸 홍보
                            행위
                        </li>
                        <li class="list_answer" style="list-style: none;">- 동일하거나 유사한 내용 반복 게시</li>
                    </ul>
                </li>
                <li class="list-group-item ps-5"><!--음란물-->
                    <input class="form-check-input" type="radio" name="reportReason" id="1" value="음란물">
                    <label class="form-check-label fw-bold" for="1">
                        음란물입니다.
                    </label>
                    <ul class="answer_area">
                        <li class="list_answer">- 성적 수치심을 일으키는 내용</li>
                        <li class="list_answer">- 아동이나 청소년을 성 대상화한 표현</li>
                        <li class="list_answer">- 과도하거나 의도적인 신체 노출 또는 음란한 행위와 관련되 부적절한 내용</li>
                    </ul>
                </li>
                <li class="list-group-item ps-5"><!--불법정보-->
                    <input class="form-check-input" type="radio" name="reportReason" id="2" value="욕설">
                    <label class="form-check-label fw-bold" for="2">
                        불법정보를 포함하고 있습니다.
                    </label>
                    <ul class="answer_area">
                        <li class="list_answer">- 불법 행위, 불법 링크에 대한 정보 제공</li>
                        <li class="list_answer">- 불법 상품을 판매하거나 유도하는 내용</li>
                    </ul>
                </li>
                <li class="list-group-item ps-5"><!--청소년에게 유해한 내용-->
                    <input class="form-check-input" type="radio" name="reportReason" id="3" value="청소년유해">
                    <label class="form-check-label fw-bold" for="3">
                        청소년에게 유해한 내용입니다.
                    </label>
                    <ul class="answer_area">
                        <li class="list_answer">- 가출/왕따/학교폭력/자살 등 청소년에게 부정적인 영향을 조성하는 내용</li>
                    </ul>
                </li>
                <li class="list-group-item ps-5">
                    <input class="form-check-input" type="radio" name="reportReason" id="4" value="욕설">
                    <label class="form-check-label fw-bold" for="4">
                        욕설/생명경시/혐오/차별적 표현입니다.
                    </label>
                    <ul class="answer_area">
                        <li class="list_answer">- 직간접적인 욕설을 사용하여 타인에게 모욕감을 주는 내용.</li>
                        <li class="list_answer">- 생명을 경시여기거나 비하하는 내용</li>
                        <li class="list_answer">- 계층/지역/종교/성별 등을 혐오하거나 비하하는 표현</li>
                    </ul>
                </li>
            </ul>
            <div class="row text-center mt-3">
                <button id="reportButton" type="button" class="btn btn-success my-2">신고하기</button>
                <button id="reportCancel" type="button" class="btn btn-secondary">취소</button>
            </div>
        </div>
    </form>

</div>