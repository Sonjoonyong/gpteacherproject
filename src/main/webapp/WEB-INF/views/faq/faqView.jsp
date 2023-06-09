<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>자주 묻는 질문 상세 페이지</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
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

    </style>

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
            <%@ include file="../fragments/customerServiceMenu.jsp" %>
            <!--본문-->
            <div class="col-md-7" style="margin-top: 110px; ">
                <table class="table" style="text-align:start; border:1px solid black;" >
                    <thead style="margin-bottom: 20px;">
                    <tr>
                        <td colspan="2">${faq.faqTitle}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="2" style="min-height: 200px;height: 200px; text-align: left;" id="faqContentView">${faq.faqContent}</td>
                    </tr>
                    </tbody>
                </table>
                <form action="${pageContext.request.contextPath}/help/faq/delete/${faq.id}" method="post" onsubmit="return confirm('글을 삭제하시겠습니까?');" style="display:inline;">
                    <a href="${pageContext.request.contextPath}/help/faq/list" class="btn btn-primary">목록</a>
                    <c:if test="${loginUser.userRole == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/help/faq/edit/${faq.id}" class="btn btn-primary">수정</a>
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </c:if>
                </form>
            </div>

        </div>
    </div>
</section>

<!-- Toast UI Editor Viewer -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const noticeContent = document.getElementById('faqContentView').innerHTML;
        const viewer = new toastui.Editor({
            el: document.getElementById('faqContentView'),
            initialValue: noticeContent,
            height: 'auto',
            viewer: true
        });
    });
</script>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
