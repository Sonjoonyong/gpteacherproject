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

        .label {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
            color: #3b9d7f;
        }

        #exampleQuestions {
            font-weight: lighter;
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
    <form action="/learning/writing" method="post" class="row d-flex">
        <div class="form-option">
            <input type="hidden" name="topicType" value="customTopic">
            <label>주제 직접 입력</label>
            <input type="text" id="customTopic" name="customTopic" placeholder="주제를 영어로 입력해주세요."/>
        </div>
        <button>직접 작성한 주제로 시작하기</button>

        <%--        <ul id="exampleQuestions"></ul>--%>
        <%--        --%>
        <%--        <div class="row justify-content-center mt-5">--%>
        <%--            <input type="submit" value="주제 선정" class="btn btn-success shadow my-3 border-0 py-2 rounded-3"--%>
        <%--                   style="width: 85px; background-color: #5DB99D;">--%>
        <%--        </div>--%>
    </form>

    <form action="/learning/writing" method="post" class="row d-flex">
        <input type="hidden" name="topicType" value="predefinedTopic">
        <div>
            <label for="topic">주제 보기에서 선택</label>
            <select id="topic" name="predefinedTopic">
                <option value="POLITICS">정치</option>
                <option value="SOCIETY">사회</option>
                <option value="ECONOMY">경제</option>
                <option value="ENTERTAINMENT">연예</option>
                <option value="SPORTS">스포츠</option>
            </select>
        </div>

        <button>랜덤 주제로 시작하기</button>
    </form>
</section>

<%@ include file="../../fragments/footer.jsp" %>

<%--<script>--%>
<%--    const exampleQuestions = {--%>
<%--        "1": ["What are the key challenges faced by democracies around the world today?", "How do geopolitical tensions impact international relations?", "In what ways can a nation improve its diplomatic ties with other countries?"],--%>
<%--        "2": ["How has the rise of social media influenced the way people interact with each other?", "What are some effective ways to address the issue of income inequality?", "How can communities work together to promote tolerance and inclusivity?"],--%>
<%--        "3": ["What are the main factors that contribute to economic growth in a country?", "How does globalization affect domestic industries and job markets?", "What role do central banks play in managing a nation's economy?"],--%>
<%--        "4": ["How has streaming technology changed the landscape of the film and television industry?", "What are the key factors behind the success of a blockbuster movie or a hit TV show?", "In what ways has the gaming industry evolved over the past decade?"],--%>
<%--        "5": ["How do sports events, like the Olympics or the World Cup, impact a country's economy and international reputation?", "What are some of the most significant milestones in the history of women's sports?", "How has technology influenced the way sports are played, watched, and analyzed?"]--%>
<%--    };--%>

<%--    function toggleTopicInput() {--%>
<%--        const customTopicInput = document.getElementById("customTopic");--%>
<%--        const predefinedTopicSelect = document.getElementById("topic");--%>
<%--        const customTopicRadio = document.getElementById("customTopicRadio");--%>

<%--        if (customTopicRadio.checked) {--%>
<%--            customTopicInput.disabled = false;--%>
<%--            predefinedTopicSelect.disabled = true;--%>
<%--        } else {--%>
<%--            customTopicInput.disabled = true;--%>
<%--            predefinedTopicSelect.disabled = false;--%>
<%--            showExampleQuestions(predefinedTopicSelect.value);--%>
<%--        }--%>
<%--    }--%>

<%--    function showExampleQuestions(topicId) {--%>
<%--        const exampleQuestionsList = document.getElementById("exampleQuestions");--%>
<%--        exampleQuestionsList.innerHTML = '';--%>

<%--        if (exampleQuestions[topicId]) {--%>
<%--            exampleQuestions[topicId].forEach(question => {--%>
<%--                const listItem = document.createElement('li');--%>
<%--                listItem.textContent = question;--%>
<%--                exampleQuestionsList.appendChild(listItem);--%>
<%--            });--%>
<%--        }--%>
<%--    }--%>

<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--        toggleTopicInput();--%>
<%--        const topicSelect = document.getElementById("topic");--%>
<%--        topicSelect.addEventListener("change", function () {--%>
<%--            showExampleQuestions(this.value);--%>
<%--        });--%>
<%--        showExampleQuestions(topicSelect.value);--%>
<%--    });--%>

<%--</script>--%>

<%@ include file="../../fragments/bootstrapJs.jsp" %>

</body>
</html>