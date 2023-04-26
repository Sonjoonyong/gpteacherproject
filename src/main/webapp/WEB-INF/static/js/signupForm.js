// 버튼
const sendEmailCodeBtn = document.querySelector('#sendEmailCode');
const validateEmailCodeBtn = document.querySelector('#validateEmailCode');

// 안내문
const emailMsgDiv = document.querySelector('#emailMsg');
const emailCodeMsgDiv = document.querySelector('#emailCodeMsg');
const loginIdMsgDiv = document.querySelector('#loginIdMsg');
const nicknameMsgDiv = document.querySelector('#nicknameMsg');

// input
const emailInput = document.querySelector('#userEmail');
const emailCodeInput = document.querySelector('#userEmailCode');
const loginIdInput = document.querySelector('#userLoginId');
const nicknameInput = document.querySelector('#userNickname');

// 약관 동의
document.querySelector('#userAllTermAgreement').onclick = (e) => {
    const value = e.currentTarget.checked;
    document.querySelectorAll('input[type="checkbox"]')
        .forEach(e => e.checked = value);
}

// 약관 모달
const generalTermContent = document.querySelector('#generalTermContent');
const privacyTermContent = document.querySelector('#privacyTermContent');
const termModal = document.querySelector('#termModal');
const termModalBody = document.querySelector('#termModalBody');
const body = document.querySelector('body');

function toggleTermModal(boolean) {
    termModal.classList.toggle("show", boolean);
    termModalBody.scrollTop = 0;
    // 모달에 따른 body 스크롤 설정
    boolean && (body.style.overflow = 'hidden');
    boolean || (body.style.overflow = 'scroll');
}

document.querySelector('#generalTermDetail').onclick = () => {
    toggleTermModal(true);
    generalTermContent.style.display = 'block';
    privacyTermContent.style.display = 'none';

}
document.querySelector('#privacyTermDetail').onclick = () => {
    toggleTermModal(true);
    generalTermContent.style.display = 'none';
    privacyTermContent.style.display = 'block';
}

document.querySelector('#termModalCloseBtn').onclick = () => {
    toggleTermModal(false);
}

// 비밀번호 에러 메시지가 있을 경우 비밀번호 안내 문구 숨김
document.querySelector('#userPassword') &&
    (document.querySelector('#passwordInstruction').style.display = 'none');

// 비밀번호 보기
document.querySelectorAll('.viewPassword').forEach(el => {
    el.onclick = (event) => {
        const btn = event.currentTarget;
        const input = btn.previousElementSibling;
        const icon = btn.firstElementChild;
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.toggle('bi-eye', true);
            icon.classList.toggle('bi-eye-slash', false);
        } else {
            input.type = 'password';
            icon.classList.toggle('bi-eye', false);
            icon.classList.toggle('bi-eye-slash', true);
        }
    }
});

// 회원 가입 버튼
document.querySelector('#submitBtn').onclick = (e) => {
    const form = e.currentTarget.closest('form');
    // input disabled 모두 해제 후 전송
    document.querySelectorAll('input[disabled]')
        .forEach(e => e.disabled = false);
    form.submit();
}

// 로그인 id 중복검사
document.querySelector('#idDupCheck').onclick = () => {
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

document.querySelector('#nicknameDupCheck').onclick = () => {
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

    request.open("GET", '/user/signup/emailCode?userEmail=' + userEmail);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();

}

validateEmailCodeBtn.onclick = () => {
    const request = new XMLHttpRequest();
    const userEmailCode = emailCodeInput.value;
    let userEmail = emailInput.value;

    let params = new URLSearchParams();
    params.append("userEmailCode", userEmailCode);
    params.append("userEmail", userEmail);

    request.onload = () => {
        // true: 코드 정상 인증, else: 에러 메시지 출력
        const response = request.responseText;

        if (response === 'true') {
            emailCodeMsgDiv.innerText = '인증되었습니다. 10분 이내에 회원가입을 완료해주세요.';
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

    request.open("POST", '/user/signup/emailCode');
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    request.send(params.toString());
}
