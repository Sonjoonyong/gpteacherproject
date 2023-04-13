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
	<!--=========TTS스크립트시작=========-->
    <script>
    	var audio = new Audio();
    	$(function(){
    		$("#voiceForm").submit(function(){
    			event.preventDefault();
    			let xhr = new XMLHttpRequest(); // javascript 비동기처리 객체 생성
    			xhr.responseType = "blob"; // 받는 response 는 바이너리 타입 임
    			xhr.onload = function(){
    				var audioURL = URL.createObjectURL(this.response);  // this.response 여기에 오디오 데이터(바이너리) 있음
    				audio.src = audioURL; // audio 태그에 src 속성값 입력
    				audio.play(); // 재생
    			}
    			xhr.open("post", "voiceOk");// 접속 오픈
    			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");// 헤더 셋팅 - get 방식은 안해도 되는데, post 방식은 필요
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
	<!--=========TTS스크립트끝=========-->

	<!--=========whisper스크립트시작=========-->
	<script>
		let recordButton = document.querySelector("#record");
		let stopButton = document.querySelector("#stop");
		stopButton.disabled = true;
		function mediaStart() {
			if (navigator.mediaDevices) {
				const constraints = {audio:true};
				let chunks = [] // 녹음된 내용을 저장할 변수
				// 정상 구현 시
				navigator.mediaDevices.getUserMedia(constraints).then(stream => {
					// 녹음을 시작하고 종료하는 객체
					const mediaRecorder = new MediaRecorder(stream);
					// 녹음 시작
					recordButton.onclick = () => {
						chunks = []; // 이전에 녹음된 내용이 있으면 초기화
						mediaRecorder.start();
						recordButton.style.backgroundColor = "red";
						recordButton.style.color = "white";
						recordButton.disabled = true;
						stopButton.disabled = false;
					}
					// 오디오 저장
					mediaRecorder.ondataavailable = e => {
						chunks.push(e.data);
					}
					// 녹음 종료
					stopButton.onclick = () => {
						mediaRecorder.stop();
						recordButton.style.backgroundColor = "";
						stopButton.disabled = true;
						recordButton.disabled = true;
					}
					// 녹음이 종료되면 서버로 녹음 내용을 보내고 결과를 받아오는 처리
					mediaRecorder.onstop = () => {
						// chunks에 저장된 데이터를 바이너리코드로 변환
						const blob = new Blob(chunks, {'type':'audio/webm codecs=opus'});
						// 서버로 전송
						let formData = new FormData();
						formData.append("audio", blob);
						ajax(formData);
					}
				}).catch(err => {
					console.log(err);
				});
			} else {
				console.log("미디어 장치 없음");
			}
		}
		function ajax(formData) {
			let request = new XMLHttpRequest();
			request.onload = () => {
				let responseText = request.responseText;
				document.querySelector('#textarea').innerText = responseText;
				recordButton.style.color = "";
				recordButton.disabled = false;
			}
			request.open("POST", "/gpt/whisper", false);
			request.send(formData);
		}
	</script>
	<!--=========whisper스크립트끝=========-->
</head>
<body>
	<h1>Speaking</h1>
	<h4>Question</h4>
	<h4>TTS버튼</h4>
    <div class="container">
			<div>
				<form id="voiceForm" method="post">
					목소리 종류 :
					<select name="speaker">
						<option value="clara">여성</option>
						<option value="matt">남성</option>
					</select>

					볼륨 :
					<select name="volume" >
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
					<textarea name="text" style="width:100%; height:100px;"></textarea>
					<input type="submit" value="SPEAKER">
					<input type="button" value="stop" id="stop">
					<br>
				</form>
			</div>
			<div>
            <form>
                <p>챗gpt의 질문:${assistantQuestion}</p>
            </form>
            </div>
			<div>
				<form id="voiceRecord" method="post">
					<h4>whisper</h4>
					<h4></h4>
					<input type="button" id="record" value="녹음 시작">
					<input type="button" id="stop2" value="녹음 중지">
				</form>
			</div>
			<div>
                        <form>
                            <p>챗gpt질문의 답변:${assistantAnswer}</p>
                        </form>
                        </div>
    </div>

</body>
</html>