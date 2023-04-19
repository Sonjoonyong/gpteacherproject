// 버튼
const sendEmailCodeBtn = document.querySelector('#sendEmailCode');
const validateEmailCodeBtn = document.querySelector('#validateEmailCode');
const loginIdDupCheck = document.querySelector('#idDupCheck');
const nicknameDupCheckBtn = document.querySelector('#nicknameDupCheck');
const submitBtn = document.querySelector('#submitBtn');

// 안내문
const emailCodeMsgDiv = document.querySelector('#emailCodeMsg');
const loginIdMsgDiv = document.querySelector('#loginIdMsg');
const nicknameMsgDiv = document.querySelector('#nicknameMsg');
const emailMsgDiv = document.querySelector('#emailMsg');

// input
const emailInput = document.querySelector('#userEmail');
const emailCodeInput = document.querySelector('#userEmailCode');
const loginIdInput = document.querySelector('#userLoginId');
const nicknameInput = document.querySelector('#userNickname');

// 약관 동의
const allTermAgreementCheckBox = document.querySelector('#userAllTermAgreement');

allTermAgreementCheckBox.onclick = (e) => {
    const value = e.currentTarget.checked;
    document.querySelectorAll('input[type="checkbox"]')
        .forEach(e => e.checked = value);
}


submitBtn.onclick = (e) => {
    const form = e.currentTarget.closest('form');
    // input disabled 모두 해제 후 전송
    document.querySelectorAll('input[disabled]')
        .forEach(e => e.disabled = false);
    form.submit();
}

// 로그인 id 중복검사
loginIdDupCheck.onclick = () => {
    const request = new XMLHttpRequest();
    const userLoginId = loginIdInput.value;

    request.onload = () => {
        // true: 중복, false: 사용 가능, else: 에러메시지
        const response = request.responseText;

        // 안내문 기본 빨간색
        loginIdMsgDiv.classList.toggle("text-danger", true);
        loginIdMsgDiv.classList.toggle("text-success", false);

        if (response === 'true') {
            loginIdMsgDiv.innerText = '중복되는 아이디입니다.';
        } else if (response === 'false') {
            loginIdMsgDiv.innerText = '사용 가능한 아이디입니다.';
            loginIdMsgDiv.classList.toggle("text-danger", false);
            loginIdMsgDiv.classList.toggle("text-success", true);
        } else {
            loginIdMsgDiv.innerText = response;
        }
    }

    request.open("GET", '/user/signup/loginIdDupCheck?userLoginId=' + userLoginId);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}

nicknameDupCheckBtn.onclick = () => {
    const request = new XMLHttpRequest();
    const userNickname = nicknameInput.value;

    request.onload = () => {
        // true: 중복, false: 사용 가능, else: 에러메시지
        const response = request.responseText;

        // 안내문 기본 빨간색
        nicknameMsgDiv.classList.toggle("text-danger", true);
        nicknameMsgDiv.classList.toggle("text-success", false);

        if (response === 'true') {
            nicknameMsgDiv.innerText = '중복되는 닉네임입니다.';
        } else if (response === 'false') {
            nicknameMsgDiv.innerText = '사용 가능한 닉네임입니다.';
            nicknameMsgDiv.classList.toggle("text-danger", false);
            nicknameMsgDiv.classList.toggle("text-success", true);
        } else {
            nicknameMsgDiv.innerText = response;
        }
    }

    request.open("GET", '/user/signup/nicknameDupCheck?userNickname=' + userNickname);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}

sendEmailCodeBtn.onclick = () => {
    const request = new XMLHttpRequest();
    const userEmail = emailInput.value;

    request.onload = () => {
        // true: 코드 정상 발급, else: 에러 메시지 출력
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

    request.open("GET", '/user/signup/emailCode?email=' + userEmail);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();

}

validateEmailCodeBtn.onclick = () => {
    const request = new XMLHttpRequest();
    const userEmailCode = emailCodeInput.value;

    request.onload = () => {
        // true: 코드 정상 인증, else: 에러 메시지 출력
        const response = request.responseText;

        if (response === 'true') {
            emailCodeMsgDiv.innerText = '인증되었습니다.';
            emailCodeMsgDiv.classList.toggle("text-danger", false);
            emailCodeMsgDiv.classList.toggle("text-success", true);
            validateEmailCodeBtn.disabled = true;
            emailCodeInput.disabled = true;
            emailInput.disabled = true;
            sendEmailCodeBtn.disabled = true;
        } else {
            emailCodeMsgDiv.innerText = '인증에 실패했습니다.';
            emailCodeMsgDiv.classList.toggle("text-danger", true);
            emailCodeMsgDiv.classList.toggle("text-success", false);
            emailInput.disabled = false;
        }
    }

    request.open("POST", '/user/signup/emailCode?userEmailCode=' + userEmailCode);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}
