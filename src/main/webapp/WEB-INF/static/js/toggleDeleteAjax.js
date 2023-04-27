function toggleSentenceDeleteAjax(btn) {
    Swal.fire({
        icon: 'question',
        title: '정말로 삭제하시겠습니까?',
        text: '복구할 수 없습니다.',

        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소',

        reverseButtons: true, // 버튼 순서 거꾸로
    }).then(function(result) {
        if(result.isConfirmed) {
            let request = new XMLHttpRequest();
            let sentenceIdDiv = btn.closest('.sentence');
            let sentenceId = sentenceIdDiv.id.replace('sentence_', '');
            console.log(sentenceId);
            request.onload = () => {
                sentenceIdDiv.remove();
            }

            request.open("POST", '/learning/sentence/'+ sentenceId +'/delete');
            request.send();
        }
    });
    // if(confirm("정말로 삭제하시겠습니까?")) {
    //     let request = new XMLHttpRequest();
    //     let sentenceIdDiv = btn.closest('.sentence');
    //     let sentenceId = sentenceIdDiv.id.replace('sentence_', '');
    //     console.log(sentenceId);
    //     request.onload = () => {
    //         sentenceIdDiv.remove();
    //     }
    //
    //     request.open("POST", '/learning/sentence/'+ sentenceId +'/delete');
    //     request.send();
    // }
}

function toggleLearningDeleteAjax(btn) {
    Swal.fire({
        icon: 'question',
        title: '정말로 삭제하시겠습니까?',
        text: '관련 문장도 함께 삭제됩니다.',

        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소',

        reverseButtons: true, // 버튼 순서 거꾸로
    }).then(function(result) {
        if (result.isConfirmed) {
            let request = new XMLHttpRequest();
            let learningDiv = btn.closest('.learning');
            let learningId = learningDiv.id.replace('learning_', '');

            request.onload = () => {
                learningDiv.remove();
            }

            request.open("POST", '/learning/' + learningId + '/delete');
            request.send();
        }
    });
    // if(confirm("정말로 삭제하시겠습니까?")) {
    //     let request = new XMLHttpRequest();
    //     let learningDiv = btn.closest('.learning');
    //     let learningId = learningDiv.id.replace('learning_', '');
    //
    //     request.onload = () => {
    //         learningDiv.remove();
    //     }
    //
    //     request.open("POST", '/learning/'+ learningId +'/delete');
    //     request.send();
    // }
}