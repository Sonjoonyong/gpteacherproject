<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--문장 선택하기 모달--%>
<div id="sentenceModal">
    <div id="sentenceModalBody" class="container justify-content-center rounded-3 p-4"
         style="height: 80vh; max-width: 1000px;">

        <div class="h5 my-3">게시글에 첨부할 문장을 선택하세요</div>
        <div class="hstack gap-2 mb-3">
            <select class="form-select w-auto" name="learningType"
                    id="learningType">
                <option value="" selected>전체</option>
                <option value="SPEAKING">말하기 연습</option>
                <option value="DIALOGUE">회화 연습</option>
                <option value="WRITING">글쓰기 연습</option>
            </select>
            <select class="form-select w-auto" name="sortType" id="sortType">
                <option value="id_desc">최신순</option>
                <option value="id_asc">오래된 순</option>
            </select>
            <input class="form-check-input" type="checkbox" id="likeCheck" name="likeCheck">
            <label class="form-check-label" for="likeCheck">좋아요 표시만 보기</label>
        </div>

        <div id="sentenceBox" class="vstack p-3 gap-2" style="overflow: scroll">
            <%--sentence--%>
            <div id="scrollFooter"></div>
        </div>

        <button id="sentenceModalClose" class="btn btn-light shadow-sm w-100" type="button">
            취소
        </button>
    </div>
</div>