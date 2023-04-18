<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객센터</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <style>
        #noticeboard{
            border: 1px solid lightgray;
            padding:20px;
        }
        #noticeboard .table thead trboardname{
            margin-left: 20px;
        }
        #noticeboard .table thead th,
        #noticeboard .table thead tr,
        #noticeboard .table tbody th,
        #noticeboard .table tbody tr{
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;

        }
        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }
        #searchbar fa-solid,
        #searchbar searchbox{

        }
    </style>
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">
    <div class="col-12">
        <div class="row">
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

                    <div class="col-md-7" style="background-color: white ;margin-top: 100px; ">
                        <div class="noticeboard" id="noticeboard">
                            <table class="table table-striped" style="text-align: center; border:1px solid black;">
                                <thead>
                                <tr>
                                    <span class="boardname"><h3>공지사항</h3></span>
                                    <th style="background-color: white; text-align: center; width: 520px;">제목</th>
                                    <th style="background-color: white; text-align: center;">작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>조심하세요.</td>
                                    <td>2023.04.19</td>
                                </tr>
                                <tr>
                                    <td>조심하세요.</td>
                                    <td>2023.04.19</td>
                                </tr>
                                <tr>
                                    <td>조심하세요.</td>
                                    <td>2023.04.19</td>
                                </tr>
                                <tr>
                                    <td>조심하세요.</td>
                                    <td>2023.04.19</td>
                                </tr>
                                <tr>
                                    <td>조심하세요.</td>
                                    <td>2023.04.19</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="col-md-7" style="background-color: white ;margin-top: 15px; ">
                                <!--페이지번호입력 TODO-->
                            </div>
                            <div class="col-md-7" id="searchbar" style="background-color: white ;margin-top: 15px; display:inline-block; margin: 0px auto; ">
                                <i class="fa-solid fa-magnifying-glass"></i>  <input type="text" class="searchbox"/>
                            </div><!--검색창 위치변경 TODO-->
                        </div>

                        <div class="col-md-7" style="background-color: white ;margin-top: 100px;"><!--글등록버튼 TODO-->
                            <input type="submit" class="btn btn-primary pull-right" value="글등록" style="align-content: end"/>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
