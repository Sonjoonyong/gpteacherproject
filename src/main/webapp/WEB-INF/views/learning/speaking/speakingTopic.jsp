<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>Speaking Topic</title>
</head>
<body>
	<h1>Select a Topic</h1>
	<form action="speakingPractice.jsp" method="get">
		<button type="submit" name="toeic" value="toeic">TOEIC</button>
		<button type="submit" name="toefl" value="toefl">TOEFL</button>
		<button type="submit" name="opic" value="opic">Opic</button>
		<button type="submit" name="ielts" value="ielts">IELTS</button>
	</form>
</body>
</html>
