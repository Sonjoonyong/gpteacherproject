<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <input type="hidden" name="" value="">
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
                                <button class="accordion-button " type="button"
                                        onclick="location.href='/community/postList'">
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
                <table class="table" style="text-align:start; border:1px solid black;">
                    <thead style="margin-bottom: 20px;">
                    <tr class="text-start">
                        <td colspan="2">
                            [${communityPostViewDto.communityPostCategory}] ${communityPostViewDto.communityPostTitle}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>작성자: <span id="writerNickname">${communityPostViewDto.userNickname}</span></td>
                        <td style="text-align: right">
                            <fmt:formatDate value="${communityPostViewDto.communityPostWritedate}"
                                            pattern="yyyy-MM-dd"/>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td id="communityPostContent" colspan="2"
                            style="min-height: 200px;height: 200px; text-align: left; ">${communityPostViewDto.communityPostContent}</td>
                    </tr>
                    </tbody>
                </table>
                <c:if test="${communityPostViewDto.userId.equals(loginUser.id)}">
                    <form action="/community/${communityPostViewDto.communityPostId}/delete" method="post"
                          onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </form>
                    <a href="/community/${communityPostViewDto.communityPostId}/edit"
                       class="btn btn-primary mx-1">수정</a>
                </c:if>
                <a href="/community/list" class="btn btn-primary">목록</a>
                <%--신고하기--%>
                <button id="reportPost" class="btn btn-primary me-1">신고하기</button>

            </div>

            <div class="col-md-3">
            </div>


            <!--댓글-->
            <div class="col-md-7">
                <%--댓글 등록--%>
                <div class="row">
                    <form method="POST" id="replyForm" class="row g-0 p-2 gap-2">
                        <textarea class="col-10 rounded-3" rows="3" name="communityReplyContent"
                                  id="communityReplyContent"></textarea>
                        <button class='btn btn-primary col' type="submit">댓글등록</button>
                    </form>
                </div>

                <%--댓글 목록--%>
                <div class="row">
                    <ul id="communityReplyList" class="list-group list-group-flush">
                    </ul>
                </div>

            </div>

        </div>
    </div>
</section>


<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/reportModal.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--이쁜이모티콘-->
<script defer src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
<!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
<script defer src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script defer>
    //댓글리스트
    $(function () {
        function replyList() {
            $.ajax({
                url: "/community/reply/list"
                , data: {
                    communityPostId: ${communityPostViewDto.communityPostId}
                }
                , type: "GET"
                , success: function (result) {
                    // console.log(result);
                    let tag = "";
                    $(result).each(function (i, rDto) {
                        let date = new Date(rDto.communityReplyWritedate);
                        let newDate = date.toISOString().split('T')[0];
                        console.log(i, rDto);
                        //댓글리스트폼
                        tag += "<li class='list-group-item'>";
                        tag += "<div>";

                        tag += "<b>" + rDto.userNickname + " (" + newDate + ")</b>"; //userId, 작성일

                        if (rDto.isAdmin || rDto.isWriter) {
                            tag += "<input type='button' name='delete' class='btn btn-secondary' style='margin-right: 5px;' value='삭제' title='" + rDto.communityReplyId + "'>";
                        }
                        if (rDto.isWriter) {
                            tag += "<input type='button' name='edit' class='btn btn-secondary' style='margin-right: 5px;' value='수정'>";
                        }
                        tag += "<input type='button' name='report' class='btn btn-secondary' style='margin-right: 5px;' value='신고'>";

                        tag += "<p>" + rDto.communityReplyContent + "</p></div>";  // 댓글 내용
                        //댓글수정폼
                        tag += "<div class='row' style='display:none'>";
                        tag += "    <form method='post' class='row g-0 gap-2'>";
                        tag += "        <input type='hidden' name='communityReplyId' value='" + rDto.communityReplyId + "'>";  // 댓글 번호
                        tag += "        <textarea class='col-10' name='communityReplyContent' rows='3' required>" + rDto.communityReplyContent + "</textarea>";  // 댓글 내용
                        tag += "        <input type='submit' class='col btn btn-secondary' name='replyEdit' value='수정완료' >"; //댓글 수정 버튼
                        tag += "    </form>";
                        tag += "</div>";

                        tag += "</div>";
                        tag += "</li>";
                    });
                    // .html : 원래 있던 내용 지우고 표시
                    $("#communityReplyList").html(tag);

                }, error: function (e) {
                    console.log(e.responseText);
                }
            });
        }

        // 댓글 추가
        $('#replyForm').submit(function () {
            //댓글 입력했는지 확인
            if ($("#communityReplyContent").val() == "") {
                alert("댓글 입력후 등록하세요.");
                return false;
            }
            let query = $(this).serialize();

            $.ajax({
                url: "/community/${communityPostViewDto.communityPostId}/reply"
                , data: query
                , type: "POST"
                , success: function (result) {
                    $("#communityReplyContent").val("");
                    console.log(result);
                    replyList();
                }, error: function (e) {
                    console.log(e.responseText);
                }
            });
            return false; // submit 후 페이지 이동 막기
        });

        // 댓글 수정 폼
        $(document).on('click', '#communityReplyList input[name=edit]', function () {
            // 댓글 숨기기
            $(this).parent().css("display", "none");
            // 폼 보이기
            $(this).parent().next().css("display", "block");
        });


        // 댓글 수정
        $(document).on('click', '#communityReplyList input[name=replyEdit]', function () {
            let params = $(this).parent().serialize();
            console.log("params: " + params);
            let url = "/community/reply/edit";

            $.ajax({
                url: url
                , data: params
                , type: "POST"
                , success: function (result) {
                    // 댓글 목록을 다시 뿌려주기
                    console.log(result);
                    replyList();
                }, error: function (e) {
                    console.log(e.responseText);
                }
            });
            return false;
        });

        // 댓글 삭제
        $(document).on('click', '#communityReplyList input[name=delete]', function () {
            if (confirm("댓글을 삭제할까요?")) {
                let communityReplyId = $(this).attr("title");
                let url = '/community/reply/' + communityReplyId + '/delete';
                $.ajax({
                    url: url,
                    method: 'POST',
                    success: function (result) {
                        console.log(result);
                        // 댓글 목록을 다시 뿌려주기
                        replyList();
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }
                });
            }
        });

        replyList();
    });

    // 신고 모달 설정
    const body = document.querySelector('body');
    const reportModal = document.querySelector('#reportModal');
    const reportModalBody = document.querySelector('#reportModalBody');
    const reportCancelBtn = document.querySelector('#reportCancel');
    const reportSubjectIdInput = document.querySelector('#reportSubjectId');
    const reportSubjectTypeInput = document.querySelector('#reportSubjectType');

    // 게시글 신고 모달창 띄우기
    let reportPostBtn = document.querySelector('#reportPost');
    reportPostBtn.onclick = () => {
        toggleReportModal(true);

        // 신고 내용 옮기기
        const content = document.querySelector('#communityPostContent').innerText;
        document.querySelector('#reportTargetContent').innerText = content.substring(0, Math.min(20, content.length));;

        // 신고 대상 닉네임 옮기기
        const writerNickname = document.querySelector('#writerNickname').innerText;
        document.querySelector('#reportTargetWriter').innerText = writerNickname;


        reportSubjectTypeInput.value = 'COMMUNITY_POST';
    }

    // 신고 모달창 닫기
    reportCancelBtn.onclick = () => {
        toggleReportModal(false);
    }

    function toggleReportModal(boolean) {
        reportModal.classList.toggle("show", boolean);
        reportModalBody.scrollTop = 0;
        // 모달에 따른 body 스크롤 설정
        boolean && (body.style.overflow = 'hidden');
        boolean || (body.style.overflow = 'scroll');
    }


</script>


</body>
</html>