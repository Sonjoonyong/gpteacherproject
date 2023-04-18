<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Dialogue Topic</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>
    <%@ include file="../../fragments/header.jsp" %>

    <style>
        .container {
            max-width: 768px;
        }

        .label {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
            color: #3b9d7f;
        }

        .example {
            font-weight: lighter;
        }
    </style>
</head>

<body>
<section class="container">


    <h3 class="h3 text-center my-3" style="color: #5DB99D;">CONVERSATION</h3>

    <p class="text-center">원하는 대화와 상황을 영어로 입력해 주세요.</p>

    <form method="post" action="/learning/dialogue" class="col-12 mt-5">
        <div class="row">
            <div class="col-12 col-md-2 label">Place</div>
            <input type="text" name="place" placeholder="대화 장소를 입력해 주세요." class="col-12 col-md-10 py-2 rounded-3 border" />
        </div>
        <div class="row">
            <div class="col-12 col-md-2"></div><!--dummy-->
            <div class="col-12 col-md-10 text-secondary example">ex) restaurant</div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-md-2 label">Your role</div>
            <input type="text" name="userRole" placeholder="당신의 역할을 입력해주세요." class="col-12 col-md-10 py-2 rounded-3 border" />
        </div>
        <div class="row">
            <div class="col-12 col-md-2"></div><!--dummy-->
            <div class="col-12 col-md-10 text-secondary example">ex) customer</div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-md-2 label">GPT's role</div>
            <input type="text" name="assistantRole" placeholder="대화 상대방의 역할을 입력해주세요." class="col-12 col-md-10 py-2 rounded-3 border" />
        </div>
        <div class="row">
            <div class="col-12 col-md-2"></div><!--dummy-->
            <div class="col-12 col-md-10 text-secondary example">ex) waiter</div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-md-2 label">Situation</div>
            <input type="text" name="situation" placeholder="대화 상황을 입력해주세요." class="col-12 col-md-10 py-2 rounded-3 border" />
        </div>
        <div class="row">
            <div class="col-12 col-md-2"></div><!--dummy-->
            <div class="col-12 col-md-10 text-secondary example">ex) ordering food</div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-md-2 label">Option</div>
            <input type="text" name="option" placeholder="추가적인 상황에 대해 설명해주세요(옵션)." class="col-12 col-md-10 py-2 rounded-3 border" />
        </div>
        <div class="row">
            <div class="col-12 col-md-2"></div><!--dummy-->
            <div class="col-12 col-md-10 text-secondary example">ex) select degree of doneness of steak</div>
        </div>

        <div class="row justify-content-center mt-5">
            <input type="submit" value="대화 시작" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="width: 85px; background-color: #5DB99D;"/>
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