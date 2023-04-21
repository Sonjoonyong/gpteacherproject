function selectAll(selectAll) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    });
}

function deleteSubmit(btn) {
    let checkList = document.querySelectorAll('input[name="deleteId"]:checked');
    let checkCount = checkList.length;

    if(checkCount == 0) {
        alert("선택된 글이 없습니다.");
        return false;
    }
    let message;
    if (btn.value == "글 삭제") {
        message = "글을 삭제"
    }
    if (btn.value == "댓글 삭제") {
        message = "댓글을 삭제"
    }
    if (btn.value == "북마크 해제") {
        message = "북마크를 해제"
    }
    if(!confirm(checkCount + "개의 "+ message +"하시겠습니까?")) {
        return false;
    }

}