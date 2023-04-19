<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="myPageMenu" style="width: 200px;">
    <div class="content-justify-center" style="font-weight: bolder">
        마이페이지
    </div>
    <div class="accordionBox">
        <div class="learning">
            <div class="row">
                <div class="col-6 col-md-1">
                    <i class="bi bi-chevron-up"></i>
                </div>
                <div class="col-6 col-md-5">
                    학습이력
                </div>
            </div>
            <div>
                <ul class="learning">
                    <li><a href="/user/mypage/learnings">학습 이력</a></li>
                    <li><a href="/user/mypage/sentences">나의 활동</a></li>
                    <li><a href="/user/mypage/flashcards">플래시 카드</a></li>
                </ul>
            </div>
        </div>
        <div><a href="#">나의 활동</a>
            <ul class="activity">
                <li><a href="/user/mypage/communities">작성 글</a></li>
                <li><a href="/user/mypage/comments">작성 댓글</a></li>
                <li><a href="/user/mypage/bookmarks">북마크</a></li>
            </ul>
        </div>
        <div><a href="#">계정 관리</a>
            <ul class="account">
                <li><a href="/user/mypage/edit">회원 정보 수정</a></li>
                <li><a href="/user/mypage/pwdEdit">비밀번호 변경</a></li>
                <li><a href="/user/mypage/withdraw">회원 탈퇴</a></li>

            </ul>
        </div>
    </div>
</div>
