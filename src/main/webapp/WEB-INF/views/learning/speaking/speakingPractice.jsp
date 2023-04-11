<%--
  Created by IntelliJ IDEA.
  User: gyurey
  Date: 2023/04/08
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quesion+speaking하는곳</title>
    <%
        String question = generateQuestion("some topic");
        JSONObject questionObj = new JSONObject(question);
        String response = questionObj.getString("response");
    %>

    <p>question: <%=response%></p>

    <script>
    	var audio = new Audio();

    	$(function(){
    		$("#voiceForm").submit(function(){
    			event.preventDefault();

    			// javascript 비동기처리 객체 생성
    			let xhr = new XMLHttpRequest();

    			// 응답 받았을 때
    			xhr.responseType = "blob";  // 받는 response 는 바이너리 타입 임
    			xhr.onload = function(){
    				var audioURL = URL.createObjectURL(this.response);  // this.response 여기에 오디오 데이터(바이너리) 있음

    				// <audio src="파일명"></audio>
    				//var audio = new Audio();
    				audio.src = audioURL;  // audio 태그에 src 속성값 입력

    				// 재생
    				audio.play();

    			}

    			// 접속 오픈
    			xhr.open("post", "voiceOk");
    			// 헤더 셋팅 - get 방식은 안해도 되는데, post 방식은 필요
    			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    			// 접속 서버에 데이터 보내기
    			let params = $("#voiceForm").serialize();  // speaker=nara&...
    			xhr.send(params);

    		});

    		// stop 버튼
    		$("#stop").click(function(){
    			audio.pause();  // 일시정지
    			audio.currentTime = 0;  // 재생시간을 처음으로 설정
    		});



    	});
    </script>

</head>
<body>

    <div class="container">
    	<h1>Voice :</h1> <h3>음성으로 변환할 텍스트와 음색, 속도, 감정 등을 파라미터로 입력받은 후 음성을 합성하여 그 결과를 반환하는 HTTP 기반의 REST API</h3>
    	<form id="voiceForm" method="post">
    		목소리 종류 :
    		<select name="speaker">
    			<option value="clara">클라라: 영어, 여성 음색</option>
    			<option value="matt">매트: 영어, 남성 음색</option>
    		</select>

    		볼륨 :
    		<select name="volume">
    			<script>
    				for(var i = -5; i <= 5; i++){
    					document.write("<option value='"+ i +"'");
    					if (i == 0){
    						document.write(" selected");
    					}
    					document.write(">"+ i +"</option>");
    				}
    			</script>
    		</select>

    		속도 :
    		<select name="speed">
    			<script>
    				for(var i = -5; i <= 5; i++){
    					document.write("<option value='"+ i +"'");
    					if (i == 0){
    						document.write(" selected");
    					}
    					document.write(">"+ i +"</option>");
    				}
    			</script>
    		</select>

    		피치 :
    		<select name="pitch">
    			<script>
    				for(var i = -5; i <= 5; i++){
    					document.write("<option value='"+ i +"'");
    					if (i == 0){
    						document.write(" selected");
    					}
    					document.write(">"+ i +"</option>");
    				}
    			</script>
    		</select>

    		음성 감정 :
    		<select name="emotion">
    			<option value="0" selected>중립</option>
    			<option value="1">슬픔</option>
    			<option value="2">기쁨</option>
    			<option value="3">분노</option>
    		</select>

    		<hr>

    		<textarea name="text" style="width:100%; height:300px;"></textarea>
    		<input type="submit" value="SPEAKER">
    		<input type="button" value="stop" id="stop">
    	</form>

    </div>

</body>
</html>
