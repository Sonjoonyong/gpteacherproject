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
        #testapply{
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

        .start-button {
            position: absolute;
            background-color: #5DB99D;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 1rem;
            color: #716FAA;
            cursor: pointer;
            left: 50%;
            bottom: 160px;
            transform: translateX(-50%);
        }

        .start-button:hover {
            background-color: #716FAA;
            color: #5DB99D;
            transition: all 0.2s ease-in-out;
        }

    </style>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<section class="container">

    <div class="row" style="min-width: 1297px;">
        <div class="col-md-12 col-lg2"></div>
        <div class="col-md-12 col-lg8">
            <div class="row g-0">
                <div id="carouselExampleControls" class="col-12 carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <a href="/">
                                <img src="/images/banner_mainimg.jpg" class="d-block fixed-banner" alt="banner_main">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="/learning/writing">
                                <img src="/images/banner_writingimg.jpg" class="d-block fixed-banner" alt="banner_writing">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="/learning/speaking">
                                <img src="/images/banner_speakingimg.jpg" class="d-block fixed-banner" alt="banner_speaking">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="/learning/dialogue">
                                <img src="/images/banner_dialogueimg.jpg" class="d-block fixed-banner" alt="banner_dialogue">
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
            </div>

            <div class="row g-0">
                <div class="col-12" style="margin-bottom: 30px; margin-top: 30px; padding-left: 120px;" >
                    <h2>GPTeacher, 이렇게 함께해요.</h2>
                </div>
            </div>

            <div class="row g-0 justify-content-center" >
                <div class="col-6">
                    <div style="padding-left: 140px;">
                        <img src="/images/speakingScreen2.png" class="img" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px;margin-top: 10px; margin-bottom: 10px;">
                    </div>
                </div>
                <div class="col-6">
                    <div  class="int-text" style="padding-left: 70px;">
                        <h4>GPTeacher</h4>
                        <h6>저희 사이트는 ChatGPT를 활용한 영어 교육을 지원합니다.</h6>
                        <h6>글쓰기 연습, 말하기 연습, 회화 연습을 선택해서 시작해보세요.</h6>
                        <h6 style="color: #3998F0">#ChatGPT #영어 교육</h6>
                    </div>
                </div>
            </div>

            <div class="row g-0 custom-link" style="background-color: #CFEAE2;border-radius: 20px;">
                <div class="col-6"   >
                    <div style="padding-left: 140px;" class="int-text" >
                        <h4>문장별 분석 기능, 음성 인식 기능</h4>
                        <h6>음성 인식 기능 또는 직접 입력을 통해 ChatGPT와 대화해보세요.</h6>
                        <h6>문장별로 교정된 내용을 확인실 수 있습니다.</h6>
                        <h6 style="color: #3998F0">#음성 인식 #문장별 분석</h6>
                    </div>
                </div>
                <div class="col-6">
                    <div style="padding-left: 60px;">
                        <img src="/images/dialogueScreen2.png" class="image2" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px;margin-top: 10px; margin-bottom: 10px;">
                    </div>
                </div>
            </div>

            <div class="row g-0" >
                <div class="col-6">
                    <div style="padding-left: 140px;">
                        <img src="/images/mypageScreen2.png" class="image" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px; margin-top: 10px; margin-bottom: 10px">
                    </div>
                </div>
                <div class="col-6 "  >
                    <div style="padding-left: 70px;" class="int-text" >
                        <h4>마이페이지</h4>
                        <h6>학습 이력, 나의 문장, 플래시 카드를 활용해보세요.</h6>
                        <h6>부족한 점을 좋아요 버튼과 저장 버튼을 활용해 효율적인 학습을 할 수 있습니다.</h6>
                        <h6 style="color: #3998F0">#잔디 심기 #학습 관리</h6>
                    </div>
                </div>
            </div>
            <div class="row g-0 custom-link" style="background-color: #CFEAE2;border-radius: 20px;">
                <div class="col-6 "  >
                    <div style="padding-left: 140px;" class="int-text" >
                        <h4>커뮤니티</h4>
                        <h6>커뮤니티를 이용해 여러 사람과 정보를 공유해보세요.</h6>
                        <h6>어려웠던 부분을 해결할 수 있습니다.</h6>
                        <h6 style="color: #3998F0">#정보 공유 #문제 해결</h6>
                    </div>
                </div>
                <div class="col-6">
                    <div style="padding-left: 60px;">
                        <img src="/images/communityScreen2.png" class="image2" height="350px" width="450px" style="border: 1px solid dimgray; border-radius: 10px;margin-top: 10px; margin-bottom: 10px;">
                    </div>
                </div>
            </div>

            <div class="row g-0" >
                <div class="col-12 custom-link" id="testapply">
                    <div class="col-12" style="margin-top: 15px; text-align: center;">
                        <h3 style="color: #2A6976">시험 접수하러 가기</h3>
                    </div>
                    <div class="col-12" >
                        <ul class="nav justify-content-center gap-5">
                            <li class="nav-item">
                                <a class="nav-link" href="https://exam.toeic.co.kr/receipt/receiptStep1.php" target="_blank">TOEIC</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="https://www.kr.ets.org/toefl.html" target="_blank">TOEFL</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="https://m.opic.or.kr/opics/jsp/senior/indexMobile.jsp" target="_blank">OPIc</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="https://reg.britishcouncil.kr/en/main/index" target="_blank">IELTS</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-12" style="text-align:center; margin-top:10px;">
                    <h2>오늘 시험후기, 커뮤니티에서 확인해보세요.</h2>
                </div>
                <div class="col-12">
                    <img class="reviewimg" src="/images/review.png" style="width: 800px; height: 230px;">
                </div>
                <div class="col-12" style="text-align:center; margin-top:50px; ">
                    <h2>회원들의 생생한 후기도 확인해 보아요.</h2>
                </div>
                <div class="col-12" style="margin-bottom: 100px">
                    <img class="reviewimg" src="/images/review3.png" style="width: 800px; height: 230px;">
                </div>
            </div>

            <div class="row g-0">
                <div class="col-12 text-center">
                        <button id="dark-mode-toggle" class="start-button">다크 모드</button>
                </div>
            </div>
        </div>

    </div>
</section>

<%@ include file="fragments/footer.jsp" %>

<script>
    function setDarkMode(enabled) {
        const header = document.getElementById("header");
        const lightModeBgElements = document.querySelectorAll(".light-mode-bg");
        const customLinks = document.querySelectorAll(".custom-link");
        const darkModeCSS = document.getElementById("dark-mode-css");

        if (enabled) {
            if (!darkModeCSS) {
                const link = document.createElement("link");
                link.href = "/css/dark-mode.css";
                link.rel = "stylesheet";
                link.id = "dark-mode-css";
                document.head.appendChild(link);
            }
            document.body.classList.add("dark-mode");
            header.classList.add("dark-mode");
            lightModeBgElements.forEach(el => el.classList.add("dark-mode-bg"));
            customLinks.forEach(link => {
                link.style.backgroundColor = "#444444";
            });
            localStorage.setItem("dark-mode", "enabled");
        } else {
            if (darkModeCSS) {
                document.head.removeChild(darkModeCSS);
            }
            document.body.classList.remove("dark-mode");
            header.classList.remove("dark-mode");
            lightModeBgElements.forEach(el => el.classList.remove("dark-mode-bg"));
            customLinks.forEach(link => {
                link.style.backgroundColor = "#CFEAE2";
            });
            localStorage.removeItem("dark-mode");
        }
    }

    document.getElementById("dark-mode-toggle").addEventListener("click", function () {
        setDarkMode(!document.body.classList.contains("dark-mode"));
    });

    if (localStorage.getItem("dark-mode") === "enabled") {
        setDarkMode(true);
    } else {
        setDarkMode(false);
    }

</script>

<%@ include file="fragments/bootstrapJs.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    const msg = '${message}';
    if (msg !== '') {
        Swal.fire(msg);
    }
</script>

</body>
</html>
