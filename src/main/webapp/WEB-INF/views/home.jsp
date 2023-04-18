<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
    <title>GPTeacher</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="fragments/bootstrapCss.jsp" %>
    <style>
        .int-text{
            display: grid;
            align-self: center;
            margin-top: 100px;
        }
        .int-text2{
            margin: 100px 0px 0px 130px;
        }
    </style>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<section class="container-fluid">


    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                    <img src="/images/banner_main.jpg" class="d-block w-100" alt="banner_main" height="300px">
            </div>
            <div class="carousel-item">
                <a href="/learning/writing">
                    <img src="/images/banner_writing.jpg" class="d-block w-100" alt="banner_writing" height="300px">
                </a>
            </div>
            <div class="carousel-item">
                <a href="/learning/speaking">
                    <img src="/images/banner_speaking.jpg" class="d-block w-100" alt="banner_speaking" height="300px">
                </a>
            </div>
            <div class="carousel-item">
                <a href="/learning/dialogue">
                    <img src="/images/banner_dialogue.jpg" class="d-block w-100" alt="banner_dialogue" height="300px">
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="introduce1">
        <div class="row">
            <div class="col-md-12" style="margin-bottom: 30px; margin-top: 30px; margin-left: 110px;" >
                <h2>GPTeacher, 이렇게 함께해요.</h2>
            </div>
        </div>
    </div>
    <div class="introduce2" >
        <div class="row" >
            <div class="col-md-12 solution" >
                <div class="row">
                    <div class="col-md-6 ">
                        <img src="/images/dialogueTopic.jpg" class="image" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 105px;">
                    </div>
                    <div class="col-md-6 order-lg-2"  >
                        <div style="display: grid" class="int-text" >
                            <h4>회화연습, 말하기연습, 글쓰기연습</h4>
                            <h6>GPTeacher와 대화해보세요.</h6>
                            <h6>매 문장마다 즉시 교정받을 수 있습니다.</h6>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 order-lg-2">
                        <img src="/images/dialogueTopic.jpg" class="image2" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 10px;">
                    </div>
                    <div class="col-md-6" >
                        <div style="display: grid" class="int-text2">
                            <h4>회화연습, 말하기연습, 글쓰기연습</h4>
                            <h6>GPTeacher와 대화해보세요.</h6>
                            <h6>매 문장마다 즉시 교정받을 수 있습니다.</h6>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <img src="/images/dialogueTopic.jpg" class="image" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 105px;">
                    </div>
                    <div class="col-md-6" >
                        <div style="display: grid" class="int-text">
                            <h4>회화연습, 말하기연습, 글쓰기연습</h4>
                            <h6>GPTeacher와 대화해보세요.</h6>
                            <h6>매 문장마다 즉시 교정받을 수 있습니다.</h6>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 order-lg-2">
                        <img src="/images/dialogueTopic.jpg" class="image2" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 10px;">
                    </div>
                    <div class="col-md-6" >
                        <div style="display: grid" class="int-text2">
                            <h4>회화연습, 말하기연습, 글쓰기연습</h4>
                            <h6>GPTeacher와 대화해보세요.</h6>
                            <h6>매 문장마다 즉시 교정받을 수 있습니다.</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</section>

<%@ include file="fragments/footer.jsp" %>

<%@ include file="fragments/bootstrapJs.jsp" %>

</body>
</html>
