<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>글쓰기 연습 - 주제선정</title>
    <script>

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
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            toggleTopicInput();
        });

    </script>
</head>
<body>
<h1>TOPIC</h1>

<form th:action="@{/learning/writing}" method="post">
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
    <button type="submit">주제선정</button>
</form>
</body>
</html>