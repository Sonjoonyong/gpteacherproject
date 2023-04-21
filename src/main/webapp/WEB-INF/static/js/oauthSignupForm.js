// 안내문
const nicknameMsgDiv = document.querySelector('#nicknameMsg');

// input
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

// 회원 가입 버튼
document.querySelector('#submitBtn').onclick = (e) => {
    const form = e.currentTarget.closest('form');
    form.submit();
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
