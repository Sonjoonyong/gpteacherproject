<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <title>커뮤니티</title>
  <link rel="stylesheet" href="/css/base.css">
  <%@ include file="../fragments/bootstrapCss.jsp" %>
  <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
  <style>
    #communityboard .table thead trboardname {
      margin-left: 20px;
    }
    .col-md-7 table tbody tr,
    .col-md-7 table tbody tr td {
      border-top: 1px solid lightgray;
      border-left: 1px solid white;
      border-right: 1px solid white;
      border-bottom: 1px solid lightgray;
    }
    a {
      color: black;
    }
    a:visited {
      color: black;
    }
    a:hover {
      color: black;
    }
    a:active {
      color: black;
    }
    .communityPost-title-link {
      text-decoration: none;
    }
    .col-md-7 table thead tr {
      background-color: #CFEAE2;
      border-top: 1px solid lightgray;
      border-left: 1px solid white;
      border-right: 1px solid white;
      border-bottom: 1px solid lightgray;
      height: 40px;
    }
    .page-link {
      color: #000;
      background-color: #fff;
      border: 1px solid #ccc;
    }
    .page-item.active .page-link {
      z-index: 1;
      color: #555;
      font-weight: bold;
      background-color: #CFEAE2;
      border-color: #ccc;
    }
    .page-link:focus, .page-link:hover {
      color: #000;
      background-color: #fafafa;
      border-color: #ccc;
    }
    .accordion .accordion-item .accordion-header .accordion-button {
      background-color: white;
      color: black;
    }
    .accordion .accordion-item .accordion-header .accordion-button:hover {
      background-color: #CFEAE2;
      color: black;
    }
    .accordion .accordion-item .accordion-header .accordion-button:focus {
      background-color: #CFEAE2;
      color: black;
    }
    .accordion .accordion-item .accordion-header .accordion-button:active {
      background-color: #CFEAE2;
      color: white;
    }
  </style>

</head>
<body>
<%@ include file="../fragments/header.jsp" %>
<section class="container">
  <div class="row">
    <%--사이드바--%>
    <div class="col-12 col-md-3 mt-5">
      <%@ include file="../fragments/communityMenu.jsp" %>
    </div>

    <div class="col-12 col-md-7 my-3">
      <div class="communityPost" id="communityPost">
        <div class="hstack mb-2">
          <a href="/community/write" class="btn btn-primary ms-auto">
            글작성
          </a>
        </div>
      </div>

      <c:forEach items="${bestListAll}" var="communityPostListDto" begin="0" end="9">
        <a href="/community/${communityPostListDto.id}" class="list-group-item list-group-item-action py-3">
          <div class="hstack gap-2">
              <%--카테고리--%>
            <span class="badge p-1 rounded-1" style="background-color: lightgray">
                ${communityPostListDto.communityPostCategory}
            </span>

              <%--제목--%>
            <h6 class="mb-1">
                ${communityPostListDto.communityPostTitle}
            </h6>

              <%--날짜--%>
            <small class="text-muted ms-auto">
              <fmt:formatDate value="${communityPostListDto.communityPostWritedate}"
                              pattern="yyyy.MM.dd"/>
            </small>
          </div>


          <p class="my-0 text-muted hstack gap-1 mt-2">
              <%--작성자--%>
            <small class="text-muted me-auto">
                ${communityPostListDto.userNickname}
            </small>

              <%--조회 수--%>
            <i class="bi bi-eye ms-auto" style="font-size: 12px"></i>
            <span style="font-size: 12px">${communityPostListDto.communityPostHit}</span>

              <%--댓글 수--%>
            <i class="bi bi-chat-left-dots ms-2" style="font-size: 12px"></i>
            <span style="font-size: 12px">${communityPostListDto.communityPostReplyCount}</span>

              <%--좋아요--%>
            <c:if test="${communityPostListDto.communityPostLike >= 1}">
              <i class="bi bi-heart-fill ms-2" style="font-size: 10px"></i>
            </c:if>
            <c:if test="${communityPostListDto.communityPostLike == 0}">
              <i class="bi bi-heart ms-2" style="font-size: 10px"></i>
            </c:if>
            <span style="font-size: 12px">${communityPostListDto.communityPostLike}</span>
          </p>
        </a>
      </c:forEach>
    </div>
  </div>
  </div>
  </div>
</section>
<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  (function () {
    let message = '${message}';
    if (message) {
      Swal.fire(message);
    }
  })();
</script>
</body>
</html>
