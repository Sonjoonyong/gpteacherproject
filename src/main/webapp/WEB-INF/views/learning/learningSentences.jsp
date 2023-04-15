<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Analysis by Sentence</title>

    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>

<%@ include file="../fragments/header.jsp" %>
<section class="container">
    <h1>ANALYSIS BY SENTENCE</h1>

    <c:forEach var="item" items="${analysis}" varStatus="status">
        <div id="sentence-group-${status.index}">
            <p><strong>Your sentence:</strong> ${item.original}</p>
            <p><strong>Corrected sentence:</strong> ${item.corrected}</p>
            <p><strong>Explanation:</strong> ${item.explanation}</p>
            <button onclick="likeSentence(${status.index})">좋아요</button>
            <button onclick="addToFlashcard(${status.index})">플래시카드</button>
            <button onclick="deleteSentence(${status.index})">삭제</button>
        </div>
    </c:forEach>
</section>

<%@ include file="../fragments/footer.jsp" %>
<script>
    function likeSentence(sentenceId) {
        // "좋아요" 버튼에 대한 로직 추가 예정
        fetch(`/learning/writing/statusUpdate?sentenceId=${sentenceId}&type=like`)
            .then(response => response.text())
            .then(status => {
                console.log("좋아요 상태:", status);
            });
    }


    function addToFlashcard(sentenceId) {
        // "플래시카드" 버튼에 대한 로직 구현 예정
        console.log("플래시카드:", sentenceId);
    }


    function deleteSentence(sentenceId) {
        // "삭제" 버튼에 대한 로직
        var sentenceGroup = document.getElementById("sentence-group-" + sentenceId);
        sentenceGroup.remove();
    }

</script>
<%@ include file="../fragments/bootstrapJs.jsp" %>

</body>
</html>