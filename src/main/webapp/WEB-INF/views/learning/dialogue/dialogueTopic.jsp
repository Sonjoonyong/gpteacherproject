<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Dialogue Topic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Bootstrap icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

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

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>