const nicknameInput = document.querySelector('#userNickname');
const nicknameMsgDiv = document.querySelector('#nicknameMsg');

document.querySelector('#nicknameDupCheck').onclick = () => {
    const request = new XMLHttpRequest();
    const userNickname = nicknameInput.value;
    const params = new URLSearchParams;
    params.append("userNickname", userNickname);

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

    request.open("GET", '/user/mypage/edit/checkNickname?' + params.toString());
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}

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


/**
 * 이메일 인증
 */

// 버튼
const sendEmailCodeBtn = document.querySelector('#sendEmailCode');
const validateEmailCodeBtn = document.querySelector('#validateEmailCode');

// 메시지 창
const emailMsgDiv = document.querySelector('#emailMsg');
const emailCodeMsgDiv = document.querySelector('#emailCodeMsg');

// input
const emailInput = document.querySelector('#userEmail');
const emailCodeInput = document.querySelector('#userEmailCode');

// 인증번호 전송
sendEmailCodeBtn.onclick = () => {
    const request = new XMLHttpRequest();
    sendEmailCode.disabled = true;

    request.onload = () => {
        // 'true': 코드 정상 발급, 'else': 에러 메시지 출력
        sendEmailCode.disabled = false;
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

    request.open("GET", '/user/mypage/edit/emailCode');
    request.setRequestHeader("Accept", "text/plain; charset=utf-8");
    request.send();
}

const userEmailCodeInput = document.querySelector('#userEmailCode');
const userNicknameInput = document.querySelector('#userNickname');

// 인증
validateEmailCodeBtn.onclick = () => {
    if (emailCodeInput.value === '') {
        Swal.fire('이메일 인증 코드를 입력해주세요.');
        return false;
    }

    emailInput.disabled = true;
    const request = new XMLHttpRequest();

    request.onload = () => {
        // 'true' - 코드 정상 인증, 'false': 실패
        if (request.responseText === 'true') {
            emailCodeMsgDiv.innerText = '인증되었습니다.';
            emailCodeMsgDiv.classList.toggle("text-danger", false);
            emailCodeMsgDiv.classList.toggle("text-success", true);
        } else {
            emailCodeMsgDiv.innerText = '인증번호가 유효하지 않습니다.';
            emailCodeMsgDiv.classList.toggle("text-danger", true);
            emailCodeMsgDiv.classList.toggle("text-success", false);
        }
    }

    request.open("POST", '/user/mypage/edit/emailCode?emailCode=' + emailCodeInput.value);
    request.send();
}

// form 제출
const submitBtn = document.querySelector('#submitBtn');
submitBtn.onclick = (e) => {


    if (userEmailCodeInput.value === '') {
        Swal.fire('이메일 코드를 입력해주세요.');
        return false;
    }
    if (userNicknameInput.value === '') {
        Swal.fire('닉네임을 입력해주세요.');
        return false;
    }

    if (userNicknameInput.value.length < 2 || userNicknameInput.value.length > 8) {
        Swal.fire('닉네임은 2~8자 범위로 입력해주세요.');
        return false;
    }

    e.target.closest('form').submit();
}
