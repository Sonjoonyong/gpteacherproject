<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>고객센터</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <style>
        #noticeboard{
            border: 1px solid lightgray;
            padding:20px;
        }
        #noticeboard .table thead trboardname{
            margin-left: 20px;
        }
        #noticeboard .table thead th,
        #noticeboard .table thead tr,
        #noticeboard .table tbody th,
        #noticeboard .table tbody tr{
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;

        }
        a { color: black; }
        a:visited { color: black; }
        a:hover { color: black; }
        a:active { color: black; }
        #searchbar fa-solid,
        #searchbar searchbox{

        }
    </style>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">
    <div class="col-12">
        <div class="row">
            <div class="col-12">
                <div class="row">

                    <div class="col-md-3" id="sidebar">
                        <div class="row text-center" style="margin-top: 50px;margin-left: -68px;"><h3>고객센터</h3></div>
                        <div class="row">
                            <div id="sidebar1" class="nav" style="margin-top: 20px;margin-left: 30px;">
                                <ul>
                                    <li class="nav-item" style="list-style: none">
                                        <a class="nav-link " href="#"><i class="fa-solid fa-chevron-right"></i> 공지사항</a>
                                    </li>
                                    <li class="nav-item" style="list-style: none">
                                        <a class="nav-link " href="#"><i class="fa-solid fa-chevron-right"></i> 자주묻는 질문</a>
                                    </li>
                                    <li class="nav-item" style="list-style: none">
                                        <a class="nav-link " href="#"><i class="fa-solid fa-chevron-right"></i> 문의사항</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7" style="background-color: white; margin-top: 100px;">
                        <div class="noticeboard" id="noticeboard">
                            <div class="d-flex justify-content-between">
                                <span class="boardname"><h3>고객센터</h3></span>
                                <div>
                                    <input type="submit" class="btn btn-primary float-end" value="글등록" style="align-content: end"/>
                                </div>
                            </div>
                            <table class="table table-striped" style="text-align: center; border:1px solid black;">
                                <thead>
                                <tr>
                                    <th style="background-color: white; text-align: center; width: 520px;">Title</th>
                                    <th style="background-color: white; text-align: center;">Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="notice" items="${pageInfo.list}">
                                    <tr>
                                        <td>${notice.noticeTitle}</td>
                                        <td><fmt:formatDate value="${notice.noticeWriteDate}" pattern="yyyy.MM.dd" /></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-7" style="background-color: white; margin-top: 15px;">
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


                            <div class="col-md-7" id="searchbar" style="background-color: white ;margin-top: 15px; display:inline-block; margin: 0px auto; ">
                                <i class="fa-solid fa-magnifying-glass"></i>  <input type="text" class="searchbox"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
