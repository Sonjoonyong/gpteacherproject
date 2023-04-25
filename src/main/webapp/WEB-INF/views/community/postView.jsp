<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<html>
<head>
    <title>커뮤니티</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <!--이쁜이모티콘-->
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        .btn.btn-secondary{
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
            width: 85%;
            height: 50px;
            border: 1px solid lightgray;
        }
        #replyList>li{
            width: 100%;
            height: 60px;
            padding:5px 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
            list-style: none;
        }
    </style>

    <!--댓글-->
    <script>
        console.log("1단계");
        $(function(){
            //댓글리스트
            function replyList(){
                $.ajax({
                    url : "/community/communityReplyList"
                    , data : {
                        questionId : ${question.id}
                    }
                    , type : "GET"
                    , success: function(result){
                        console.log("communityId");
                        var tag = "";
                        $(result).each(function(i, rDto){
                            let date = new Date(rDto.communityReplyWriteDate);
                            let newDate = date.toISOString().split('T')[0];
                            console.log(i, rDto);
                            //댓글리스트폼
                            tag += "<li>";
                            tag += "<div>";
                            tag += "<b>"+ rDto.userNickname +" ("+ newDate +")</b>"; //userId, 작성일
                            tag += "<input type='button' name='delete' class='btn btn-secondary' style='margin-right: 5px;' value='삭제' title='"+ rDto.id +"'>";
                            tag += "<input type='button' name='edit' class='btn btn-secondary' style='margin-right: 5px;' value='수정'>";
                            tag += "<p>"+ rDto.communityReplyContent +"</p></div>";  // 댓글 내용
                            //댓글수정폼
                            tag += "<div class='row' style='display:none'>" ;
                            tag += "<form method='post'>";
                            tag += "<input type='hidden' name='id' value='"+ rDto.id +"'>";  // 댓글 번호
                            tag += "<textarea name='communityReplyContent' style='width:400px;height:40px;'>"+ rDto.communityReplyContent +"</textarea>";  // 댓글 내용
                            tag += "<input type='submit' name='replyEdit' value='댓글수정하기' >"; //댓글 수정 버튼
                            tag += "</form>" ;
                            tag += "</div>";
                            tag += "</div>";
                            tag += "</li>";
                        });
                        // .html : 원래 있던 내용 지우고 표시
                        $("#communityReplyList").html(tag);
                    }, error: function(e){
                        console.log(e.responseText);
                    }
                });
            }
            //댓글추가
            $("#replyForm").submit(function(){
                //댓글 입력했는지 확인
                if ($("#communityReplyContent").val() == "") {
                    alert("댓글 입력후 등록하세요.");
                    return false;
                }
                var query = $(this).serialize();
                $.ajax({
                    url : "/replySend"
                    , data : query
                    , type : "POST"
                    , success : function(result) {
                        $("#communityReplyContent").val("");
                        console.log(result);
                        replyList();
                    }, error : function(e) {
                        console.log(e.responseText);
                    }
                });
                return false; // submit 후 페이지 이동 막기
            });
            // 댓글수정 폼
            $(document).on('click', '#replyList input[name=edit]', function(){
                // 댓글 숨기기
                $(this).parent().css("display", "none");
                // 폼 보이기
                $(this).parent().next().css("display", "block");
            });
            //댓글수정
            $(document).on('click', '#replyList input[name=replyEdit]', function(){
                var params = $(this).parent().serialize();
                console.log("params: "+ params);
                var url = "/replyEdit";
                $.ajax({
                    url: url
                    , data: params
                    , type: "POST"
                    , success: function(result){
                        // 댓글 목록을 다시 뿌려주기
                        console.log(result);
                        replyList();
                    }, error: function(e){
                        console.log(e.responseText);
                    }
                });
                return false;  // form 의 action 을 방지하기 위한 return. 이거 없으면 Request method 'POST' not supported 에러 발생
            });
            //댓글삭제
            $(document).on('click', '#replyList input[name=delete]', function(){
                if (confirm("댓글을 삭제할까요?")) {
                    var params = "id="+ $(this).attr("title");
                    console.log(params);
                    var url = "/replyDelete";
                    $.ajax({
                        url: url
                        , data: params
                        , success: function(result){
                            console.log(result);
                            // 댓글 목록을 다시 뿌려주기
                            replyList();
                        }, error: function(e){
                            console.log(e.responseText);
                        }
                    });
                }
            });
            replyList();
        });
    </script>

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
                <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>communityPost</h3></div>
                <div class="row" style="margin-top: 15px;">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='/community/postList'" >
                                    communityPost
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='/community/?'">
                                    Weekly top10
                                </button>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
            <!--본문-->
            <div class="col-md-7" style="margin-top: 110px; ">
                <table class="table" style="text-align:start; border:1px solid black;" >
                    <thead style="margin-bottom: 20px;">
                    <tr>
                        <td colspan="2">${communityPost.communityPostTitle}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>작성자: ${communityPost.userNickname}</td>
                        <td style="text-align: right">
                            <fmt:formatDate value="${communityPost.communityPostWritedate}" pattern="yyyy-MM-dd" />&nbsp;
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" style="min-height: 200px;height: 200px; text-align: left; ">${communityPost.communityPostContent}</td>
                    </tr>
                    </tbody>
                </table>
                <form action="/community/?/delete/${question.id}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <a href="/community/list" class="btn btn-primary">목록</a>
                    <a href="/community/?/edit/${question.id}" class="btn btn-primary">수정</a>
                    <button type="submit" class="btn btn-primary">삭제</button>
                </form>

            </div>
            <div class="col-md-3" >
            </div>
            <!--댓글-->
            <div class="col-md-7" >
                <div class="row">
                    <form method="POST" id="replyForm">
                        <input type="hidden" name="questionId" value="${communityPost.id}" >  <!-- 원글 글번호 -->
                        <textarea name="communityReplyContent" id="communityReplyContent"></textarea>
                        <button class='btn btn-primary' type="submit">댓글등록</button>
                    </form>
                </div>
                <div class="row">
                    <ul id="replyList" >


                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>



<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>