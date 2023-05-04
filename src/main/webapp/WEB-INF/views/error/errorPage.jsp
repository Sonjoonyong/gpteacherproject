<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ERROR PAGE</title>
    <style>
        /*.container {*/
        /*    margin: 0 auto;*/
        /*    border: 1px solid lightgray;*/
        /*    border-radius: 10px;*/
        /*    padding: 10px;*/
        /*}*/
    </style>

    <%@ include file="../fragments/bootstrapCss.jsp" %>

</head>
<body>
    <div class="container">
        <div class="row justify-content-center" style="margin:100px auto;">
            <div class="alert alert-warning text-center p-5 col-auto" role="alert">
                <i class="bi bi-exclamation-triangle m-3" style="font-size:70px;"></i>
                <div style="height:20px;"></div> <!--여백-->
                <h4 class="alert-heading">오류가 발생하였습니다.</h4>
                <p class="m-0">다음에 다시 시도해주세요.</p>
            </div>
        </div>
    </div>

<%@ include file="../fragments/bootstrapJs.jsp" %>
</body>
</html>
