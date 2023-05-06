<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>유저 글</title>

  <link rel="stylesheet" href="/css/base.css">

  <style>
    .table-hover thead th {
      font-size: 16px;
      font-weight: bold;
      background-color: #716FAA;
      color: white;
      padding: 8px;
    }
    .myPostList{
      border: 1px solid lightgray;
      border-radius: 10px;
      padding:20px;
      width: 750px;
      min-height: 750px;
    }

    .btn.btn-primary{
      border: 1px solid #716FAA;
      color: #716FAA;
      background-color: white;
    }

    .page-link {
      color: #000;
      background-color: #fff;
      border: 1px solid #ccc;
    }

    .page-item.active .page-link {
      z-index: 1;
      color: white;
      font-weight:bold;
      background-color: #716FAA;
      border-color: #ccc;

    }

    .page-link:focus, .page-link:hover {
      color: #000;
      background-color: #fafafa;
      border-color: #ccc;
    }

    .tableATag {
      text-decoration: none;
      color: #373737;
    }
    #tableHead thead th{
      font-size: 16px;
      font-weight: bold;
      background-color: #716FAA;
      color: white;
      padding: 8px;
    }
  </style>
  <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container" >
  <div class="row">
    <%@ include file="../../fragments/adminMenu.jsp" %>
    <div class="col-md-8 offset-md-1 p-4 myPostList" style="margin-top:80px;">
      <h2 class="h3 my-4" style="color: #716FAA;">작성글</h2>
      <form action="/admin/userPosts" method="POST">
        <table id="tableHead" class="table table-hover" style="text-align: center; table-layout:fixed;">
          <thead>
          <tr>
            <th scope="col" style="width: 50px;"></th>
            <th scope="col" style="width: 475px;">제목</th>
            <th scope="col" style="width: 125px;">작성일</th>
            <th scope="col" style="width: 50px;">조회</th>
          </tr>
          </thead>
          <tbody class="table-group-divider">
          <c:forEach var="post" items="${pageInfo.list}">
            <tr>
              <td>
                <input class="form-check-input" type="checkbox" name="deleteId" value="${post.id}">
              </td>
              <td style="text-overflow:ellipsis; overflow:hidden; text-align: left;">
                <a href="${pageContext.request.contextPath}/community/${post.id}" class="tableATag form-check-label">${post.communityPostTitle}</a>
              </td>
              <td>
                <fmt:formatDate value="${post.communityPostWritedate}" pattern="yyyy.MM.dd"/>
              </td>
              <td>
                <span>${post.communityPostHit}</span>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>

        <div class="row mb-2 justify-content-between">
          <div class="col-md-4 form-check">
            <input class="form-check-input" type="checkbox" onclick="selectAll(this)" style="margin-left:10px;">
            <label class="form-check-label ms-3">
              전체 선택
            </label>
          </div>
          <div class="col-md-2" style="float: right">
            <input type="hidden" name="userId" value="${userId}" />
            <input  type="submit" class="btn btn-primary" value="글 삭제" onclick="return deleteSubmit(this)"/>
          </div>
        </div>

      </form>
      <div class="row">
        <div class="col-md-12 d-flex justify-content-center">
          <nav aria-label="Page navigation">
            <ul class="pagination">
              <c:if test="${pageInfo.hasPreviousPage}">
                <li class="page-item">
                  <a class="page-link" href="?pageNum=1&userId=${userId}" aria-label="First">
                    <span aria-hidden="true">«</span>
                  </a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="?pageNum=${pageInfo.prePage}&userId=${userId}" aria-label="Previous">
                    <span aria-hidden="true">‹</span>
                  </a>
                </li>
              </c:if>

              <c:forEach var="i" begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" step="1">
                <c:choose>
                  <c:when test="${i == pageInfo.pageNum}">
                    <li class="page-item active">
                      <a class="page-link" href="?pageNum=${i}&userId=${userId}">${i}</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                      <a class="page-link" href="?pageNum=${i}&userId=${userId}">${i}</a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>

              <c:if test="${pageInfo.hasNextPage}">
                <li class="page-item">
                  <a class="page-link" href="?pageNum=${pageInfo.nextPage}&userId=${userId}" aria-label="Next">
                    <span aria-hidden="true">›</span>
                  </a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="?pageNum=${pageInfo.pages}&userId=${userId}" aria-label="Last">
                    <span aria-hidden="true">»</span>
                  </a>
                </li>
              </c:if>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>
<script>
  function selectAll(selectAll) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked;
    });
  }

  function deleteSubmit(btn) {
    let checkList = document.querySelectorAll('input[name="deleteId"]:checked');
    let checkCount = checkList.length;

    if(checkCount == 0) {
      Swal.fire({
        icon: 'error',
        title: '',
        text: '선택된 글이 없습니다.',
        showConfirmButton: false,
        timer: 1500
      });
      return false;
    }
    let message;
    if (btn.value == "글 삭제") {
      message = "글을 삭제"
    }
    if (btn.value == "댓글 삭제") {
      message = "댓글을 삭제"
    }
    if (btn.value == "북마크 해제") {
      message = "북마크를 해제"
    }
    if(!confirm(checkCount + "개의 "+ message +"하시겠습니까?")) {
      return false;
    }

  }
</script>
<%@ include file="../../fragments/bootstrapJs.jsp" %>
</body>
</html>

<!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>