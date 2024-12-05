<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="/css/loginForm.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>


<body>
<div class="container">
    <div class="container1">
        <div class="form-box">
            <form action="login" method="post" name="loginForm">
                <h1>로그인</h1>

                <div class="input-box">

                    <input type="text" name="userid" placeholder="Userid" required value="${dto.userid}"/>
                    <i class='bx bxs-user'></i>
                </div>

                <div class="input-box">
                    <input type="password" name="pwd" placeholder="Password" required/>
                    <i class='bx bxs-lock' ></i>
                </div>
                <div class="forgot-link">
                    <a href="#">아이디 찾기</a>
                </div>
                <button type="submit" class="btn">로그인</button>
                <p>or login with social platforms</p>
                <div class="social-icons">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=7f54d0fdaa5df081339a616842e2b48e&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code">
                        <img src="images/login/kakao.png" style="width: 50px; height: auto;"/>
                        <a href="#"></a>
                        <img src="images/login/google.png" style="width: 50px; height: auto; margin-left: 5px;"/>
                        <a href="#"></a>
                        <img src="images/login/naver.png" style="width: 60px; height: auto;"/>
                </div>

            </form>
        </div>

        <div class="toggle-box">
            <div class="toggle-panel toggle-left">
                <h1>어서오세요, 환영합니다!</h1>
                <p>아직 회원이 아니신가요?</p>
                <button class="btn-register-btn" onclick="location.href='/contract'">회원가입</button>
            </div>
        </div>
    </div>

</div>


</body>

</html>
<%@ include file="../footer.jsp" %>