<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<html>
<head>
    <title>문의 사항 상세 페이지</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <!--이쁜이모티콘-->
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Toast UI Editor Viewer -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

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
        .btn.btn-success{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
            float: left;
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
                    url : "/help/replyList"
                    , data : {
                        questionId : ${question.id}
                    }
                    , type : "GET"
                    , success: function(result){
                        var tag = "";
                        $(result).each(function(i, rDto){
                            let date = new Date(rDto.questionReplyWriteDate);
                            let newDate = date.toISOString().split('T')[0];
                            //댓글리스트폼
                            tag += "<li>";
                                tag += "<div>";
                                tag += "<b>"+ rDto.userNickname +" ("+ newDate +")</b>"; //userId, 작성일
                                if (rDto.isAdmin || rDto.isWriter) {
                                tag += "<input type='button' name='delete' class='btn btn-secondary' style='margin-right: 5px;' value='삭제' title='" + rDto.id + "'>";
                                }
                                if (rDto.isWriter) {
                                tag += "<input type='button' name='edit' class='btn btn-secondary' style='margin-right: 5px;' value='수정'>";
                                }
                                tag += "<p>"+ rDto.questionReplyContent +"</p></div>";  // 댓글 내용
                                    //댓글수정폼
                                    tag += "<div class='row' style='display:none'>" ;
                                        tag += "<form method='post'>";
                                        tag += "<input type='hidden' name='id' value='"+ rDto.id +"'>";  // 댓글 번호
                                        tag += "<textarea name='questionReplyContent' style='width:400px;height:40px;'>"+ rDto.questionReplyContent +"</textarea>";  // 댓글 내용
                                        tag += "<input type='submit' name='replyEdit' value='댓글수정하기' >"; //댓글 수정 버튼
                                        tag += "</form>" ;
                                    tag += "</div>";
                                tag += "</div>";
                            tag += "</li>";
                        });
                        // .html : 원래 있던 내용 지우고 표시
                        $("#replyList").html(tag);
                        // 댓글의 개수를 확인하고 버튼을 활성화/비활성화합니다.
                        if (result.length > 0) {
                            $("#statusUpdateButton").prop("disabled", false);
                        } else {
                            $("#statusUpdateButton").prop("disabled", true);
                        }
                    },
                    error: function(e){
                        console.log(e.responseText);
                    }
                });
            }

            //댓글추가
            $("#replyForm").submit(function(){
                //댓글 입력했는지 확인
                if ($("#questionReplyContent").val() == "") {
                    Swal.fire({
                        icon: 'error',
                        title: '',
                        text: '댓글 입력후 등록하세요.',
                    });
                    return false;
                }
                var query = $(this).serialize();

                $.ajax({
                    url : "/replySend"
                    , data : query
                    , type : "POST"
                    , success : function(result) {
                        $("#questionReplyContent").val("");
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
                Swal.fire({
                    title: '댓글을 삭제할까요?',
                    showCancelButton: true,
                    confirmButtonText: '삭제',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        var params = "id=" + $(this).attr("title");
                        console.log(params);
                        var url = "/replyDelete";
                        $.ajax({
                            url: url
                            , data: params
                            , success: function (result) {
                                console.log(result);
                                // 댓글 목록을 다시 뿌려주기
                                replyList();

                            }, error: function (e) {
                                console.log(e.responseText);
                            }
                        });
                    }
                })
            });

            replyList();
        });
    </script>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">

    <div class="col-12">
        <div class="row">
            <!--사이드바-->
            <%@ include file="../fragments/customerServiceMenu.jsp" %>
            <!--본문-->
            <div class="col-md-7" style="margin-top: 110px; ">
                <table class="table" style="text-align:start; border:1px solid black;" >
                    <thead style="margin-bottom: 20px;">
                    <tr>
                        <td colspan="2">
                            [ ${question.questionCategory} ] ${question.questionTitle}
                        </td> <!--게시글제목-->
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>작성자: ${question.userNickname}</td> <!--게시글작성자-->
                        <td style="text-align: right">
                            <fmt:formatDate value="${question.questionWriteDate}" pattern="yyyy-MM-dd" />&nbsp; <!--게시글작성일-->
                            <c:if test="${question.questionStatus }">
                                <span class="badge text-bg-success">답변완료</span>
                            </c:if>
                            <c:if test="${not question.questionStatus }">
                                <span class="badge text-bg-secondary">답변중</span>
                            </c:if>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" style="min-height: 200px;height: 200px; text-align: left;" id="questionContentView">${question.questionContent}</td> <!--게시글내용-->
                    </tr>
                    </tbody>
                </table>

                <c:if test="${loginUser.userRole == 'ADMIN'}">
                    <form action="${pageContext.request.contextPath}/help/question/statusUpdate/${question.id}" method="POST">
                        <c:if test="${question.questionStatus == '0'}">
                        <button type="submit" id="statusUpdateButton" class="btn btn-success">답변상태변경</button>
                        </c:if>
                    </form>
                </c:if>


                <form action="${pageContext.request.contextPath}/help/question/delete/${question.id}"  method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;"> <!--게시글삭제버튼-->
                    <a href="${pageContext.request.contextPath}/help/question/list" class="btn btn-primary" style="margin-right: 5px;">목록</a>
                    <c:if test="${loginUser.userRole != 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/help/question/edit/${question.id}" class="btn btn-primary" style="margin-right: 5px;">수정</a> <!--게시글수정버튼-->
                    </c:if>
                    <button type="submit" class="btn btn-primary" style="margin-right: 5px;">삭제</button>
                </form>

            </div>
            <div class="col-md-3" >
            </div>

            <!--댓글-->
            <div class="col-md-7" >
                <c:if test="${loginUser.userRole == 'ADMIN'}">
                    <div class="row">
                        <form method="POST" id="replyForm">
                            <input type="hidden" name="questionId" value="${question.id}" >  <!-- 원글 글번호 -->
                            <textarea name="questionReplyContent" id="questionReplyContent"></textarea>
                            <button class='btn btn-primary' type="submit">댓글등록</button>
                        </form>
                    </div>
                </c:if>
                <div class="row">
                    <ul id="replyList" >

                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>


<!-- Toast UI Editor Viewer -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const noticeContent = document.getElementById('questionContentView').innerHTML;
        const viewer = new toastui.Editor({
            el: document.getElementById('questionContentView'),
            initialValue: noticeContent,
            height: 'auto',
            viewer: true
        });
    });

    $(document).ready(function() {
        $("#statusUpdateButton").prop("disabled", true);
    });

</script>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
