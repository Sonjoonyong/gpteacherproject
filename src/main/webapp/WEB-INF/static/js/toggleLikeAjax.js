function toggleSentenceLikeAjax(btn) {
    let request = new XMLHttpRequest();
    let sentenceId = btn.closest('.sentence').id.replace('sentence_', '');
    let like = btn.querySelector('.like');

    request.onload = () => {
        let result = request.response;
        setLike(result, like)
    }

    request.open("POST", '/learning/sentences/' + sentenceId + '/like');
    request.send();
}

function toggleLearningLikeAjax(btn) {
    let request = new XMLHttpRequest();
    let learningId = btn.closest('.learning').id.replace('learning_', '');
    let like = btn.querySelector('.like');

    request.onload = () => {
        let result = request.response;
        setLike(result, like)
    }

    request.open("POST", '/learning/' + learningId + '/like');
    request.send();
}


// 커뮤니티 게시글 좋아요
function toggleCommunityPostLikeAjax(btn) {
    const request = new XMLHttpRequest();
    const communityPostId = document.querySelector('#communityPostId').value;
    const like
        = btn.querySelector('.like');

    const likeCountSpan = document.querySelector('#communityPostLikeCount');

    request.onload = () => {
        let result = request.response;
        setLike(result, like);
        if (result === '1') {
            likeCountSpan.innerText++;
        } else if (result === '0') {
            likeCountSpan.innerText--;
        }
    }

    request.open("POST", '/community/' + communityPostId + '/like');
    request.send();
}

function setLike(result, like) {
    if (result === '0') { // 0: 좋아요 해제 완료
        like.classList.toggle('bi-heart', true);
        like.classList.toggle('bi-heart-fill', false);
    } else if (result === '1') { // 1: 좋아요 완료
        like.classList.toggle('bi-heart', false);
        like.classList.toggle('bi-heart-fill', true);
    } else {
        alert("잘못된 접근입니다.");
    }
}