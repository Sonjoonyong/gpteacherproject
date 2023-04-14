<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
    <title>GPTeacher</title>

    <%@ include file="fragments/bootstrapCss.jsp" %>

</head>

<body>
<%@ include file="fragments/header.jsp" %>

<section class="container">


    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                    <img src="/images/banner_main.jpg" class="d-block w-100" alt="banner_main" height="300px">
            </div>
            <div class="carousel-item">
                <a href="/learning/writing">
                    <img src="/images/banner_writing.jpg" class="d-block w-100" alt="banner_writing" height="300px">
                </a>
            </div>
            <div class="carousel-item">
                <a href="/learning/speaking">
                    <img src="/images/banner_speaking.jpg" class="d-block w-100" alt="banner_speaking" height="300px">
                </a>
            </div>
            <div class="carousel-item">
                <a href="/learning/dialogue">
                    <img src="/images/banner_dialogue.jpg" class="d-block w-100" alt="banner_dialogue" height="300px">
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

</section>

<%@ include file="fragments/footer.jsp" %>

<%@ include file="fragments/bootstrapJs.jsp" %>

</body>
</html>
