const sendEmailCodeBtn = document.querySelector('#sendEmailCode');
const validateEmailCodeBtn = document.querySelector('#validateEmailCode');
const idDupCheckBtn = document.querySelector('#idDupCheck');
const nicknameDupCheckBtn = document.querySelector('#nicknameDupCheck');
const allTermAgreementCheckBox = document.querySelector('#allTermAgreement');
const generalTermAgreementCheckBox = document.querySelector('#generalTermAgreement');
const privacyTermAgreementCheckBox = document.querySelector('#privacyTermAgreement');
const emailSubscriptionAgreementCheckBox = document.querySelector('#emailSubscriptionAgreement');
const generalTermDetailBtn = document.querySelector('#generalTermDetail');
const privacyTermDetailBtn = document.querySelector('#privacyTermDetail');
const submitBtn = document.querySelector('#submitBtn');

submitBtn.onclick = (e) => {
    const form = e.currentTarget.closest('form');
    form.submit();
}
