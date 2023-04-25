// 버튼
const sendNewPw = document.querySelector('#sendNewPw');
const gotoIdsearchBtn = document.querySelector('#gotoIdsearchBtn');
const gotoLoginBtn = document.querySelector('#gotoLoginBtn');


// 메시지 창
const userPasswordMsgDiv = document.querySelector('#userPasswordMsg');

// input
const emailInput = document.querySelector('#userEmail');
const loginIdInput = document.querySelector('#userLoginId');

// 인증
sendNewPw.onclick = () => {
    const request = new XMLHttpRequest();
    const userLoginId = loginIdInput.value;
    const userEmail = emailInput.value;
    sendNewPw.disabled = true;

    let queryParam = new URLSearchParams();
    queryParam.append("userLoginId", userLoginId);
    queryParam.append("userEmail", userEmail);

    request.onload = () => {
        // result:true - 재발급 성공, false - 실패
        console.log(request.responseText);
        const responseJson = JSON.parse(request.responseText);

        if (responseJson.result === true) {
            emailInput.disabled = true;
            loginIdInput.disabled = true;
            sendNewPw.disabled = true;
            userPasswordMsgDiv.classList.toggle("text-danger", false);
            userPasswordMsgDiv.innerText = "이메일로 비밀번호가 재발급되었습니다.";
            gotoIdsearchBtn.style.display = 'none';
            gotoLoginBtn.style.display = 'block';
        } else {
            userPasswordMsgDiv.innerText = responseJson.errorMsg;
            userPasswordMsgDiv.classList.toggle("text-danger", true);
            sendNewPw.disabled = false;
        }
    }

    request.open("POST", '/user/pwsearch?' + queryParam.toString());
    request.setRequestHeader("Accept", "application/json; charset=utf-8")
    request.send();
}
