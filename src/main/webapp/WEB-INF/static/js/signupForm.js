// 버튼
const sendEmailCodeBtn = document.querySelector('#sendEmailCode');
const validateEmailCodeBtn = document.querySelector('#validateEmailCode');
const loginIdDupCheck = document.querySelector('#idDupCheck');
const nicknameDupCheckBtn = document.querySelector('#nicknameDupCheck');
const generalTermDetailBtn = document.querySelector('#generalTermDetail');
const privacyTermDetailBtn = document.querySelector('#privacyTermDetail');
const submitBtn = document.querySelector('#submitBtn');

// 안내문
const userEmailCodeInstructionDiv = document.querySelector('#emailCodeInstruction');
const loginIdDupInstructionDiv = document.querySelector('#loginIdDupInstruction');
const nicknameDupInstructionDiv = document.querySelector('#nicknameDupInstruction');
const emailDupInstructionDiv = document.querySelector('#emailDupInstruction');

// input
const userLoginIdInput = document.querySelector('#userLoginId');
const userEmailInput = document.querySelector('#userEmail');
const userEmailCodeInput = document.querySelector('#userEmailCode');
const userPasswordInput = document.querySelector('#userPassword');
const userPasswordCheckInput = document.querySelector('#userPasswordCheck');
const userNicknameInput = document.querySelector('#userNickname');

// 약관 동의
const allTermAgreementCheckBox = document.querySelector('#allTermAgreement');
const generalTermAgreementCheckBox = document.querySelector('#generalTermAgreement');
const privacyTermAgreementCheckBox = document.querySelector('#privacyTermAgreement');
const emailSubscriptionAgreementCheckBox = document.querySelector('#emailSubscriptionAgreement');


submitBtn.onclick = (e) => {
    const form = e.currentTarget.closest('form');
    form.submit();
}

// 로그인 id 중복검사
loginIdDupCheck.onclick = () => {
    let request = new XMLHttpRequest();
    let userLoginId = userLoginIdInput.value;

    request.onload = () => {
        let isDuplicate = request.responseText;

        // 안내문 기본 빨간색
        loginIdDupInstructionDiv.classList.toggle("text-danger", true);
        loginIdDupInstructionDiv.classList.toggle("text-success", false);

        if (isDuplicate === 'true') {
            loginIdDupInstructionDiv.innerText = '중복되는 아이디입니다.';
        } else if (isDuplicate === 'false') {
            loginIdDupInstructionDiv.innerText = '사용 가능한 아이디입니다.';
            loginIdDupInstructionDiv.classList.toggle("text-danger", false);
            loginIdDupInstructionDiv.classList.toggle("text-success", true);
        } else {
            loginIdDupInstructionDiv.innerText = isDuplicate;
        }
        loginIdDupInstructionDiv.style.display = 'block';
    }

    request.open("GET", '/user/signup/loginIdDupCheck?userLoginId=' + userLoginId);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}

nicknameDupCheckBtn.onclick = () => {
    let request = new XMLHttpRequest();
    let userNickname = userNicknameInput.value;

    request.onload = () => {
        let isDuplicate = request.responseText;

        // 안내문 기본 빨간색
        nicknameDupInstructionDiv.classList.toggle("text-danger", true);
        nicknameDupInstructionDiv.classList.toggle("text-success", false);

        if (isDuplicate === 'true') {
            nicknameDupInstructionDiv.innerText = '중복되는 닉네임입니다.';
        } else if (isDuplicate === 'false') {
            nicknameDupInstructionDiv.innerText = '사용 가능한 닉네임입니다.';
            nicknameDupInstructionDiv.classList.toggle("text-danger", false);
            nicknameDupInstructionDiv.classList.toggle("text-success", true);
        } else {
            nicknameDupInstructionDiv.innerText = isDuplicate;
        }
        nicknameDupInstructionDiv.style.display = 'block';
    }

    request.open("GET", '/user/signup/nicknameDupCheck?userNickname=' + userNickname);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}
