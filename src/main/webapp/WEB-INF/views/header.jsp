<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="/css/header_footer.css"/>
  <link rel="stylesheet" href="/css/main.css"/>

    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <!-- 박스 아이콘 링크 -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- 리믹스 아이콘 링크 -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>

  <!-- 구글 폰트 링크 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

</head>
<body>

<header>
    <div class="logo-container">
        <a href="/" class="logo"><img src="/images/logo.png"></a>
        <a href="#" class="logo-text">하이미디어 병원</a>
    </div>

    <input type="checkbox" id="menu-toggle" class="menu-checkbox" />
    <label for="menu-toggle" class="menu-icon">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </label>

    <ul class="navlist">
      <li><a href="#">의료진</a></li>
      <li><a href="#">진료 예약</a></li>
      <li><a href="updateMemberForm">마이페이지</a></li>
      <li><a href="#">고객센터</a></li>
    </ul>

    <div class="nav-content">
        <c:choose>
            <c:when test="${empty loginUser}">
                  <a href="loginForm"><i class="ri-user-line"></i></a> <!--로그인, 로그아웃-->
                  <a href="/contract"><i class="ri-draft-line"></i></a> <!--회원가입-->
            </c:when>
            <c:otherwise>
			    <label> 환영합니다. ${loginUser.name}(${loginUser.userid}) 님 </label>
                <a href="logout"><i class="ri-user-line"></i></a> <!--로그인, 로그아웃-->
            </c:otherwise>
        </c:choose>
      <div class="bx bx-menu" id="menu-icon"></div>
    </div>

</header>

<!-- 가운데 -->
<div class="container">
<section class="center">
    <div class="center-text">
        <h1>
            <span class="part1">공감,</span>
            <span class="part2">또 하나의 치료</span>
        </h1>
        <h2>질병 치료를 넘어 환자의 마음까지 치유하겠습니다.</h2>
    </div>
</section>
    <script type="text/javascript">
        $(function(){
            $('#idCheckButton').click(function(){

                const useridInput = $('#userid');
                const userid = useridInput.val().trim();

                const useridRegex = /^[a-zA-Z0-9]{6,20}$/;
                if (!useridRegex.test(userid)) {
                    alert('아이디는 6자 이상, 20자 이내의 영문과 숫자만 사용할 수 있습니다.');
                    useridInput.val('');
                    useridInput.focus();
                    return;
                }

                var formselect = $('#joinFrm')[0];
                var formdata = new FormData( formselect );
                $.ajax({
                    url:"<%=request.getContextPath()%>/idcheck",
                    type:"POST",
                    async: false,
                    data: formdata,
                    timeout: 10000,
                    contentType : false,
                    processData : false,

                    success:function(data){
                        if( data.idmessage == '1'){
                            $('#idmessage').html("&nbsp;&nbsp;<span style='color:blue' >사용 가능합니다</span>");
                            $('#reid').val(data.userid);
                        }else{
                            $('#idmessage').html("&nbsp;&nbsp;<span style='color:red' >사용중인 아이디입니다</span>");
                            $('#reid').val("");
                        }
                    },
                    error:function(){
                        alert("중복 조회 실패");
                    },
                });
            });
            $('#pwd').on('blur', function () {
                const pwdInput = $('#pwd');
                const pwd = pwdInput.val().trim();

                const pwdRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+|~\-=`{}:";'<>?,./]).{8,20}$/;

                if (!pwdRegex.test(pwd)) {
                    $('#pwdmessage').html("<span style='color:red'>비밀번호는 8자 이상, 20자 이내이며 영문, 숫자, 특수문자를 포함해야 합니다.</span>");
                } else {
                    $('#pwdmessage').html("<span style='color:blue'>사용 가능한 비밀번호입니다.</span>");
                }
            });
        });
    </script>
</div>
</body>
</html>
