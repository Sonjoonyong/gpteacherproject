<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>커뮤니티</title>

    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/postView.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>

    <!--  TOAST UI Editor Viewer CSS -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css"/>

    <style>
        .answer_area {
            font-size: 12px;
            padding-left: 0px;
        }

        .list_answer {
            list-style: none;
        }
    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">

    <div class="row">
        <%--메뉴바--%>
        <dic class="col-3"></dic>

        <%--본문--%>
        <div class="col-7 border p-4 rounded-3 mb-5">
            <div class="row g-0">
                <%--제목--%>
                <div class="hstack mb-2 gap-2">
                    <span class="badge bg-info">
                        ${communityPostViewDto.communityPostCategory}
                    </span>
                    <span class="h4 m-0">
                        ${communityPostViewDto.communityPostTitle}
                    </span>

                    <div class="ms-auto"></div>

                    <%--수정하기--%>
                    <c:if test="${communityPostViewDto.userId.equals(loginUser.id)}">
                        <a href="/community/${communityPostViewDto.communityPostId}/edit"
                           class="btn btn-sm btn-secondary text-white w-auto">수정</a>
                    </c:if>

                    <%--삭제하기--%>
                    <c:if test="${loginUser.userRole == 'ADMIN'
                    || communityPostViewDto.userId.equals(loginUser.id)}">
                        <button id="deletePost" type="button" class="btn btn-outline-danger btn-sm w-auto">삭제</button>
                    </c:if>

                </div>

                <%--게시글 정보--%>
                <div class="col-12 hstack mb-2 gap-3">
                    <span id="writerNickname">
                        ${communityPostViewDto.userNickname}
                    </span>

                    <span class="ms-auto">
                        <i class="bi bi-eye"></i>
                        ${communityPostViewDto.communityPostHit}
                    </span>

                    <div class="vr"></div>

                    <span>
                        <i class="bi bi-clock"></i>
                        <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                        value="${communityPostViewDto.communityPostWritedate}"/>
                    </span>
                </div>


                <hr>

                <%--본문--%>
                <%-- Toast Editor Viewer--%>
                <div id="communityPostContent" class="col-12">
                    <div id="viewer" style="min-height: 250px"></div>
                </div>

                <%--버튼--%>
                <div class="hstack gap-2 my-3">
                    <span class="me-3 w-auto ms-auto">
                        <i class="bi bi-heart me-2"></i>
                        ${communityPostViewDto.communityPostLike}
                    </span>
                    <a href="/community/list" class="btn btn-primary w-auto text-white" style="background-color: #5DB99D">목록</a>

                    <%--신고하기--%>
                    <c:if test="${!communityPostViewDto.userId.equals(loginUser.id)}">
                        <button id="reportPost" class="btn btn-primary me-1 w-auto">신고</button>
                    </c:if>
                </div>

                <%--댓글 등록--%>
                <div class="col-12">
                    <form method="POST" id="replyForm" class="row g-0 gap-2">
                        <div class="col-10">
                        <textarea class="rounded-3 form-control" rows="3" name="communityReplyContent"
                                  id="communityReplyContent"></textarea>
                        </div>
                        <button class='btn btn-outline-secondary col' type="submit">댓글 등록</button>
                    </form>
                </div>

                <%--댓글 목록--%>
                <ul id="communityReplyList" class="list-group list-group-flush col-12">
                </ul>
            </div>
        </div>

        <%--더미--%>
        <dic class="col-3"></dic>

    </div>
</section>


<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/reportModal.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Toast Editor Viewer CDN -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>

<script defer>
    // 토스트 에디터 뷰어
    const viewer = new toastui.Editor({
        el: document.querySelector('#viewer'),
        height: 'auto',
        initialValue: "${communityPostViewDto.communityPostContent}"
    });

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
                    let tag = "";
                    $(result).each(function (i, rDto) {
                        let date = new Date(rDto.communityReplyWritedate);
                        let newDate = date.toISOString().split('T')[0];
                        //댓글리스트폼
                        tag += "<li class='list-group-item row'>";

                        if (rDto.communityReplyId != rDto.communityReplyParentsId) {
                            tag += "<div class='col-12'>";
                            tag += "    <div class='row'>";
                            tag += "        <div class='col'>";
                            tag += "            <i class='bi bi-arrow-return-right'></i>"
                            tag += "        </div>";
                        }

                        if (rDto.communityReplyId != rDto.communityReplyParentsId) {
                            tag += "        <div class='col-11'>";
                        } else {
                            tag += "        <div class='col-12'>";
                        }
                        tag += "                <div class='hstack gap-2'>";

                        tag += "                    <span class='replyUserNickname fw-semibold'>" + rDto.userNickname + "</span> <span>(" + newDate + ")</span>"; //userId, 작성일
                        tag += "                    <button type='button' name='reReply' class='btn btn-sm btn-primary border-0 text-secondary ms-auto'>답글</button>";
                        if (rDto.isWriter) {
                            tag += "                <input type='button' name='edit' class='btn btn-sm btn-primary border-0 text-secondary' value='수정'>";
                        }
                        if (rDto.isAdmin || rDto.isWriter) {
                            tag += "                <input type='button' name='delete' class='btn btn-sm btn-primary border-0 text-secondary' value='삭제' title='" + rDto.communityReplyId + "'>";
                        }
                        if (!rDto.isWriter) {
                            tag += "                <input type='button' name='report' class='btn btn-sm btn-primary border-0 text-secondary' value='신고'>";
                        }
                        tag += "                </div>";

                        tag += "                <div class='replyContent col-12 py-2'>" + rDto.communityReplyContent + "</div>";  // 댓글 내용
                        tag += "            </div>";

                        if (rDto.communityReplyId != rDto.communityReplyParentsId) {
                            tag += "    </div>";
                            tag += "</div>";
                        }

                        //댓글수정폼
                        tag += "    <div class='col-12' style='display:none'>";
                        tag += "        <form method='post' class='row g-0 gap-2'>";
                        tag += "            <input class='communityReplyId' type='hidden' name='communityReplyId' value='" + rDto.communityReplyId + "'>";  // 댓글 번호
                        tag += "            <textarea class='col-10' name='communityReplyContent' rows='3' required>" + rDto.communityReplyContent + "</textarea>";  // 댓글 내용
                        tag += "            <input type='submit' class='col btn btn-sm btn-secondary' name='replyEdit' value='수정완료' >"; //댓글 수정 버튼
                        tag += "        </form>";
                        tag += "    </div>";


                        // 대댓글 폼
                        tag += "    <div class='col-12 reReplyFormDiv mt-2' style='display:none'>";
                        tag += "        <form method='post' class='row g-0 gap-2 row'>";
                        tag += "            <input class='communityReplyParentsId' type='hidden' name='communityReplyParentsId' value='" + rDto.communityReplyParentsId + "'>";  // root 댓글 번호
                        tag += "            <div class='col'>";
                        tag += "                <i class='bi bi-arrow-return-right'></i>"
                        tag += "            </div>";
                        tag += "            <div class='col-10'>";
                        tag += "                <textarea class='form-control' name='communityReplyContent' rows='3' required></textarea>";  // 대댓글 내용
                        tag += "            </div>";
                        tag += "            <input type='submit' class='col btn btn-sm btn-secondary' name='reReply' value='등록' >"; //대댓글 등록 버튼
                        tag += "        </form>";
                        tag += "    </div>";

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
            let url = "/community/reply/edit";

            const content = this.closest('form').querySelector('textarea[name=communityReplyContent]').value;
            if (content === '') {
                alert('댓글을 입력하세요');
                return false;
            }

            $.ajax({
                url: url
                , data: params
                , type: "POST"
                , success: function (result) {
                    // 댓글 목록을 다시 뿌려주기
                    replyList();
                }, error: function (e) {
                    console.log(e.responseText);
                }
            });
            return false;
        });

        // 대댓글 폼
        $(document).on('click', '#communityReplyList button[name=reReply]', function () {
            this.closest('li').querySelector('.reReplyFormDiv').style.display = 'block';
        });

        // 대댓글 등록
        $(document).on('click', '#communityReplyList input[name=reReply]', function () {
            let params = $(this).parent().serialize();
            let url = "/community/${communityPostViewDto.communityPostId}/reply";

            $.ajax({
                url: url
                , data: params
                , type: "POST"
                , success: function (result) {
                    // 댓글 목록을 다시 뿌려주기
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
                        // 댓글 목록을 다시 뿌려주기
                        replyList();
                    },
                    error: function (e) {
                        console.log(e.responseText);
                    }
                });
            }
        });

        // 댓글 신고 모달창 띄우기
        $(document).on('click', '#communityReplyList input[name=report]', function () {
            toggleReportModal(true);

            const replyLi = this.closest('li');
            const replyContent = replyLi.querySelector('.replyContent').innerText;

            // 신고 내용 옮기기
            document.querySelector('#reportTargetContent').innerText =
                replyContent.substring(0, Math.min(20, replyContent.length));
            ;

            // 신고 대상 닉네임 옮기기
            const writerNickname = replyLi.querySelector('.replyUserNickname').innerText;
            document.querySelector('#reportTargetWriter').innerText = writerNickname;

            // 신고 대상 id 및 종류 옮기기
            reportSubjectIdInput.value = replyLi.querySelector('.communityReplyId').value;
            reportSubjectInput.value = 'COMMUNITY_REPLY';
        });

        replyList();
    });

    // 글 삭제 버튼
    const postDeleteBtn = document.querySelector('#deletePost');
    if (postDeleteBtn) {
        postDeleteBtn.onclick = () => {
            if (confirm("게시글을 삭제하시겠습니까?")) {
                const form = document.createElement('form');
                form.action = '/community/${communityPostViewDto.communityPostId}/delete';
                form.method = 'post';
                document.querySelector('body').append(form);
                form.submit();
            }
        }
    }


    // 신고 모달 설정
    const body = document.querySelector('body');
    const reportModal = document.querySelector('#reportModal');
    const reportModalBody = document.querySelector('#reportModalBody');
    const reportCancelBtn = document.querySelector('#reportCancel');
    const reportSubjectIdInput = document.querySelector('#reportSubjectId');
    const reportSubjectInput = document.querySelector('#reportSubject');
    const reportBtn = document.querySelector('#reportButton');

    // 모달 신고하기 버튼
    reportBtn.onclick = (e) => {
        const form = new FormData(e.currentTarget.closest('form'));
        const request = new XMLHttpRequest();

        request.onload = () => {
            const response = request.responseText;
            if (response === 'ok') {
                alert('신고가 접수되었습니다.');
                toggleReportModal(false);
            } else {
                alert('신고가 접수되지 않았습니다.');
            }
        }

        request.open("post", "/community/report")
        request.send(form);
    }

    // 게시글 신고 모달창 띄우기
    let reportPostBtn = document.querySelector('#reportPost');
    if (reportPostBtn) {
        reportPostBtn.onclick = () => {
            toggleReportModal(true);

            // 신고 내용 옮기기
            const content = document.querySelector('#communityPostContent').innerText;
            document.querySelector('#reportTargetContent').innerText =
                content.substring(0, Math.min(20, content.length));
            ;

            // 신고 대상 닉네임 옮기기
            const writerNickname = document.querySelector('#writerNickname').innerText;
            document.querySelector('#reportTargetWriter').innerText = writerNickname;

            // 신고 대상 id 옮기기
            reportSubjectIdInput.value = ${communityPostViewDto.communityPostId};

            reportSubjectInput.value = 'COMMUNITY_POST';
        }
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