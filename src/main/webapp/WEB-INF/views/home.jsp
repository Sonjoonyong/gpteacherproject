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
        .reviewimg{
            display: block; margin: 0px auto;
        }
        .applytest{

            display: block;
            height: 100px;
            width: 750px;
            margin: 40px auto;
            border:0px solid white;
            border-radius: 30px;
            background-color: #CFEAE2;
            background-position-y: -10px;
        }
        a { color: #16967A; }
        a:visited { color: #16967A; }
        a:hover { color: #16967A; }
        a:active { color: #16967A; }

        .fixed-banner {
            height: 330px;
            object-fit: cover;
            border-radius: 50px;
        }

        .carousel-inner img {
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            text-shadow: 2px 3px 4px rgba(0, 0, 0, 0.3);
            margin: 20px;
        }

        h4 {
            color: #3b9d7f;
        }

    </style>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<section class="container">


    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/images/banner_main.jpg" class="d-block fixed-banner" alt="banner_main">
            </div>
            <div class="carousel-item">
                <a href="/learning/writing">
                    <img src="/images/banner_writing.jpg" class="d-block fixed-banner" alt="banner_writing">
                </a>
            </div>
            <div class="carousel-item">
                <a href="/learning/speaking">
                    <img src="/images/banner_speaking.jpg" class="d-block fixed-banner" alt="banner_speaking">
                </a>
            </div>
            <div class="carousel-item">
                <a href="/learning/dialogue">
                    <img src="/images/banner_dialogue.jpg" class="d-block fixed-banner" alt="banner_dialogue">
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
                <div class="row" style="margin: 10px">
                    <div class="col-md-6">
                        <img src="/images/speakingimg.png" class="image" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 105px;">
                    </div>
                    <div class="col-md-6 order-lg-2"  >
                        <div style="display: grid" class="int-text" >
                            <h4>GPTeacher</h4>
                            <h6>저희 사이트는 ChatGPT를 활용한 영어 교육을 지원합니다.</h6>
                            <h6>글쓰기 연습, 말하기 연습, 회화 연습을 선택해서 시작해보세요.</h6>
                            <h6 style="color: #3998F0">#ChatGPT #영어 교육</h6>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin: 10px">
                    <div class="col-md-6 order-lg-2">
                        <img src="/images/dialogueimg.png" class="image2" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 10px;">
                    </div>
                    <div class="col-md-6">
                        <div style="display: grid" class="int-text2">
                            <h4>문장별 분석 기능, 음석인식 기능</h4>
                            <h6>음성 인식 기능 또는 직접 입력을 통해 ChatGPT와 대화해보세요.</h6>
                            <h6>문장별로 교정된 내용을 확인실 수 있습니다.</h6>
                            <h6 style="color: #3998F0">#음성 인식 #문장별 분석</h6>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin: 10px">
                    <div class="col-md-6">
                        <img src="/images/mypage.png" class="image" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 105px;">
                    </div>
                    <div class="col-md-6" >
                        <div style="display: grid" class="int-text">
                            <h4>마이페이지</h4>
                            <h6>학습이력, 나의 문장, 플래시 카드를 활용해보세요.</h6>
                            <h6>부족한 점을 좋아요 버튼과 저장 버튼을 활용해 효율적인 학습을 할 수 있습니다.</h6>
                            <h6 style="color: #3998F0">#잔디 심기 #학습 관리</h6>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin: 10px">
                    <div class="col-md-6 order-lg-2">
                        <img src="/images/communityPost.png" class="image2" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-left: 10px;">
                    </div>
                    <div class="col-md-6" >
                        <div style="display: grid" class="int-text2">
                            <h4>커뮤니티</h4>
                            <h6>커뮤니티를 이용해 여러 사람과 정보를 공유해보세요.</h6>
                            <h6>어려웠던 부분을 해결할 수 있습니다.</h6>
                            <h6 style="color: #3998F0">#정보 공유 #문제 해결</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container ">
        <div class="row row-cols-1">
            <div class="applytest">
                <div calss="col " style="margin-top: 15px; text-align: center;">
                    <h3 style="color: #2A6976">시험 접수하러 가기</h3>
                </div>
                <div class="col " >
                    <ul class="nav justify-content-center gap-5">
                        <li class="nav-item">
                            <a class="nav-link" href="https://exam.toeic.co.kr/receipt/receiptStep1.php">TOEIC</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://www.kr.ets.org/toefl.html">TOEFL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://m.opic.or.kr/opics/jsp/senior/indexMobile.jsp">OPIc</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://reg.britishcouncil.kr/ko/main/index">IELTs</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col" style="text-align:center; margin-top:10px;">
                <h2>오늘 시험후기, 커뮤니티에서 확인해보세요.</h2>
            </div>
            <div class="col ">
                <img class="reviewimg" src="/images/review.png" style="width: 800px; height: 230px;">
            </div>
            <div class="col" style="text-align:center; margin-top:50px; ">
                <h2>회원들의 생생한 후기도 확인해 보아요.</h2>
            </div>
            <div class="col" style="margin-bottom: 50px">
                <img class="reviewimg" src="/images/review.png" style="width: 800px; height: 230px;">
            </div>
        </div>
    </div>


</section>

<%@ include file="fragments/footer.jsp" %>

<%@ include file="fragments/bootstrapJs.jsp" %>

</body>
</html>
