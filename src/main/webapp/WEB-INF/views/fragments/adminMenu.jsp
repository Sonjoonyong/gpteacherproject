<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row row-cols-1 col-md-2 myPageMenu" style="width:240px; height:250px; margin-top: 80px;">
    <div class="col mb-4 align-self-center text-center">
        <a class="menuAtag" href="/admin/trend"><h3>관리페이지</h3></a>
    </div>
    <div class="accordion accordion-flush col m-1 align-self-center" id="accordionExample">
        <div class="accordion-item" id="itemOne">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    사용자 통계
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/trend" data-id="itemOne">유저 동향</a></li>


                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item" id="itemTwo">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    회원 조회
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/users" data-id="itemTwo">회원 관리</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/blockusers" data-id="itemTwo">차단 회원 관리</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item" id="itemThree">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    신고 관리
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/reportpostlist" data-id="itemThree">신고 글 목록</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/reportreplylist" data-id="itemThree">신고 댓글 목록</a></li>

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