function go_save() {
    const form = document.joinForm;

    // 이름 입력 확인
    if (!form.name.value.trim()) {
        alert('이름을 입력하세요.');
        form.name.focus();
        return;
    }
    // 아이디 검증: 6~20자, 영문/숫자만 가능
    const useridRegex = /^[a-zA-Z0-9]{6,20}$/;
    if (!form.userid.value.trim()) {
        alert('아이디를 입력하세요.');
        form.userid.focus();
        return;
    } else if (!useridRegex.test(form.userid.value)) {
        alert('아이디는 6자 이상, 20자 이내의 영문과 숫자만 사용할 수 있습니다.');
        form.userid.focus();
        return;
    }
    // 아이디 중복 검사 확인
    if (!form.reid.value.trim()) {
        alert('아이디 중복 검사를 실행하세요.');
        return;
    }
    // 비밀번호 검증: 8~20자, 영문(대소문자), 숫자, 특수문자 포함
    const pwdRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+|~\-=`{}:";'<>?,./]).{8,20}$/;
    if (!form.pwd.value.trim()) {
        alert('비밀번호를 입력하세요.');
        form.pwd.focus();
        return;
    } else if (!pwdRegex.test(form.pwd.value)) {
        alert('비밀번호는 8자 이상, 20자 이내이며 영문(대/소문자), 숫자, 특수문자를 모두 포함해야 합니다.');
        form.pwd.focus();
        return;
    }
    // 비밀번호 일치 확인
    if (form.pwd.value !== form.pwdCheck.value) {
        alert('비밀번호가 일치하지 않습니다.');
        form.pwdCheck.focus();
        return;
    }
    // 연락처 입력 확인
    if (!form.phone.value.trim()) {
        alert('연락처를 입력하세요.');
        form.phone.focus();
        return;
    }
    // // 우편번호 입력 확인
    // if (!form.zip_num.value.trim()) {
    //     alert('우편번호를 입력하세요.');
    //     return;
    // }
    // // 주소 입력 확인
    // if (!form.sample6_address.value.trim()) {
    //     alert('주소를 입력하세요.');
    //     return;
    // }
    // 모든 검증 통과 후 폼 제출
    form.submit();
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            document.getElementById('zip_num').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;

            document.getElementById("sample6_address").focus();
        }
    }).open();
}

    function go_update() {
        const form = document.joinForm;
        const pwd = form.pwd.value.trim();
        const pwdCheck = form.pwdCheck.value.trim();
            // 비밀번호 유효성 검사
            if (!pwd) {
            alert("비밀번호를 입력하세요.");
            form.pwd.focus();
            return;
        }
            if (pwd.length < 8 || pwd.length > 20) {
            alert("비밀번호는 8자 이상, 20자 이내로 입력해주세요.");
            form.pwd.focus();
            return;
        }
            if (!/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W_]).{8,20}$/.test(pwd)) {
            alert("비밀번호는 영문, 숫자, 특수문자를 포함해야 합니다.");
            form.pwd.focus();
            return;
        }
            // 비밀번호 확인
            if (pwd !== pwdCheck) {
            alert("비밀번호 확인이 일치하지 않습니다.");
            form.pwdCheck.focus();
            return;
        }
            // 폼 제출
            form.submit();
        }


    function withdrawal() {
        // 확인 팝업 띄우기
        if (confirm("정말로 회원을 탈퇴하시겠습니까?")) {
            // "확인"을 누르면 서버로 요청
            location.href = "deleteMember";
        } else {
            // "취소"를 누르면 아무 작업도 하지 않음
            return false;
        }
    }