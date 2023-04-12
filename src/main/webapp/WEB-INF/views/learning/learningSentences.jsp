<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Analysis by Sentence</title>
</head>
<body>
    <h1>ANALYSIS BY SENTENCE</h1>

    <c:forEach var="item" items="${analysis}">
        <div>
            <p><strong>Your sentence:</strong> ${item.original}</p>
            <p><strong>Corrected sentence:</strong> ${item.corrected}</p>
            <p><strong>Explanation:</strong> ${item.explanation}</p>
        </div>
    </c:forEach>
</body>
</html>

