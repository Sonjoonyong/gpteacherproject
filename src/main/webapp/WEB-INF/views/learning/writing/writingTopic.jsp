<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기 연습 - 주제선정</title>
    <script>
        const exampleQuestions = {
            "1": ["What are the key challenges faced by democracies around the world today?", "How do geopolitical tensions impact international relations?", "In what ways can a nation improve its diplomatic ties with other countries?"],
            "2": ["How has the rise of social media influenced the way people interact with each other?", "What are some effective ways to address the issue of income inequality?", "How can communities work together to promote tolerance and inclusivity?"],
            "3": ["What are the main factors that contribute to economic growth in a country?", "How does globalization affect domestic industries and job markets?", "What role do central banks play in managing a nation's economy?"],
            "4": ["How has streaming technology changed the landscape of the film and television industry?", "What are the key factors behind the success of a blockbuster movie or a hit TV show?", "In what ways has the gaming industry evolved over the past decade?"],
            "5": ["How do sports events, like the Olympics or the World Cup, impact a country's economy and international reputation?", "What are some of the most significant milestones in the history of women's sports?", "How has technology influenced the way sports are played, watched, and analyzed?"]
        };

        function toggleTopicInput() {
            const customTopicInput = document.getElementById("customTopic");
            const predefinedTopicSelect = document.getElementById("topic");
            const customTopicRadio = document.getElementById("customTopicRadio");

            if (customTopicRadio.checked) {
                customTopicInput.disabled = false;
                predefinedTopicSelect.disabled = true;
            } else {
                customTopicInput.disabled = true;
                predefinedTopicSelect.disabled = false;
                showExampleQuestions(predefinedTopicSelect.value);
            }
        }

        function showExampleQuestions(topicId) {
            const exampleQuestionsList = document.getElementById("exampleQuestions");
            exampleQuestionsList.innerHTML = '';

            if (exampleQuestions[topicId]) {
                exampleQuestions[topicId].forEach(question => {
                    const listItem = document.createElement('li');
                    listItem.textContent = question;
                    exampleQuestionsList.appendChild(listItem);
                });
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            toggleTopicInput();
            const topicSelect = document.getElementById("topic");
            topicSelect.addEventListener("change", function () {
                showExampleQuestions(this.value);
            });
            showExampleQuestions(topicSelect.value);
        });

    </script>
</head>
<body>
<h1>TOPIC</h1>
<c:if test="${not empty errorMessage}">
    <div class="error-message">
            ${errorMessage}
    </div>
</c:if>
<form action="${pageContext.request.contextPath}/learning/writing" method="post">
    <input type="hidden" name="action" value="start">
    <div>
        <input type="radio" id="customTopicRadio" name="topicType" value="custom" onclick="toggleTopicInput()" checked>
        <label for="customTopicRadio">주제 직접 입력</label>
        <input type="text" id="customTopic" name="customTopic" placeholder="주제를 영어로 입력해주세요." />
    </div>
    <div>
        <input type="radio" id="predefinedTopicRadio" name="topicType" value="predefined" onclick="toggleTopicInput()">
        <label for="predefinedTopicRadio">주제 보기에서 선택</label>
        <select id="topic" name="predefinedTopic" disabled>
            <option value="1">정치</option>
            <option value="2">사회</option>
            <option value="3">경제</option>
            <option value="4">연예</option>
            <option value="5">스포츠</option>
        </select>
    </div>
    <ul id="exampleQuestions"></ul>
    <button type="submit">주제선정</button>
</form>
</body>
</html>