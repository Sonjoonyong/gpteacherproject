<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문의사항</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <!-- Bootstrap icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <!--추가-->
    <style>
        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }
        .container
        .btn.list{
            width: 80px;
            height: 35px;
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;


        }
        .col-md-7 table tbody tr,
        .col-md-7 table tbody tr td {
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
        }

        .col-md-7{
            border: 1px solid lightgray;
            border-radius: 20px;
            padding:20px;
        }
        .col-md-7 table thead tr{
            background-color: CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }
    </style>


</head>
<body>


<section class="container">
    <div class="col-12">
        <div class="row">
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 50px;margin-left: -68px;"><h3>고객센터</h3></div>
                <div class="row">
                    <div id="sidebar1" class="nav" style="margin-top: 20px;margin-left: 30px;">
                        <ul>
                            <li class="nav-item" style="list-style: none">
                                <a class="nav-link " href="#"><i class="fa-solid fa-chevron-right"></i> 공지사항</a>
                            </li>
                            <li class="nav-item" style="list-style: none">
                                <a class="nav-link " href="#"><i class="fa-solid fa-chevron-right"></i> 자주묻는 질문</a>
                            </li>
                            <li class="nav-item" style="list-style: none">
                                <a class="nav-link " href="#"><i class="fa-solid fa-chevron-right"></i> 문의사항</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7" style="background-color: white ;margin-top: 55px; ">
                <table class="table table-striped" style="text-align:center; border:1px solid black;" >
                    <thead>
                    <h3>문의사항</h3>
                    <div><input type="submit" href="noticeList.html" class="btn list flot-end" style="display: float;" value="문의하기"></div><!--"문의하기"버튼 TODO-->
                    <tr>
                        <th style="width: 50px;">번호</th>
                        <th >제목</th>
                        <th style="width: 100px;">작성일</th>
                        <th style="width: 100px;">상태</th>
                    </tr>
                    </thead>
                    <tbody >
                    <tr>
                        <td>1<!--번호$--></td>
                        <td>제발 됐으면 좋겠다! <!--제목(제목입력시 결제or학습과 같은 카테고리 출력도 필요$--></td>
                        <td>2022.02.02<!--작성일$--></td>
                        <td>답변완료<!--상태$--></td>
                    </tr>
                    </tbody>
                </table>
                <a><!--삭제버튼(관리자용)--></a>

            </div>

        </div>
    </div>
</section>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
