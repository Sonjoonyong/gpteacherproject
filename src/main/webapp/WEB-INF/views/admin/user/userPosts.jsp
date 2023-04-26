<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>관리 페이지</title>

  <link rel="stylesheet" href="/css/base.css">

  <style>

    .select-container .form-select {
      width: 280px;
      font-size: 30px;
      border: 0.1px solid #2F4858;
      border-radius: 5px;
      padding: 5px 10px;
      color: white;
      text-align: center;
      background-color: #716FAA;
    }

    .wrapper {
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 5px;
      margin-top: 70px;
      margin-bottom: 50px;
    }

    .table-hover thead th {
      font-size: 16px;
      font-weight: bold;
      background-color: #716FAA;
      color: white;
      padding: 8px;
    }

    .center-align {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    a { color: black; }
    a:visited { color: black; }
    a:hover { color: black; }
    a:active { color: black; }

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

  </style>
  <%@ include file="../../fragments/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="../../fragments/header.jsp" %>
<section class="container">
  <div class="row">
    <%@ include file="../../fragments/adminMenu.jsp" %>
    <div class="col-md-8 offset-md-1">
      <div class="mypostlist" id="mypostlist">
        <div class="wrapper">
          <div class="d-flex justify-content-between" style="color: #716FAA;">
            <span class="mypostlistname"><h3>작성 글</h3></span>
          </div>
          <form action="/user/mypage/communities" method="post">
            <table class="table table-hover" style="text-align: center">
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
                  <td style="text-overflow:ellipsis; overflow:hidden;">
                    <a href="${pageContext.request.contextPath}/community/view?communityId=${post.id}" class="tableATag form-check-label">${post.communityPostTitle}</a>
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
              <div class="col-md-2">
                <input type="submit" class="btn btn-primary" style="color: #716FAA; border-color: #716FAA" value="글 삭제" onclick="return deleteSubmit(this)"/>
              </div>
            </div>
          </form>
          <div class="row">
            <div class="col-md-12 d-flex justify-content-center">
              <nav aria-label="Page navigation">
                <ul class="pagination">
                  <c:if test="${pageInfo.hasPreviousPage}">
                    <li class="page-item">
                      <a class="page-link" href="?pageNum=1" aria-label="First">
                        <span aria-hidden="true">«</span>
                      </a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="?pageNum=${pageInfo.prePage}" aria-label="Previous">
                        <span aria-hidden="true">‹</span>
                      </a>
                    </li>
                  </c:if>

                  <c:forEach var="i" begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" step="1">
                    <c:choose>
                      <c:when test="${i == pageInfo.pageNum}">
                        <li class="page-item active">
                          <a class="page-link" href="?pageNum=${i}">${i}</a>
                        </li>
                      </c:when>
                      <c:otherwise>
                        <li class="page-item">
                          <a class="page-link" href="?pageNum=${i}">${i}</a>
                        </li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>

                  <c:if test="${pageInfo.hasNextPage}">
                    <li class="page-item">
                      <a class="page-link" href="?pageNum=${pageInfo.nextPage}" aria-label="Next">
                        <span aria-hidden="true">›</span>
                      </a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="?pageNum=${pageInfo.pages}" aria-label="Last">
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
    </div>
  </div>
</section>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>
</body>
</html>
