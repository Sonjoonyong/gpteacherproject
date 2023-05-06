<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
  <title>자주 묻는 질문 새 글 작성</title>

  <link rel="stylesheet" href="/css/base.css">
  <%@ include file="../fragments/bootstrapCss.jsp" %>
  <!-- Toast UI Editor -->
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
  <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
  <!--fontawesome-->
  <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
  <!-- * * * * * * * * * * * * * * * *알림창 이쁘게 만들기 * * * * * * * * * * * * * * * * * * * *-->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
      <%@ include file="../fragments/customerServiceMenu.jsp" %>
      <!--글작성폼-->
      <div class="col-md-7" style="background-color: white; margin-top: 55px;">
        <div class="create-form col-md-7">
          <form:form action="${pageContext.request.contextPath}/help/faq" method="post" modelAttribute="faqCreateDto">
            <div class="row" style="margin-top: 5px;">
              <!--카테고리-->
              <div class="FormSelectButton" style="width:100px; margin-right: 5px; ">
                <form:select path="faqCategory"  class="select" id="faqCategory" style="height:38px; border: 1px solid lightgray; border-radius: 5px;">
                  <form:option value="학습"> 학습</form:option>
                  <form:option value="계정관리"> 계정관리</form:option>
                  <form:option value="나의활동"> 나의활동</form:option>
                  <form:option value="학습현황"> 학습현황</form:option>
                </form:select>
              </div>
              <!--제목-->
              <div class="form-group " style="width:560px;  ">
                <form:input path="faqTitle" type="text" placeholder="자주묻는 질문 제목" class="form-control" id="faqTitle" required="required" style="width:560px; margin-left:-12px; " />
              </div>
            </div>
            <div class="row" >
              <div class="form-group" style="margin-top: 10px;">
                <div id="editor"></div>
                <form:hidden path="faqContent" id="hiddenFaqContent" />
              </div>
            </div>
            <div class="row">
              <div class="clearfix">
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
      const faqContent = editor.getMarkdown();
      if (faqContent.trim() === '') {
        Swal.fire({
          icon: 'error',
          title: '',
          text: '내용을 입력해주세요.',
        });
        return;
      }
      document.querySelector('#hiddenFaqContent').value = faqContent;
      form.submit();
    });
  });
</script>
</body>
</html>
