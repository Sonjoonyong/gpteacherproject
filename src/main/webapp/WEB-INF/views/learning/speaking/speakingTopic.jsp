<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Speaking</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

    <style>
        .test {
            width: 350px;
            height: 100%;
        }

        .test img {
            height: 140px;
        }

        form img {
            width: 350px;
            height: 280px;
        }
    </style>
</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <h3 class="h3 text-center my-3" style="color: #5DB99D;">SPEAKING</h3>
    <p class="text-center">말하기 연습을 하고싶은 시험을 선택해주세요.</p>

    <form action="/learning/speaking" method="post" class="row d-flex">


        <div class="row g-0 justify-content-center my-2">
            <button type="submit" name="learningTestType" value="TOEIC" class="card shadow test col-6 me-2" style="width: 18rem;">
                <img src="/images/TOEIC.jpg" class="card-img-top" alt="TOEIC">
                <div class="card-body">
                    <h5 class="card-title">주관사: 미국 ETS</h5>
                    <p class="card-text">토익은 영어가 모국어가 아닌 사람을 대상으로 일상 생활 및 비즈니스 현장에서 요구되는 실용적인 영어 구사 능력을 갖추었는지 평가하는
                        시험입니다.</p>
                </div>
            </button>
            <button type="submit" name="learningTestType" value="TOEFL" class="card shadow test col-6" style="width: 18rem;">
                <img src="/images/TOEFL.jpg" class="card-img-top" alt="TOEFL">
                <div class="card-body">
                    <h5 class="card-title">주관사: 미국 ETS</h5>
                    <p class="card-text">토플은 영어를 모국어로 하지 않는 사람들을 대상으로 영어권의 교육기관에서 수학할 수 있는지를 평가하는 시험입니다.</p>
                </div>
            </button>
        </div>
        <div class="row g-0 justify-content-center my-2">
            <button type="submit" name="learningTestType" value="OPIC" class="card shadow test col-6 me-2" style="width: 18rem;">
                <img src="/images/OPIC.jpg" class="card-img-top" alt="OPIC">
                <div class="card-body">
                    <h5 class="card-title">주관사: 미국 ACTFL</h5>
                    <p class="card-text">미국 외국어교육위원회에서 개발한 다국어 언어 말하기 시험으로, 최근 많은 기업들에서 OPIc 점수를 요구하고 있습니다.</p>
                </div>
            </button>
            <button type="submit" name="learningTestType" value="IELTS" class="card shadow test col-6" style="width: 18rem;">
                <img src="/images/IELTS.jpg" class="card-img-top" alt="IELTS">
                <div class="card-body">
                    <h5 class="card-title">주관사: 호주 IDP</h5>
                    <p class="card-text">주로 영국식 영어가 비모국어인 사람의 영어 사용 능력을 평가하는 국제공인시험으로, 영연방 국가로 유학이나 이민 시
                    거의 필수적으로 요구되는 시험입니다.</p>
                </div>
            </button>
        </div>

    </form>

    <div class="text-center" style="margin-top: 80px; margin-bottom: 40px">
        <img src="/images/step_first.png" alt="Step First" style="max-width: 100%;">
    </div>

</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
