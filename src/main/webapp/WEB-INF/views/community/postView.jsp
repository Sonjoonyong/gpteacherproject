<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<html>
<head>
    <title>커뮤니티</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/postView.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
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
                        <td colspan="2">${communityPostViewDto.communityPostTitle}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>작성자: ${communityPostViewDto.userNickname}</td>
                        <td style="text-align: right">
                            <fmt:formatDate value="${communityPostViewDto.communityPostWritedate}" pattern="yyyy-MM-dd" />&nbsp;
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" style="min-height: 200px;height: 200px; text-align: left; ">${communityPostViewDto.communityPostContent}</td>
                    </tr>
                    </tbody>
                </table>
                <form action="/community/?/delete/${communityPostViewdto.communityPostId}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <a href="/community/list" class="btn btn-primary">목록</a>
                    <a href="/community/?/edit/${communityPostViewdto.communityPostId}" class="btn btn-primary">수정</a>
                    <button type="submit" class="btn btn-primary">삭제</button>
                </form>

            </div>
            <div class="col-md-3" >
            </div>
            <!--댓글-->
            <div class="col-md-7" >
                <div class="row">
                    <form method="POST" id="replyForm" action="/community/${communityPostViewdto.communityPostId}/reply">
                        <input type="hidden" name="communityPostId" value="${communityPostViewdto.communityPostId}" >  <!-- 원글 글번호 -->
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

<script>
    console.log("1단계");
    $(function(){
        //댓글리스트
        function replyList(){
            $.ajax({
                url : "/community/communityReplyList"
                , data : {
                    communityPostId : ${communityPostViewdto.communityPostId}
                }
                , type : "GET"
                , success: function(result){
                    console.log("communityId");
                    let tag = "";
                    $(result).each(function(i, rDto){
                        let date = new Date(rDto.communityReplyWriteDate);
                        let newDate = date.toISOString().split('T')[0];
                        console.log(i, rDto);
                        //댓글리스트폼
                        tag += "<li>";
                        tag += "<div>";
                        tag += "<b>"+ rDto.userNickname +" ("+ newDate +")</b>"; //userId, 작성일
                        tag += "<input type='button' name='delete' class='btn btn-secondary' style='margin-right: 5px;' value='삭제' title='"+ rdto.communityPostId +"'>";
                        tag += "<input type='button' name='edit' class='btn btn-secondary' style='margin-right: 5px;' value='수정'>";
                        tag += "<p>"+ rDto.communityReplyContent +"</p></div>";  // 댓글 내용
                        //댓글수정폼
                        tag += "<div class='row' style='display:none'>" ;
                        tag += "<form method='post'>";
                        tag += "<input type='hidden' name='id' value='"+ rdto.communityPostId +"'>";  // 댓글 번호
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
            let query = $(this).serialize();
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
            let params = $(this).parent().serialize();
            console.log("params: "+ params);
            let url = "/replyEdit";
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
                let params = "id="+ $(this).attr("title");
                console.log(params);
                let url = "/replyDelete";
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


<!--이쁜이모티콘-->
<script defer src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

<!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
<script defer src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>