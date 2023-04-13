<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>GPTeacher's CORRECTION</title>
</head>
<body>
<h1>GPTeacher's CORRECTION</h1>
<p>Question: ${assistantQuestion}</p>
<p>Your Answer:</p>
<p>${answer}</p>
<p>GPTeacher's Correction:</p>
<p>${correctedAnswer}</p>
<form method="get" action="/learning/sentences">
  <button type="submit">문장별 분석</button>
</form>
<form method="get" action="/">
  <button type="submit">메인 페이지</button>
</form>
</body>
</html>
