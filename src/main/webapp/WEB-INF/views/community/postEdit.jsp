<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 수정</title>

    <link rel="stylesheet" href="/css/base.css">
    <%@ include file="../fragments/bootstrapCss.jsp" %>
    <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
    <style>

        #communitypost .table thead trboardname {
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

        #searchbar fa-solid,
        #searchbar searchbox {

        }

        .btn.btn-primary {
            border: 1px solid #5DB99D;
            color: #5DB99D;
            background-color: white;
        }

        .col-md-7 table thead tr {
            background-color: #CFEAE2;
            border-top: 1px solid lightgray;
            border-left: 1px solid white;
            border-right: 1px solid white;
            border-bottom: 1px solid lightgray;
            height: 40px;
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

    <!--  TOAST UI Editor CSS -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>

    <link rel="stylesheet" href="/css/sentenceModal.css"/>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>


<section class="container" style="max-width: 800px;">
    <h3>글 수정</h3>
    <form:form method="post" modelAttribute="communityPostUpdateDto"
               cssClass="create-form row gap-2 border rounded-3 p-3">
        <form:hidden path="communityPostId"/>
        <div class="hstack">
            <form:select path="communityPostCategory" cssClass="form-select w-auto">
                <form:option value="토익" label="토익"/>
                <form:option value="토플" label="토플"/>
                <form:option value="오픽" label="오픽"/>
                <form:option value="아이엘츠" label="아이엘츠"/>
                <form:option value="회화" label="회화"/>
                <form:option value="글쓰기" label="글쓰기"/>
                <form:option value="말하기" label="말하기"/>
                <form:option value="일상" label="일상"/>
                <form:option value="유머" label="유머"/>
                <form:option value="시험" label="시험"/>
                <form:option value="공부" label="공부"/>
            </form:select>

            <button type="button" id="addSentence" class="btn ms-auto w-auto"
                    style="background-color: #5DB99D; color: white;">
                나의 문장 첨부
            </button>
        </div>

        <%--제목--%>
        <div class="form-group">
            <form:input path="communityPostTitle" type="text" cssClass="form-control"
                        required="required"/>
        </div>


        <%--문장--%>
        <div id="sentenceHolder" class="col-12">
            <c:if test="${not empty sentence}">
                <div class="sentence row g-0 my-1 align-items-end justify-content-between shadow rounded-3 p-3">
                    <input type="hidden" class="communityPostSentenceId" name="sentenceId" value="${sentence.id}">
                    <div class="row px-0 g-0">
                        <div class="col-12 col-md-6 pe-1">
                            <div class="fw-bold" style="color: #2A6976;">
                                Your sentence
                            </div>
                            <div class="yourSentence row g-0 border p-1 rounded-1">
                                    ${sentence.sentenceAnswer}
                            </div>
                        </div>

                        <div class="col-12 col-md-6 ps-1">
                            <div class="row g-0 fw-bold align-content-center">
                                Corrected sentence
                            </div>
                            <div class="correctedSentence row g-0 border p-1 rounded-1">
                                    ${sentence.sentenceCorrected}
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="fw-bold mt-2" style="color: #2F4858;">Explanation</div>
                        <div class="explanation border p-1 rounded-1">
                                ${sentence.sentenceExplanation}
                        </div>
                    </div>

                </div>
            </c:if>
        </div>


        <%--본문--%>
        <div class="form-group">
            <div id="editor"></div>
            <form:hidden path="communityPostContent"/>
        </div>
        <%--버튼--%>
        <div class="col d-flex justify-content-end mt-2 gap-2">
            <button id="submitBtn" type="button" class="btn btn-primary submit-btn">수정</button>
            <a id="cancelBtn" href="/community/list" class="btn btn-secondary text-white">취소</a>
        </div>
    </form:form>
</section>

<%@ include file="../fragments/footer.jsp" %>
<%@ include file="../fragments/bootstrapJs.jsp" %>
<%@ include file="../fragments/sentenceTemplate.jsp" %>
<%@ include file="../fragments/sentenceModal.jsp" %>

<!--  TOAST UI Editor CDN  -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- 한국어 패치 -->
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<!--  SweetAlert2  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/toastUiEditor.js"></script>
<script src="/js/sentenceModal.js"></script>

</body>
</html>
