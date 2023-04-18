<link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
<!-- Bootstrap icons CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    //
<style>
    body, html{
        height: 100%;
    }

    header {
        height: 85px; /* header 높이, 임의 지정 */
        position: relative;
        z-index: 1;
    }

    section {
        box-sizing: border-box;
        min-height: 100vh;
        padding-top: 85px; /* header 보금자리 */
        padding-bottom: 100px; /* footer 보금자리 */
        transform: translateY(-85px); /* header 높이 만큼 이동 */
    }

    footer {
        height: 100px; /* footer 높이, 임의 지정 */
        transform: translateY(-185px); /* section 올라간 높이 + 본인 높이 만큼 이동 */
    }

</style>