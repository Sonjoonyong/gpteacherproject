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

function toggleBookmarkAjax(btn) {
    let request = new XMLHttpRequest();
    const communityPostId = document.querySelector('#communityPostId').value;
    let bookmark = btn.querySelector('.bookmark');

    request.onload = () => {
        let result = request.response;
        if (result === '0') { // 북마크 해제
            bookmark.classList.toggle('bi-bookmark', true);
            bookmark.classList.toggle('bi-bookmark-fill', false);
        } else if (result === '1') { // 북마크
            bookmark.classList.toggle('bi-bookmark', false);
            bookmark.classList.toggle('bi-bookmark-fill', true);
        } else {
            console.log(result);
            alert("잘못된 접근입니다.");
        }
    }

    request.open("POST", '/community/' + communityPostId + '/bookmark');
    request.send();
}

