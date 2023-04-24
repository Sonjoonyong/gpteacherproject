<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>커뮤니티</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>
        .boardSubMenu a:link, .boardSubMenu a:hover, .boardSubMenu a:visited {
            color: red;
        }



        #communityReply {
            width: 50%;
            height: 80px;
        }
        #communityReplyList > li {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        /* 글 내용의 경계선 표시 */
        .communityReplycontent{
            border: 1px dotted #cecece;
        }
        /* 글 내용안에 있는 이미지의 크기 제한 */
        .communityReply img{
            max-width: 100%;
        }
        /* 댓글에 관련된 css */
        .communityReply ul{
            padding: 0;
            margin: 0;
            list-style-type: none;
        }
        .communityReply ul li{
            border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
        }
        .communityReply dt{
            margin-top: 5px;
        }
        .communityReply dd{
            margin-left: 26px;
        }
        .communityReply form textarea, .communityReply form button{
            float: left;
        }
        .communityReply li{
            clear: left;
        }
        .communityReply form textarea{
            width: 85%;
            height: 100px;
        }
        .communityReply form button{
            width: 15%;
            height: 100px;
        }
        /* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
        .communityReply form{
            display: none;
        }
        .communityReply{
            position: relative;
        }
        .communityReply .reply_icon{
            width: 8px;
            height: 8px;
            position: absolute;
            top: 10px;
            left: 30px;
        }
        .communityReply .user-img{
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
                <form action="/community/delete/${community.id}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <a href="/community/list" class="btn btn-primary">목록</a>
                    <a href="/community/edit/${community.id}" class="btn btn-primary">수정</a>
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
<ul>
<%--    <li>--%>
<%--        <div>--%>
<%--            <p>첫번째 댓글 작성자</p>--%>
<%--            <p>첫번째 댓글</p>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <li>--%>
<%--        <div>--%>
<%--            <p>두번째 댓글 작성자</p>--%>
<%--            <p>두번째 댓글</p>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <li>--%>
<%--        <div>--%>
<%--            <p>세번째 댓글 작성자</p>--%>
<%--            <p>세번째 댓글</p>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--</ul>--%>
<%--<hr />--%>

<%--<ul>--%>
<%--    <li>첫번째 댓글</li>--%>
<%--    <li>두번째 댓글</li>--%>
<%--    <li>세번째 댓글</li>--%>

    <c:forEach items="${communityreply}" var="reply">
<%--        여기서 아이템을 뭐로 쓸까?--%>
        <li>
            <div>
                <p>${communityreply.communityPostId} / ${communityreply.communityReplyWritedate}</p>
                <p>${communityreply.communityReplyContent}</p>

                <p>
                    <a>수정</a> / <a href="">삭제</a>
                </p>
            </div>
        </li>
    </c:forEach>
</ul>

    <div>

        <form method="post" action="/community/${community.id}/reply">
            <p>
                <textarea rows="5" cols="50" name="communityReplyContent"></textarea>
            </p>
            <p>
                <button type="submit">댓글 작성</button>
            </p>
        </form>

    </div>
</section>



<%--${communityreply.communityReplyContent}--%>
<%--${communityreply.communityReplyWritedate}--%>
<%--${communityreply.communityReplyParentsId}--%>
<%--${communityreply.communityPostId}--%>

















<%--<section>--%>
<%--    <script>--%>
<%--        &lt;%&ndash;function communityReplyDel() {&ndash;%&gt;--%>
<%--        &lt;%&ndash;    if (confirm("정말 삭제 하시겠습니까?")) {&ndash;%&gt;--%>
<%--        &lt;%&ndash;        location.href = "communityReplyDel?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>";&ndash;%&gt;--%>
<%--        &lt;%&ndash;    } else {&ndash;%&gt;--%>

<%--        &lt;%&ndash;    }&ndash;%&gt;--%>
<%--        &lt;%&ndash;}&ndash;%&gt;--%>



<%--        // var 대신 let 이런거로 고쳐보기--%>




<%--        $(function(){--%>
<%--            /****************** 댓글 목록 표시 *********************/--%>
<%--            // 두 군데서 사용하기 때문에 함수로 작성--%>
<%--            // ajax로 해당 게시물에 대한 모든 댓글을 선택하여 뷰에 표시--%>
<%--            function communityReplyList(){--%>
<%--                $.ajax({--%>
<%--                    url : "/community/postView"--%>
<%--                    , data : {--%>
<%--                        no : ${Communityreply.communityReplyWritedate}--%>
<%--                    }--%>
<%--                    , type : "GET"--%>
<%--                    , success: function(result){--%>
<%--                        //console.log(result);--%>

<%--                        var tag = "";--%>
<%--                        $(result).each(function(i, CommunityReply){ //오류시 communityReply로 고쳐봐라--%>
<%--                            tag += "<li><div>";--%>
<%--                            tag += "<b>"+ CommunityReply.userid +" ("+ CommunityReply.communityReplyWritedate +")</b>";--%>

<%--                            // 본인이 쓴 댓글 일 때, 수정 삭제 버튼 추가--%>
<%--                            if(CommunityReply.userid == '${userId}') {--%>
<%--                                //  cDTO.userid == ${logId} ==> 'goguma' == goguma  <- 이렇게 되어버림. 에러 발생. 따옴표 필요--%>
<%--                                //{Id}도 있으니 바꿔봐라--%>
<%--                                tag += "<input type='button' name='edit' value='수정'>";--%>
<%--                                // tag += "<input type='button' name='delete' value='삭제' title='"+ "'>";--%>

<%--                                tag += "<p>"+ CommunityReply.communityReplyContent +"</p></div>";  // 댓글 내용--%>

<%--                                // 댓글 수정 폼을 만들기 - 기존 댓글과 댓글번호(c_no)가 폼에 있어야 함--%>
<%--                                tag += "<div style='display:none'><form method='post'>";--%>
<%--                                // tag += "<input type='hidden' name='c_no' value='"+ cDTO.c_no +"'>"  // 댓글 번호--%>
<%--                                tag += "<textarea name='communityReply' style='width:400px;height:80px;'>"+ CommunityReply.communityReplyContent +"</textarea>"  // 댓글 내용--%>
<%--                                tag += "<input type='submit' name='communityReplyEdit' value='댓글수정하기'>"--%>
<%--                                tag += "</form></div>";--%>

<%--                            } else {  // 본인이 쓴 댓글이 아니면--%>
<%--                                tag += "<p>"+ CommunityReply.communityReplyContent +"</p>";  // 댓글 내용--%>
<%--                            }--%>

<%--                            tag += "</div></li>";--%>
<%--                        });--%>

<%--                        // .html : 원래 있던 내용 지우고 표시--%>
<%--                        $("#communityReply").html(tag);--%>

<%--                        //communityReplyList 이거 기능 구현--%>

<%--                    }, error: function(e){--%>
<%--                        console.log(e.responseText);--%>
<%--                    }--%>

<%--                });--%>
<%--            }--%>

<%--            /****************** 댓글 쓰기 *********************/--%>
<%--            $("#communityReply").submit(function(){--%>
<%--                // 코멘트 유효성 검사--%>
<%--                if ($("#communityReply").val() == "") {--%>
<%--                    alert("댓글 입력후 등록하세요.");--%>
<%--                    return false;--%>
<%--                }--%>
<%--                // 코멘트가 있으면 ajax 실행--%>
<%--                // 폼의 값을 쿼리문으로 만들기  -> no=44&comment=qwerasdf--%>
<%--                // 폼의 콤퍼넌트의 데이터를 name 속성값과 value 속성값을 이용하여 쿼리문 작성--%>
<%--                var query = $("#communityReply").serialize();  // 또는 $("#commentForm").serialize();  -> no=44&comment=qwerasdf--%>
<%--                //원래 위에 "#communityReplyForm" 대신 this가 써져있었음--%>
<%--// 			console.log("query:"+ query);--%>
<%--// 			alert(query);--%>
<%--                $.ajax({--%>
<%--                    url : "/community/postview"--%>
<%--                    , data : query--%>
<%--                    , type : "POST"--%>
<%--                    , success : function(result) {--%>
<%--                        //console.log(result);--%>
<%--                        // 기존에 작성한 댓글 지우기--%>
<%--                        // ajax 이기 때문에 화면 변화가 없어서 댓글이 그대로 남아있다--%>
<%--                        $("#communityReply").val("");--%>

<%--                        // 댓글 목록을 다시 뿌려주기--%>
<%--                        communityReplyList();--%>

<%--                    }, error : function(e) {--%>
<%--                        console.log(e.responseText);--%>
<%--                    }--%>
<%--                });--%>
<%--                // 원래대로라면, form 의 submit 처리가 끝나면 action 값에 따라 페이지 이동하게 된다.--%>
<%--                // 페이지가 이동하면 boardView.jsp 를 처음부터 다시 읽어오는 것이 되므로--%>
<%--                // 화면변화를 주지 않기 위해 false 를 리턴한다.--%>
<%--                return false;--%>

<%--            });--%>

<%--            // 댓글 수정 폼 보여주기 : 본인이 쓴 글일 때 수정 버튼을 클릭하면 글 내용은 숨기고, 폼을 보여준다--%>
<%--            $(document).on('click', '#communityReplyList input[name=edit]', function(){--%>
<%--                // 기존의 열려있는 폼은 닫기--%>
<%--                //$("#commentList > li > div:nth-first").css("display", "block");--%>
<%--                //$("#commentList > li > div:nth-last").css("display", "none");--%>

<%--                // 댓글 숨기기--%>
<%--                $("#communityReply").parent().css("display", "none");//this--%>
<%--                // 폼 보이기--%>
<%--                $("#communityReply").parent().next().css("display", "block");//this가 써져있는걸 "#communityReply"로 교체--%>
<%--            });--%>

<%--            /****************** 댓글 수정 등록 *********************/--%>
<%--            $(document).on('click', '#communityReplyList input[name=communityReplyEdit]', function(){--%>
<%--                // 데이터 준비 : c_no=34&coment=qwer--%>
<%--                var params = $("#communityReply").parent().serialize();--%>
<%--                //console.log("params: "+ params);--%>
<%--                var url = "/communityReply/edit/{id}";--%>

<%--                $.ajax({--%>
<%--                    url: url--%>
<%--                    , data: params--%>
<%--                    , type: "POST"--%>
<%--                    , success: function(result){--%>
<%--                        // 댓글 목록을 다시 뿌려주기--%>
<%--                        communityReplyList();--%>

<%--                    }, error: function(e){--%>
<%--                        console.log(e.responseText);--%>
<%--                    }--%>
<%--                });--%>
<%--                return false;  // form 의 action 을 방지하기 위한 return. 이거 없으면 Request method 'POST' not supported 에러 발생--%>
<%--            });--%>
<%--            /****************** 댓글 삭제 *********************/--%>
<%--            $(document).on('click', '#communityReplyList input[name=delete]', function(){--%>
<%--                if (confirm("댓글을 삭제할까요?")) {--%>
<%--                    var params =  $("#communityReply").attr("title"); //this를 "#communityReply"로 교체--%>
<%--                    //위에 title 을 조심해서 볼 것--%>
<%--                    //console.log(params);--%>
<%--                    var url = "/communityReply/delete/{id}";--%>

<%--                    $.ajax({--%>
<%--                        url: url--%>
<%--                        , data: params--%>
<%--                        , success: function(result){--%>
<%--                            console.log(result);--%>

<%--                            // 댓글 목록을 다시 뿌려주기--%>
<%--                            communityReplyList();--%>

<%--                        }, error: function(e){--%>
<%--                            console.log(e.responseText);--%>
<%--                        }--%>
<%--                    });--%>
<%--                }--%>

<%--            });--%>

<%--            // 게시글 내용 보여줄 때, 처음에 댓글 목록 보여주기--%>
<%--            communityReplyList();--%>

<%--        });--%>
<%--    </script>--%>

<%--    <div class="container">--%>

<%--        <h1>글내용보기</h1>--%>
<%--        <ul id="view">--%>
<%--            <li>글쓴이</li>--%>
<%--            <li id="communityPostId">${communityreply.communityPostId}</li>--%>
<%--            <li>등록일</li>--%>
<%--            <li id="communityReplyWritedate">${communityreply.communityReplyWritedate}</li>--%>
<%--            <li>내용</li>--%>
<%--            <li id="communityReplyContent">${communityreply.communityReplyContent}</li>--%>
<%--        </ul>--%>
<%--        &lt;%&ndash;${communityreply.communityReplyContent}&ndash;%&gt;--%>
<%--        &lt;%&ndash;${communityreply.communityReplyWritedate}&ndash;%&gt;--%>
<%--        &lt;%&ndash;${communityreply.communityReplyParentsId}&ndash;%&gt;--%>
<%--        &lt;%&ndash;${communityreply.communityPostId}&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="boardSubMenu">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a href="boardList?nowPage=${vo.nowPage }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">글목록</a>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <c:if test="${logId == dto.userid }">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <a href="boardEdit?no=${dto.no }&nowPage=${vo.nowPage }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">수정</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <a href="javascript:boardDel();">삭제</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </c:if>&ndash;%&gt;--%>

<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>

<%--        <!-- 댓글 -->--%>

<%--        <hr>--%>
<%--        <div>--%>
<%--            <form:form action="${pageContext.request.contextPath}/communityReply" method="post" modelAttribute="communityReply">--%>
<%--&lt;%&ndash;            <c:if test="${logStatus == 'Y' }">  <!-- 로그인 한 경우만 댓글쓰기 폼 보여주기 -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                <form method="post" id="communityReply">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="hidden" name="no" value="${dto.no }">  <!-- 원글 글번호 -->&ndash;%&gt;--%>

<%--                    <textarea name="communityReply" id="communityReply"></textarea>--%>
<%--    <div class="clearfix">--%>
<%--        <button type="submit" class="btn btn-primary submit-btn">등록</button>--%>
<%--    </div>--%>
<%--    </form:form>--%>
<%--                </form>--%>
<%--&lt;%&ndash;            </c:if>&ndash;%&gt;--%>

<%--            <ul id="communityReply">--%>

<%--            </ul>--%>

<%--        </div>--%>


<%--    </div>--%>
<%--</section>--%>






<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>







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