<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row row-cols-1 col-md-2 myPageMenu" style="width:240px; height:250px; margin-top: 80px;">
    <div class="col mb-4 align-self-center text-center">
        <a class="menuAtag" href="/admin/trend"><h3>관리페이지</h3></a>
    </div>
    <div class="accordion accordion-flush col m-1 align-self-center" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    사용자 통계
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/trend">유저 동향</a></li>


                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    회원 조회
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/users">사용자 조회</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/blockusers">차단 사용자 관리</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    신고 관리
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <ul class="navbar-nav">
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/reportpostlist">신고 글 목록</a></li>
                        <li style="margin-bottom:10px;"><a class="menuAtag" href="/admin/reportreplylist">신고 댓글 목록</a></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>