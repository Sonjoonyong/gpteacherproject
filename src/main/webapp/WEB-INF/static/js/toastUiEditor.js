const contentInput = document.querySelector('#communityPostContent');

const Editor = toastui.Editor;
const editor = new Editor({
    el: document.querySelector('#editor'),
    height: '500px',
    initialEditType: 'wysiwyg',
    // initialValue: contentInput.value, // 적용 안 됨. 원인 불명
    language: "ko-KR"
});
editor.setHTML(contentInput.value);

document.querySelector('#submitBtn').onclick = (e) => {
    const form = e.currentTarget.closest('form');
    const contentInput = form.querySelector('#communityPostContent');
    contentInput.value = editor.getHTML();

    if (validatePost(form)) {
        form.submit();
    }
};

// form 유효성 검증
function validatePost(form) {
    let content = stripHtml(form.querySelector('#communityPostContent').value);
    let title = stripHtml(form.querySelector('#communityPostTitle').value);
    if (title === '') {
        Swal.fire('제목을 입력해주세요');
        return false;
    } else if (content === '') {
        Swal.fire('내용을 입력해주세요');
        return false;
    }

    return true;
}

function stripHtml(str) {
    return str.replace(/<\/?[^>]+(>|$)/g, "").trim();
}
