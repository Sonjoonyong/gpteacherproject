function selectAll(selectAll) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    });
}

function deleteSubmit(btn) {
    let checkList = document.querySelectorAll('input[name="deleteId"]:checked');
    let checkCount = checkList.length;

    let form = document.getElementById('myForm');

    if(checkCount == 0) {
        Swal.fire({
            icon: 'warning',
            title: '선택된 글이 없습니다.',
            text: '1개 이상 선택해주세요.'
        });
        return false;
    }
    let message;
    if (btn.value == "글 삭제") {
        message = "글을 삭제";
    }
    if (btn.value == "댓글 삭제") {
        message = "댓글을 삭제";
    }
    if (btn.value == "북마크 해제") {
        message = "북마크를 해제";
    }

    Swal.fire({
        icon: 'question',
        title: checkCount + '개의 '+ message +'하시겠습니까?',
        text: '정말로 삭제하시겠습니까?',

        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소',

        reverseButtons: true // 버튼 순서 거꾸로
    }).then(function(result) {
        if(result.isConfirmed) {
            form.submit();
        }
    });
}