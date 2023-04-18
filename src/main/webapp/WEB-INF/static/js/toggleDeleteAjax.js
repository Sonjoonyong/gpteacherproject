function toggleDeleteAjax(btn) {
    if(confirm("정말로 삭제하시겠습니까?")) {
        let request = new XMLHttpRequest();
        let learningDiv = btn.closest('.learning');
        let learningId = learningDiv.id.replace('learning_', '');

        request.onload = () => {
            learningDiv.remove();
        }

        request.open("POST", '/learning/'+ learningId +'/delete');
        request.send();
    }
}