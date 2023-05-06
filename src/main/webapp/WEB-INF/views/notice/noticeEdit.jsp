<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>공지 수정</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <!-- Toast UI Editor -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>

        #noticeboard .table thead trboardname{
            margin-left: 20px;
        }
        .col-md-7 table tbody tr,
        .col-md-7 table tbody tr td {
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

        .btn.btn-primary{
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }

        .col-md-7 table thead tr{
            background-color: #CFEAE2;
            border-top : 1px solid lightgray;
            border-left : 1px solid white;
            border-right : 1px solid white;
            border-bottom : 1px solid lightgray;
            height: 40px;
        }

        .create-form {
            border: 1px solid lightgray;
            border-radius: 5px;
            padding: 20px;
        }

        .submit-btn {
            float: right;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<%@ include file="../fragments/header.jsp" %>

<section class="container">

    <div class="col-12">
        <div class="row">
            <%@ include file="../fragments/customerServiceMenu.jsp" %>
            <div class="col-md-7" style="background-color: white; margin-top: 55px;">
                <h3>글 수정</h3>
                <div class="create-form">
                    <form:form action="${pageContext.request.contextPath}/help/notice/update/${notice.id}" method="post" modelAttribute="notice">
                    <form:hidden path="id" />
                        <div class="form-group">
                            <label for="noticeTitle">글 제목 :</label>
                            <form:input path="noticeTitle" type="text" class="form-control" id="noticeTitle" value="${notice.noticeTitle}" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="noticeContent">글 내용 :</label>
                            <div id="editor" data-escaped-content='<c:out value="${notice.noticeContent}" />'></div>
                            <form:hidden path="noticeContent" id="hiddenNoticeContent" />
                        </div>
                        <div class="clearfix">
                            <button type="submit" class="btn btn-primary submit-btn">수정</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>

<!-- Toast UI Editor -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            initialValue: document.querySelector('#editor').dataset.escapedContent.replace(/\\n/g, '\n'), // 특수문자로 인한 syntax 에러 방지
            height: '400px'
        });

        const form = document.querySelector('form');
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            const noticeContent = editor.getMarkdown();

            if (noticeContent.trim() === '') {
                Swal.fire({
                    icon: 'error',
                    title: '',
                    text: '내용을 입력해주세요.',
                });
                return;
            }

            document.querySelector('#hiddenNoticeContent').value = noticeContent;
            form.submit();
        });
    });
</script>

</body>
</html>
