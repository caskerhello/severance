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

    // 우편번호 입력 확인
    if (!form.zip_num.value.trim()) {
        alert('우편번호를 입력하세요.');
        return;
    }

    // 주소 입력 확인
    if (!form.sample6_address.value.trim()) {
        alert('주소를 입력하세요.');
        return;
    }

    // 모든 검증 통과 후 폼 제출
    form.submit();
}