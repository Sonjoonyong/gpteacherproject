<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row row-cols-1 col-md-2 myPageMenu" style="width:240px; height:250px; margin-top: 80px;">
    <div class="col mb-4 align-self-center text-center">
        <a class="menuAtag" href="/user/mypage/dashboard"><h3>마이페이지</h3></a>
    </div>
    <div class="accordion accordion-flush col m-1 align-self-center" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    학습이력
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/learnings">학습 이력</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/sentences">나의 문장</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/flashcards">플래시 카드</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    나의 활동
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/communities">내가 쓴 글</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/comments">내가 쓴 댓글</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/bookmarks">북마크</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    계정 관리
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/edit">회원 정보 수정</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/pwdEdit">비밀번호 변경</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/withdraw">회원 탈퇴</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>