<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
  <title>자주 묻는 질문 수정</title>

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

    #questionboard .table thead trboardname{
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
      width: 700px;
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
      <!--사이드바-->
      <%@ include file="../fragments/customerServiceMenu.jsp" %>
      <div class="col-md-7" style="background-color: white; margin-top: 55px;">
        <h3>자주 묻는 질문 수정</h3>
        <div class="create-form col-md-7">
          <form:form action="${pageContext.request.contextPath}/help/faq/update/${faq.id}" method="post" modelAttribute="faq">
            <form:hidden path="id"/>
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
              <div class="form-group " style="width:560px;">
                <form:input path="faqTitle" type="text" value="${faq.faqTitle}" class="form-control" id="faqTitle" required="required" style="width:560px; margin-left:-12px; " />
              </div>
            </div>
            <!--글내용-->
              <div class="row" >
                <div class="form-group" style="margin-top: 10px;">
                  <label for="hiddenFaqContent">글 내용 :</label>
                  <div id="editor" data-escaped-content='<c:out value="${faq.faqContent}" />'></div>
                  <form:hidden path="faqContent" id="hiddenFaqContent" />
                  </div>
              </div>
            </div>
            <div class="row">
              <div class="clearfix">
                <button type="submit" class="btn btn-primary submit-btn">수정</button>
              </div>
            </div>
          </form:form>
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
      initialValue: document.querySelector('#editor').dataset.escapedContent.replace(/\\n/g, '\n'),
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
