<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Writing</title>

    <%@ include file="../../fragments/bootstrapCss.jsp" %>

    <style>
        .container {
            max-width: 768px;
        }

        .example {
            font-weight: lighter;
        }

        .divider {
            border-bottom: 1px solid rgba(0, 0, 0, 0.08);
            margin-top: 40px;
            margin-bottom: 40px;
        }
    </style>

</head>
<body>

<%@ include file="../../fragments/header.jsp" %>
<section class="container">
    <h3 class="h3 text-center my-3" style="color: #5DB99D">TOPIC</h3>
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
                ${errorMessage}
        </div>
    </c:if>
    <form action="/learning/writing" method="post" id="customTopicForm" class="row d-flex justify-content-center">
        <div class="form-option text-center">
            <input type="hidden" name="topicType" value="customTopic">
            <label for="customTopic" class="text-center mb-2">주제를 직접 입력하여 글쓰기를 연습합니다.</label>
            <input type="text" id="customTopic" name="customTopic" placeholder="주제를 영어로 입력해주세요." class="col-12 col-md-10 py-2 rounded-3 border mx-auto text-center" style="text-align: center; margin-top: 40px"/>
            <div class="text-center example">ex) The effects of social media on mental health and interpersonal relationships.</div>
        </div>
        <div class="row justify-content-center mt-5">
            <input type="button" value="작성한 주제로 시작" onclick="checkProfanity(); return false;" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="width: 200px; background-color: #5DB99D">
        </div>
    </form>

    <div class="divider"></div>

    <form action="/learning/writing" method="post" class="row d-flex justify-content-center">
        <input type="hidden" name="topicType" value="predefinedTopic">
        <div class="form-option text-center">
            <label for="topic" class="text-center my-3">또는, 주제를 보기에서 선택하여 글쓰기를 연습합니다.</label><br>
            <select id="topic" name="predefinedTopic" class="form-select col-12 col-md-10 py-2 border mx-auto text-center" style="margin-top: 40px">
                <option value="POLITICS">정치</option>
                <option value="SOCIETY">사회</option>
                <option value="ECONOMY">경제</option>
                <option value="ENTERTAINMENT">연예</option>
                <option value="SPORTS">스포츠</option>
            </select>
            <div class="text-center example">한글로 된 주제를 선택하여도 GPTeacher가 관련된 주제를 영어로 생성해줍니다.</div>
        </div>
        <div class="row justify-content-center mt-5">
            <input type="submit" value="선택한 주제로 시작" class="btn btn-success shadow my-3 border-0 py-2 rounded-3" style="width: 200px; background-color: #5DB99D">
        </div>
    </form>

</section>

<script>
    function checkProfanity() {
        let request = new XMLHttpRequest();

        let form = document.getElementById('customTopicForm');
        let topic = form.querySelector('#customTopic').value;

        let formData = new FormData();
        formData.append('text',topic);

        request.onload = () => {
            let profanity = request.response.profanity;
            console.log(profanity);
            if (profanity == "true") {
                document.getElementById('customTopic').value = '';
                alert("부적절한 문장입니다. 바른 말을 사용해 주세요.");
            }
            if (profanity == "false") {
                form.submit();
            }
        }

        request.open("POST","/learning/sentence/profanity", true);
        request.responseType = "json";
        request.send(formData);
    }
</script>

<%@ include file="../../fragments/footer.jsp" %>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>