const body = document.querySelector('body');

const addSentenceBtn = document.querySelector('#addSentence');
const sentenceModal = document.querySelector('#sentenceModal');
const sentenceModalBody = document.querySelector('#sentenceModalBody');
const sentenceModalCloseBtn = document.querySelector('#sentenceModalClose');

let pageNum = 1;
const sentenceBoxDiv = document.querySelector('#sentenceBox');
const scrollFooter = document.querySelector('#scrollFooter');
const sentenceHolderDiv = document.querySelector('#sentenceHolder');

addSentenceBtn.onclick = () => {
    toggleSentenceModal(true);
    resetSentenceBoxDiv();
};

sentenceModalCloseBtn.onclick = () => {
    toggleSentenceModal(false);
    pageNum = 1;
}

function toggleSentenceModal(boolean) {
    sentenceModal.classList.toggle("show", boolean);
    sentenceModalBody.scrollTop = 0;
    // 모달에 따른 body 스크롤 설정
    boolean && (body.style.overflow = 'hidden');
    boolean || (body.style.overflow = 'scroll');
}

const learningTypeInput = document.querySelector('#learningType');
const likeCheckInput = document.querySelector('#likeCheck');
const sortTypeInput = document.querySelector('#sortType');
/**
 * 페이징
 */
learningTypeInput.onchange = () => {
    resetSentenceBoxDiv();
}
likeCheckInput.onclick = () => {
    resetSentenceBoxDiv();
}
sortTypeInput.onchange = () => {
    resetSentenceBoxDiv();
}

function load() {
    scrollFooter.style.display = 'none';
    const request = new XMLHttpRequest();
    const params = new URLSearchParams();

    let latest;
    if (sortTypeInput.value === 'id_desc') {
        latest = true;
    } else {
        latest = false;
    }

    request.onload = () => {
        const sentences = JSON.parse(request.response);

        // 첫 로딩에 조건에 해당하는 문장이 없을 경우
        if (pageNum === 1 && sentences.length === 0) {
            console.log('조건에 해당하는 문장이 없음');
            sentenceBoxDiv.innerHTML = '';
            const placeholder = document.getElementsByTagName('template')[1]
                .content.cloneNode(true).firstElementChild;
            sentenceBoxDiv.append(placeholder);
            scrollFooter.style.display = 'none';
            return false;
        }

        // 더이상 불러올 문장이 없을 경우
        if (sentences.length === 0) {
            console.log('더이상 불러올 문장이 없습니다');
            scrollFooter.style.display = 'none';
            return false;
        }

        for (const sentence of sentences) {
            // console.log(sentence);
            const sentenceDiv = document.getElementsByTagName('template')[0]
                .content.cloneNode(true).firstElementChild;
            sentenceDiv.querySelector('.communityPostSentenceId').value = sentence.id;
            sentenceDiv.querySelector('.yourSentence').innerText = sentence.sentenceAnswer;
            sentenceDiv.querySelector('.correctedSentence').innerText = sentence.sentenceCorrected;
            sentenceDiv.querySelector('.explanation').innerText = sentence.sentenceExplanation;
            sentenceBoxDiv.append(sentenceDiv);
        }

        pageNum++;
        sentenceBoxDiv.append(scrollFooter);
        scrollFooter.style.display = 'block';

    }

    params.append("pageNum", pageNum.toString());
    params.append("learningType", learningTypeInput.value);
    params.append("liked", likeCheckInput.checked);
    params.append("latest", latest);

    request.open("get", "/learning/sentences/select?" + params.toString());
    request.setRequestHeader("Accept", "application/json; charset=utf-8")
    request.send();
}

function resetSentenceBoxDiv() {
    pageNum = 1;
    body.append(scrollFooter); // sentenceBoxDiv를 청소하기 전 scrollFooter를 잠시 대피시킴
    sentenceBoxDiv.innerHTML = '';
    sentenceBoxDiv.append(scrollFooter);
    scrollFooter.style.display = 'block';
}

/**
 * 무한 스크롤
 */
const intersectionObserver = new IntersectionObserver((entries) => {
    if (entries[0].intersectionRatio <= 0) return;
    console.log('Loaded new items');
    load();
});
// start observing
intersectionObserver.observe(scrollFooter);

/**
 * 본문에 첨부
 */
sentenceBoxDiv.onclick = (e) => {
    const sentence = e.target.closest('.sentence');
    if (sentence !== null) {
        console.log(sentence.id);
        sentenceHolderDiv.innerHTML = '';
        sentenceHolderDiv.append(sentence);
        toggleSentenceModal(false);
    }
};

sentenceHolderDiv.onclick = (e) => {
    const sentence = e.target.closest('.sentence');
    if (sentence !== null) {
        Swal.fire({
            text: '첨부를 취소할까요?',
            showCancelButton: true,
            confirmButtonText: '네',
            cancelButtonText: '아니요',
        }).then(function(result) {
            if(result.isConfirmed) {
                sentenceHolderDiv.innerHTML = '';
            }
        });
    }
};