<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
  <title>공지 수정</title>

  <link rel="stylesheet" href="/css/base.css">
  <%@ include file="../fragments/bootstrapCss.jsp" %>
  <script src="https://kit.fontawesome.com/57137a5259.js" crossorigin="anonymous"></script>
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
    .accordion .accordion-item .accordion-header .accordion-button{
      background-color: white;
      color: black;
    }
    .accordion .accordion-item .accordion-header .accordion-button:hover{
      background-color: #CFEAE2;
      color: black;
    }
    .accordion .accordion-item .accordion-header .accordion-button:focus{
      background-color: #CFEAE2;
      color: black;
    }
    .accordion .accordion-item .accordion-header .accordion-button:active{
      background-color: #CFEAE2;
      color: white;
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
                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/notice/list'" style="background-color: #CFEAE2">
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
                <button class="accordion-button " type="button" onclick="location.href='${pageContext.request.contextPath}/help/question/list'">
                  문의사항
                </button>
              </h2>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-7" style="background-color: white; margin-top: 55px;">
        <h3>문의글 수정</h3>
        <div class="create-form col-md-7">
          <form:form action="${pageContext.request.contextPath}/help/faq/update/${faq.id}" method="post" modelAttribute="faq">
            <form:hidden path="id"/>
            <div class="row" style="margin-top: 5px;">
              <div class="FormSelectButton" style="width:80px; ">
                <form:select path="faqCategory"  class="select" id="faqTitle" value="${faq.faqCategory}" style="height:38px; border: 1px solid lightgray; border-radius: 5px;" >
                  <form:option value="학습"> 학습</form:option>
                  <form:option value="결제"> 결제</form:option>
                </form:select>
              </div>
              <div class="form-group " style="width:590px;  ">
                <form:input path="faqTitle" type="text" value="${faq.faqTitle}" class="form-control" id="faqTitle" required="required" style="width:589px; margin-left:-12px; " />
              </div>
            </div>
            <div class="row" style="margin-top: 10px;">
              <div class="form-group" >
                <form:textarea path="faqContent" style="border-top: 10px;" type="text" value="${faq.faqContent}" class="form-control" id="faqContent" rows="5" required="required" cssStyle="min-height: 400px"/>
              </div>
            </div>
            <div class="row">
              <div class="clearfix" style="width: 432px;">
                <button type="submit" class="btn btn-primary submit-btn">수정</button>
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
</body>
</html>
