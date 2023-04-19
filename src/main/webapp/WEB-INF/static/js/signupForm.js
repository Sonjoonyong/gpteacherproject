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
const idDupInstructionDiv = document.querySelector('#idDupInstruction');
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
        console.log(isDuplicate);

        // 안내문 기본 빨간색
        idDupInstructionDiv.classList.toggle("text-danger", true);
        idDupInstructionDiv.classList.toggle("text-success", false);

        if (isDuplicate === 'true') {
            idDupInstructionDiv.innerText = '중복되는 아이디입니다.';
        } else if (isDuplicate === 'false') {
            idDupInstructionDiv.innerText = '사용 가능한 아이디입니다.';
            idDupInstructionDiv.classList.toggle("text-danger", false);
            idDupInstructionDiv.classList.toggle("text-success", true);
        } else {
            idDupInstructionDiv.innerText = isDuplicate;
        }
        idDupInstructionDiv.style.display = 'block';
    }
    request.open("GET", '/user/signup/loginIdDupCheck?userLoginId=' + userLoginId);
    request.setRequestHeader("Accept", "text/plain; charset=utf-8")
    request.send();
}
