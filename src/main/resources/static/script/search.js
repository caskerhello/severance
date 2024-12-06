function fnSubmit() {

    var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

    if ($("#me_name").val() == null || $("#me_name").val() == "") {
        alert("이름을 입력해주세요.");
        $("#me_name").focus();

        return false;
    }

    if ($("#me_tel").val() == null || $("#me_tel").val() == "") {
        alert("전화번호를 입력해주세요.");
        $("#me_tel").focus();

        return false;
    }

    if(!tel_rule.test($("#me_tel").val())){
        alert("전화번호 형식에 맞게 입력해주세요.");
        return false;
    }

    if (confirm("아이디를 찾으시겠습니까?")) {
        $("#createForm").submit();
        return false;
    }
}