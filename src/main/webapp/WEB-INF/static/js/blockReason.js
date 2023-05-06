function blockReason(form) {
    if (confirm("차단하시겠습니까?")) {
        Swal.fire({
            title: "차단 사유를 입력해주세요",
            input: "text",
            inputAttributes: {
                autocapitalize: "off"
            },
            showCancelButton: true,
            confirmButtonText: "확인",
            cancelButtonText: "취소",
            showLoaderOnConfirm: true,
            preConfirm: (reason) => {
                if (reason) {
                    form.querySelector("#reason").value = reason;
                    return true;
                } else {
                    Swal.showValidationMessage("사유를 입력해주세요");
                    return false;
                }
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                // 확인 버튼을 눌렀을 때
                form.submit();
            }
        });
    } else {
        return false;
    }
    return false;
}