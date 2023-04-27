function toggleStorageAjax(btn) {
    let request = new XMLHttpRequest();
    let sentenceId = btn.closest('.sentence').id.replace('sentence_', '');
    let storage = btn.querySelector('.storage');

    request.onload = () => {
        let result = request.response;
        if (result === '0') {
            storage.classList.toggle('bi-archive', true);
            storage.classList.toggle('bi-archive-fill', false);
        } else if (result === '1') {
            storage.classList.toggle('bi-archive', false);
            storage.classList.toggle('bi-archive-fill', true);
        } else {
            alert("존재하지 않는 문장입니다.");
        }
    }

    request.open("POST", '/learning/sentences/'+ sentenceId +'/flashcard');
    request.send();
}
