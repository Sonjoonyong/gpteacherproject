<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <style>
        .form-check ul li {
            list-style: none;

        }

        .form-check .row .content {
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            display: -webkit-box;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .btn.btn-success {
            width: 450px;
            height: 45px;
            background-color: #5DB99D;
        }

        .form-check-input {
            margin-top: 10px;
        }

        input[type=radio]:checked {
            width: 20px;
            height: 20px;
            background-color: #5DB99D;
            border-color: #5DB99D;
        }

        .row.reportselect {
            border: 1px solid black;
        }

        .form-check-label {
            font-size: larger;
            font-weight: bolder;
            padding-left: 10px;
        }

        .answer_area {
            padding-left: 5px;
        }

        .form-check ul li {
            margin-top: 7px;
        }

        #title {
            margin-top: 5px;
            margin-bottom: 10px;
        }

        #information {
            margin-top: 15px;
            margin-bottom: 10px;
        }
    </style>
    <!--내용이 한줄 넘어가면 알아서 ... 표시해준다_webkit-->

</head>
<body>

<%@ include file="../fragments/header.jsp" %>
<!---->
<section class="container" style="max-width: 600px">
    <form action="" method="POST"> <!--action 넣어주세요!!!-->
        <div class="form-check login row g-0 justify-content-center pb-5 pt-3 px-5 rounded-5 my-auto mb-5"
             style="border: 2px solid #5DB99D;">
            <h3 class="h3 col-12 text-center" id="title">신고하기</h3>
            <hr class="my-1">
            <div class="col-12" id="information">
                <dl>
                    <dt style="float:left;width: 65px;">작성자 :</dt>
                    <dd style="padding-left: 8px;"> 윤대현</dd> <!--닉네임입력해주세요!!!-->
                </dl>
                <dl>
                    <dt style="float:left; display: block; width: 65px;">내용 :</dt>
                    <dd class="content" style="display: -webkit-box; position: relative;">[토익] 토익진짜개같음십[토익] 토익진짜개같음십[토익]
                        토익진짜개같음십[토익]
                    </dd> <!--글내용 또는 댓글 입력해주세요!!!-->
                </dl>
            </div>
            <div class="col-12">
                <ul>
                    <li><!--스팸홍보/도배글-->
                        <input class="form-check-input" type="radio" name="exampleRadios" id="0" value="spam">
                        <label class="form-check-label" for="0">
                            스팸홍보/도배글입니다.
                        </label>
                        <ul class="answer_area" id="sub" style="padding-left: 5px;">
                            <li class="list_answer" style="list-style: none;">- 사행성 오락이나 도박을 홍보하거나 권장하는 내용 등의 부적절한 스팸 홍보
                                행위
                            </li>
                            <li class="list_answer" style="list-style: none;">- 동일하거나 유사한 내용 반복 게시</li>
                        </ul>
                    </li>
                    <li><!--음란물-->
                        <input class="form-check-input" type="radio" name="exampleRadios" id="1" value="porno">
                        <label class="form-check-label" for="1">
                            음란물입니다.
                        </label>
                        <ul class="answer_area">
                            <li class="list_answer">- 성적 수치심을 일으키는 내용</li>
                            <li class="list_answer">- 아동이나 청소년을 성 대상화한 표현</li>
                            <li class="list_answer">- 과도하거나 의도적인 신체 노출 또는 음란한 행위와 관련되 부적절한 내용</li>
                        </ul>
                    </li>
                    <li><!--불법정보-->
                        <input class="form-check-input" type="radio" name="exampleRadios" id="2" value="욕설">
                        <label class="form-check-label" for="2">
                            불법정보를 포함하고 있습니다.
                        </label>
                        <ul class="answer_area">
                            <li class="list_answer">- 불법 행위, 불법 링크에 대한 정보 제공</li>
                            <li class="list_answer">- 불법 상품을 판매하거나 유도하는 내용</li>
                        </ul>
                    </li>
                    <li><!--청소년에게 유해한 내용-->
                        <input class="form-check-input" type="radio" name="exampleRadios" id="3" value="청소년유해">
                        <label class="form-check-label" for="3">
                            청소년에게 유해한 내용입니다.
                        </label>
                        <ul class="answer_area">
                            <li class="list_answer">- 가출/왕따/학교폭력/자살 등 청소년에게 부정적인 영향을 조성하는 내용</li>
                        </ul>
                    </li>
                    <li>
                        <input class="form-check-input" type="radio" name="exampleRadios" id="4" value="욕설">
                        <label class="form-check-label" for="4">
                            욕설/생명경시/혐오/차별적 표현입니다.
                        </label>
                        <ul class="answer_area">
                            <li class="list_answer">- 직간접적인 욕설을 사용하여 타인에게 모욕감을 주는 내용.</li>
                            <li class="list_answer">- 생명을 경시여기거나 비하하는 내용</li>
                            <li class="list_answer">- 계층/지역/종교/성별 등을 혐오하거나 비하하는 표현</li>
                        </ul>
                    </li>
                </ul>
                <div class="h3 col-12 text-center">
                    <button type="submit" class="btn btn-success">신고하기</button>
                </div>
            </div>
        </div>
    </form>
</section>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>


</body>
</html>