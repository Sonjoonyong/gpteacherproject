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

        <div class="row g-0 justify-content-center">
            <div class="test col-6">
                <button type="submit" name="learningTestType" value="TOEIC">
                    <img src="/images/TOEIC.jpg">
                </button>
            </div>
            <div class="test col-6">
                <button type="submit" name="learningTestType" value="TOEFL">
                    <img src="/images/TOEFL.jpg">
                </button>
            </div>
        </div>
        <div class="row g-0 justify-content-center">

            <br>
            <div class="test col-6">
                <button type="submit" name="learningTestType" value="OPIC">
                    <img src="/images/OPIC.jpg">
                </button>
            </div>
            <div class="test col-6">
                <button type="submit" name="learningTestType" value="IELTS">
                    <img src="/images/IELTS.jpg">
                </button>
            </div>
        </div>

    </form>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>
