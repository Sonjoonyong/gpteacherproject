<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row row-cols-1 col-md-2 myPageMenu" style="width:240px; height:250px; margin-top: 80px;">
    <div class="col mb-4 align-self-center text-center">
        <a class="menuAtag" href="/user/mypage/dashboard"><h3>마이페이지</h3></a>
    </div>
    <div class="accordion accordion-flush col m-1 align-self-center" id="accordionExample">
        <div class="accordion-item" id="itemOne">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    학습 현황
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/learnings" data-id="itemOne">학습 이력</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/sentences" data-id="itemOne">나의 문장</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/flashcards" data-id="itemOne">플래시 카드</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item" id="itemTwo">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    나의 활동
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/communities" data-id="itemTwo">내가 쓴 글</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/comments" data-id="itemTwo">내가 쓴 댓글</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/bookmarks" data-id="itemTwo">북마크</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item" id="itemThree">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    계정 관리
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/edit" data-id="itemThree">회원 정보 수정</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/edit/pw" data-id="itemThree">비밀번호 변경</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/user/mypage/withdraw" data-id="itemThree">회원 탈퇴</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const links = document.querySelectorAll('.menuAtag');
        const items = document.querySelectorAll('.accordion-item');
        const currentURL = window.location.href;

        // 활성화되지 않은 아코디언 항목만 축소하는 함수
        function collapseAllExceptActive() {
            items.forEach(item => {
                if (!item.classList.contains('active')) {
                    const collapseElement = item.querySelector('.accordion-collapse');
                    collapseElement.classList.remove('show');

                    const buttonElement = item.querySelector('.accordion-button');
                    buttonElement.setAttribute('aria-expanded', 'false');
                }
            });
        }

        // 링크들을 순환
        links.forEach(link => {
            if (currentURL.includes(link.href)) {
                const itemId = link.getAttribute('data-id');
                const item = document.getElementById(itemId);

                const buttonElement = item.querySelector('.accordion-button');
                buttonElement.classList.remove('collapsed')

                // 아코디언 항목에 'active' 클래스 추가
                if (item) {
                    item.classList.add('active');

                    // 다른 아코디언 항목을 축소
                    collapseAllExceptActive();

                    // 아코디언 항목 확장
                    const collapseElement = item.querySelector('.accordion-collapse');
                    collapseElement.classList.add('show');

                    // 버튼의 'aria-expanded' 속성을 'true'로 변경
                    const buttonElement = item.querySelector('.accordion-button');
                    buttonElement.setAttribute('aria-expanded', 'true');
                }
            }
        });

        // 활성 항목 제외한 모든 아코디언 접기
        collapseAllExceptActive();
    });
</script>