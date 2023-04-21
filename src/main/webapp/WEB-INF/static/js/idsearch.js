// 버튼
const sendEmailCodeBtn = document.querySelector('#sendEmailCode');
const validateEmailCodeBtn = document.querySelector('#validateEmailCode');

// 메시지 창
const emailMsgDiv = document.querySelector('#emailMsg');
const emailCodeMsgDiv = document.querySelector('#emailCodeMsg');
const loginIdSpan = document.querySelector('#userLoginId');
const loginIdMsgDiv = document.querySelector('#userLoginIdMsg');

// input
const emailInput = document.querySelector('#userEmail');
const emailCodeInput = document.querySelector('#userEmailCode');

// 인증번호 전송
sendEmailCodeBtn.onclick = () => {
    const request = new XMLHttpRequest();
    const userEmail = emailInput.value;

    request.onload = () => {
        // 'true': 코드 정상 발급, 'else': 에러 메시지 출력
        const response = request.responseText;

        if (response === 'true') {
            emailCodeMsgDiv.innerText = '이메일로 전송된 코드를 입력해주세요.';
            emailCodeMsgDiv.classList.toggle("text-danger", false);
            emailCodeMsgDiv.classList.toggle("text-success", true);
            emailCodeInput.disabled = false;
            validateEmailCodeBtn.disabled = false;
            emailMsgDiv.innerText = '';
        } else {
            emailMsgDiv.innerText = response;
            emailMsgDiv.classList.toggle("text-danger", true);
            emailMsgDiv.classList.toggle("text-success", false);
        }
    }

    request.open("GET", '/user/idsearch/emailCode?email=' + userEmail);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}

// 인증
validateEmailCodeBtn.onclick = () => {
    const request = new XMLHttpRequest();
    const userEmailCode = emailCodeInput.value;

    request.onload = () => {
        // result:true - 코드 정상 인증, false: 실패
        // loginUserId: 로그인 아이디
        const responseJson = JSON.parse(request.responseText);

        if (responseJson.result === true) {
            emailCodeMsgDiv.innerText = '인증되었습니다.';
            emailCodeMsgDiv.classList.toggle("text-danger", false);
            emailCodeMsgDiv.classList.toggle("text-success", true);
            validateEmailCodeBtn.disabled = true;
            emailCodeInput.disabled = true;
            emailInput.disabled = true;
            sendEmailCodeBtn.disabled = true;
            loginIdMsgDiv.style.display = '';
            loginIdSpan.innerText = responseJson.userLoginId;
        } else {
            emailCodeMsgDiv.innerText = responseJson.errorMsg;
            emailCodeMsgDiv.classList.toggle("text-danger", true);
            emailCodeMsgDiv.classList.toggle("text-success", false);
            emailInput.disabled = false;
        }
    }

    request.open("POST", '/user/idsearch/emailCode?userEmailCode=' + userEmailCode);
    request.setRequestHeader("Accept", "application/json; charset=utf-8")
    request.send();
}
