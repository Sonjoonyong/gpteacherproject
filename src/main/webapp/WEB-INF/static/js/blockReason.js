function blockReason(form) {
    if(confirm('차단하시겠습니까?')) {
        let reason = prompt('차단 사유를 입력해 주세요.');

        if(reason != null) { //취소가 아닐 경우
            form.querySelector('#reason').value = reason;
            return true;
        } else{
            return false;
        }
    } else{
        return false;
    }
}