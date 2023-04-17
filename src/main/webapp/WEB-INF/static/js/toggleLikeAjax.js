function toggleLikeAjax(btn) {
    let request = new XMLHttpRequest();
    let sentenceId = btn.closest('.sentence').id.replace('sentence_', '');
    let like = btn.querySelector('.like');

    request.onload = () => {
        let result = request.response;
        if (result === '0') {
            like.classList.toggle('bi-heart', true);
            like.classList.toggle('bi-heart-fill', false);
        } else if (result === '1') {
            like.classList.toggle('bi-heart', false);
            like.classList.toggle('bi-heart-fill', true);
        } else {
            alert("존재하지 않는 문장입니다.");
        }
    }

    request.open("POST", '/learning/sentences/'+ sentenceId +'/like');
    request.send();
}