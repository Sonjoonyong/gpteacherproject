<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach var="sentence" items="${sentences}">

    <p>
        ${sentence.sentenceAnswer}
    </p>
    <p>
        ${sentence.sentenceCorrected}
    </p>
    <p>
        ${sentence.sentenceExplanation}
    </p>

</c:forEach>

</body>
</html>
