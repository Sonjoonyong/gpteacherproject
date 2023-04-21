<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>새 글 작성</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>

    <!-- Toast UI Editor -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>

    <style>
        .create-form {
            border: 1px solid lightgray;
            border-radius: 5px;
            padding: 20px;
            width: 700px;
        }

        .submit-btn {
            float: right;
            margin-top: 15px;
        }
        .btn.btn-primary{

            border: 1px solid #5DB99D;
            color: white;
            background-color: #5DB99D;

        }
        .col-md-7 .row .clearfix #questionPassword{
            border: 1px solid lightgray;
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
                <div class="row text-center" style="margin-top: 57px;margin-left: -71px;"><h3>고객센터</h3></div>
                <div class="row" style="margin-top: 15px;">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/notice/list'">
                                    공지사항
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/faq/list'">
                                    자주묻는 질문
                                </button>
                            </h2>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/question/list'" style="background-color: #CFEAE2">
                                    문의사항
                                </button>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
            <!--글작성폼-->
            <div class="col-md-7" style="background-color: white; margin-top: 55px;">

                <div class="create-form col-md-7">

                    <form:form action="${pageContext.request.contextPath}/help/question" method="post" modelAttribute="questionCreateDto">
                        <!--제목, 카테고리-->
                        <div class="row" style="margin-top: 5px;">
                            <!--카테고리-->
                            <div class="FormSelectButton" style="width:80px; ">
                                <form:select path="questionCategory"  class="select" id="questionCategory" style="height:38px; border: 1px solid lightgray; border-radius: 5px;">
                                    <form:option value="학습"> 학습</form:option>
                                    <form:option value="결제"> 결제</form:option>
                                </form:select>
                            </div>
                            <!--제목-->
                            <div class="form-group " style="width:590px;  ">
                                <form:input path="questionTitle" type="text" placeholder="문의 제목을 입력하세요." class="form-control" id="questionTitle" required="required" style="width:589px; margin-left:-12px; " />
                            </div>
                        </div>
                        <!--내용-->
                        <div class="form-group" style="margin-top: 10px;">
                            <div id="editor"></div>
                            <form:hidden path="questionContent" id="hiddenQuestionContent" />
                        </div>
                        <!--등록번튼&비밀번호-->
                        <div class="row">
                            <div class="clearfix" style="width: 250px; margin-top: 15px; ">
                                <form:input path="questionPassword" type="text" placeholder="비밀번호" class="textbox" id="questionPassword" required="required"/>
                            </div>
                            <div class="clearfix" style="width: 432px;">
                                <button type="submit" class="btn btn-primary submit-btn">등록</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../fragments/footer.jsp" %>

<%@ include file="../fragments/bootstrapJs.jsp" %>

<!-- Toast UI Editor Initialization -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            height: '400px'
        });
        const form = document.querySelector('form');
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            const noticeContent = editor.getMarkdown();
            document.querySelector('#hiddenNoticeContent').value = noticeContent;
            form.submit();
        });
    });
</script>
</body>
</html>
