<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Dialogue Topic</title>


    <style>
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

    <%@ include file="../../fragments/bootstrapCss.jsp" %>
    <link rel="stylesheet" href="/css/base.css">
</head>

<body>

<%@ include file="../../fragments/header.jsp" %>

<section class="container d-flex flex-column" style="max-width: 768px;">

    <div class="row flex-grow-1 flex-column justify-content-center">
        <h3 class="h3 text-center my-3" style="color: #5DB99D;">CONVERSATION</h3>

        <p class="text-center">원하는 대화와 상황을 영어로 입력해 주세요.</p>

        <div class="col-12">
            <div class="row">
                <div id="dialogueRandomTopic" class="btn border shadow-sm">
                    <i class="bi bi-shuffle"></i>
                    랜덤 추천
                </div>
            </div>
        </div>

        <form method="post" action="/learning/dialogue" class="col-12 mt-3">
            <div class="row">
                <div class="col-12 col-md-2 label">Place</div>
                <input type="text" name="place" placeholder="대화 장소를 입력해 주세요."
                       class="col-12 col-md-10 py-2 rounded-3 border" required/>
            </div>
            <div class="row">
                <div class="col-12 col-md-2"></div><!--dummy-->
                <div class="col-12 col-md-10 text-secondary example">ex) restaurant</div>
            </div>

            <div class="row mt-3">
                <div class="col-12 col-md-2 label">Your role</div>
                <input type="text" name="userRole" placeholder="당신의 역할을 입력해주세요."
                       class="col-12 col-md-10 py-2 rounded-3 border" required/>
            </div>
            <div class="row">
                <div class="col-12 col-md-2">
                    <div id="changeRole" class="btn btn-sm w-auto shadow-sm" type="button">
                        <i class="bi bi-arrow-down-up"></i>
                        역할 바꾸기
                    </div>
                </div>
                <div class="col-12 col-md-10 text-secondary example">ex) customer</div>
            </div>

            <div class="row mt-3">
                <div class="col-12 col-md-2 label">GPT's role</div>
                <input type="text" name="assistantRole" placeholder="대화 상대방의 역할을 입력해주세요."
                       class="col-12 col-md-10 py-2 rounded-3 border" required/>
            </div>
            <div class="row">
                <div class="col-12 col-md-2"></div><!--dummy-->
                <div class="col-12 col-md-10 text-secondary example">ex) waiter</div>
            </div>

            <div class="row mt-3">
                <div class="col-12 col-md-2 label">Situation</div>
                <input type="text" name="situation" placeholder="대화 상황을 입력해주세요."
                       class="col-12 col-md-10 py-2 rounded-3 border" required/>
            </div>
            <div class="row">
                <div class="col-12 col-md-2"></div><!--dummy-->
                <div class="col-12 col-md-10 text-secondary example">ex) ordering food</div>
            </div>

            <div class="row mt-3">
                <div class="col-12 col-md-2 label">Option</div>
                <input type="text" name="option" placeholder="추가적인 상황에 대해 설명해주세요(옵션)."
                       class="col-12 col-md-10 py-2 rounded-3 border"/>
            </div>
            <div class="row">
                <div class="col-12 col-md-2"></div><!--dummy-->
                <div class="col-12 col-md-10 text-secondary example">ex) select degree of doneness of steak</div>
            </div>

            <div class="row justify-content-center mt-5">
                <input type="submit" value="대화 시작" class="btn btn-success shadow my-3 border-0 py-2 rounded-3"
                       style="width: 85px; background-color: #5DB99D;"/>
            </div>
        </form>
    </div>

    <div class="row">
        <div class="text-center mb-5">
            <img src="/images/step_first.png" alt="Step First" style="max-width: 100%;">
        </div>
    </div>

</section>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

<script src="/js/randomTopic.js"></script>

<script>
    // 역할 바꾸기
    const changeRoleBtn = document.querySelector('#changeRole');
    changeRoleBtn.onclick = () => {
        const userRoleInput = document.querySelector('input[name=userRole]');
        const assistantRoleInput = document.querySelector('input[name=assistantRole]');
        const temp = userRoleInput.value;
        userRoleInput.value = assistantRoleInput.value;
        assistantRoleInput.value = temp;
    };
</script>

</body>

</html>