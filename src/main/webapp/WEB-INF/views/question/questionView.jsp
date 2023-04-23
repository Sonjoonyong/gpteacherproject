<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<html>
<head>
    <title>고객센터</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>

        .col-md-7{
            border: 1px solid lightgray;
            border-radius: 10px;
            padding:20px;
            width: 800px;


        }

        #noticeboard .table thead trboardname{
            margin-left: 20px;
        }

        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }
        #searchbar fa-solid,
        #searchbar searchbox{

        }

        .btn.btn-primary{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
            float: right;
        }

        .col-md-7 table thead tr,
        .col-md-7 table thead tr td{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }

        .col-md-7 table tbody tr,
        .col-md-7 table tbody tr td {
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            background-color: white;

        }
        /* noticeContent부분 */
        .col-md-7 table tbody tr td{
            background-color: white;

        }
        .accordion .accordion-item .accordion-header .accordion-button{
            background-color: white;
            color: black;
        }
        .accordion .accordion-item .accordion-header .accordion-button:hover{
            background-color: #CFEAE2;
            color: black;
        }
        .accordion .accordion-item .accordion-header .accordion-button:focus{
            background-color: #CFEAE2;
            color: black;
        }
        .accordion .accordion-item .accordion-header .accordion-button:active{
            background-color: #CFEAE2;
            color: white;
        }
        #questionReplyContent{
            width: 30%;
            height: 40px;
            margin-top: 20px;
            border: 1px solid black;
        }
        #replyList>li{
            width: 50%;
            height: 60px;
            padding:10px 0;
            border-bottom: 1px solid black;
        }

    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">

    <form role="form" method="post">
        <input type="hidden" name="" value="" >

    </form>

    <div class="col-12">
        <div class="row">
            <!--사이드바-->
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>고객센터</h3></div>
                <div class="row" style="margin-top: 15px;">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/notice/list'" >
                                    공지사항
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/faq/list'">
                                    자주묻는 질문
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/question/list'" style="background-color: #CFEAE2">
                                    문의사항
                                </button>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7" style="margin-top: 110px; ">
                <table class="table" style="text-align:start; border:1px solid black;" >
                    <thead style="margin-bottom: 20px;">
                    <tr>
                        <td colspan="2">${question.questionTitle}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr >

                        <td colspan="2" style="min-height: 200px;height: 200px; text-align: left; ">${question.questionContent}</td>
                    </tr>
                    </tbody>
                </table>
                <form action="${pageContext.request.contextPath}/help/question/delete/${question.id}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <a href="${pageContext.request.contextPath}/help/question/list" class="btn btn-primary">목록</a>
                    <a href="${pageContext.request.contextPath}/help/question/edit/${question.id}" class="btn btn-primary">수정</a>
                    <button type="submit" class="btn btn-primary">삭제</button>
                </form>

            </div>
            <!--댓글-->
            <div class="col-md-7">
                <div class="row">
                    <form method="POST" id="replyForm">
                        <input type="hidden" name="questionId" value="${question.id}" >  <!-- 원글 글번호 -->
                        <textarea name="questionReplyContent" id="questionReplyContent"></textarea>
                        <button type="submit">댓글등록</button>
                    </form>
                </div>
                <div class="row">
                    <ul id="replyList" >
                        <li>
                            yd1064 (2022-02-02 12:12:12) 수정, 삭제
                            <p> 코멘트<br>
                            </p>
                        </li>
                        <li>
                            yd1064 (2022-02-02 12:12:12) 수정, 삭제
                            <p> 코멘트<br>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>

<!--댓글-->
<script>
    console.log("1단계");
    $(function(){
        $("#replyForm").submit(function(){
            console.log("2단계");
            if ($("#questionReplyContent").val() == "") {
                alert("댓글 입력후 등록하세요.");
                return false;
            }
            var query = $(this).serialize();
            console.log("query:"+ query);

            $.ajax({
                url : "/replySend"
                , data : query
                , type : "POST"
                , success : function(result) {
                    $("#questionReplyContent").val("");
                    console.log(result);

                }, error : function(e) {
                    console.log(e.responseText);
                }
            });
            // 원래대로라면, form 의 submit 처리가 끝나면 action 값에 따라 페이지 이동하게 된다.
            // 페이지가 이동하면 boardView.jsp 를 처음부터 다시 읽어오는 것이 되므로
            // 화면변화를 주지 않기 위해 false 를 리턴한다.
            return false;
        });
    });
</script>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
