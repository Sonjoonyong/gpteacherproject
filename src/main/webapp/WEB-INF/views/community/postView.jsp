<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>커뮤니티</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>
        /* 글 내용의 경계선 표시 */
        .content{
            border: 1px dotted #cecece;
        }
        /* 글 내용안에 있는 이미지의 크기 제한 */
        .content img{
            max-width: 100%;
        }
        /* 댓글에 관련된 css */
        .comments ul{
            padding: 0;
            margin: 0;
            list-style-type: none;
        }
        .comments ul li{
            border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
        }
        .comments dt{
            margin-top: 5px;
        }
        .comments dd{
            margin-left: 26px;
        }
        .comments form textarea, .comments form button{
            float: left;
        }
        .comments li{
            clear: left;
        }
        .comments form textarea{
            width: 85%;
            height: 100px;
        }
        .comments form button{
            width: 15%;
            height: 100px;
        }
        /* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
        .comment form{
            display: none;
        }
        .comment{
            position: relative;
        }
        .comment .reply_icon{
            width: 8px;
            height: 8px;
            position: absolute;
            top: 10px;
            left: 30px;
        }
        .comments .user-img{
            width: 20px;
            height: 20px;
            border-radius: 50%;
        }

        /*여기까지가 원래 없던 내용*/
        .col-md-7{
            border: 1px solid lightgray;
            border-radius: 10px;
            padding:20px;
            width: 800px;


        }

        #communityboard .table thead trboardname{
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
    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">
    <div class="col-12">
        <div class="row">
            <!--사이드바-->
            <div class="col-md-3" id="sidebar">
                <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>커뮤니티</h3></div>
                <div class="row" style="margin-top: 15px;">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/community/list'" style="background-color: #CFEAE2">
                                    커뮤니티
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/community/?'">
                                    WeeklyTop10
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
                        <td colspan="2">${community.communityPostTitle}</td>
                    </tr>
                    </thead>
                    <tbody >
                    <tr>
                        <td>작성자: ${notice.userNickname}</td>
                        <td colspan="2" style="text-align: right">
                            <fmt:formatDate value="${community.communityPostWritedate}" pattern="yyyy-MM-dd" />
                            조회수: ${community.communityPostHit}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="min-height: 200px;height: 200px; text-align: left; ">${community.communityPostContent}</td>
                    </tr>
                    </tbody>
                </table>
                <form action="${pageContext.request.contextPath}/community/delete/${community.id}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <a href="${pageContext.request.contextPath}/community/list" class="btn btn-primary">목록</a>
                    <a href="${pageContext.request.contextPath}/community/edit/${community.id}" class="btn btn-primary">수정</a>
                    <button type="submit" class="btn btn-primary">삭제</button>

                </form>
                <div class="col-12 col-md-2">
                    <div class="row g-0">
                        <button class="col-1 col-md-5 btn ms-md-auto" onclick="toggleSentenceLikeAjax(this)">
                            <i class="like bi bi-heart${not empty sentence.sentenceLike && sentence.sentenceLike == '1'.charAt(0) ? '-fill' : ''}"></i>
                        </button>
                        <button class="col-1 col-md-5 btn" onclick="toggleStorageAjax(this)">
                            <i class="storage bi bi-archive${not empty sentence.flashcardId && sentence.flashcardId != -2 ? '-fill' : ''}"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="reply">
        <!-- 원글에 댓글을 작성할 수 있는 폼 -->
        <div class="comment_form">
            <form action="comment_insert.do" method="post">
                <textarea rows="content">댓글을 입력하시오</textarea>
                <button type="submit" class="btn btn-primary">등록</button>
            </form>
        </div>
    </div>
</section>






<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>





<%--${communityreply.communityReplyContent}--%>
<%--${communityreply.communityReplyWritedate}--%>
<%--${communityreply.communityReplyParentsId}--%>
<%--${communityreply.communityPostId}--%>


<%--<section class="replyContainer">--%>
<%--    <form action="${pageContext.request.contextPath}/community/view/${community.id}" method="post" onsubmit="return confirm('댓글을 등록하시겠습니까?');" style="display:inline;">--%>
<%--        <button type="submit" class="btn btn-primary">등록</button>--%>
<%--    </form>--%>
<%--</section>--%>



<%--<section>--%>
<%--    <div class="col-md-7" style="margin-top: 110px; ">--%>
<%--        <form method="post" id="replyForm">--%>
<%--            <input type="hidden" name="no" value="${communityreply.communityPostId}">--%>
<%--            <textarea name="reply" id="reply"></textarea>--%>
<%--            <button type="submit" class="btn btn-primary">등록</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</section>--%>