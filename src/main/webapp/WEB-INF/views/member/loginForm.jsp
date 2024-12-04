<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="/css/header_footer.css"/>
<link rel="stylesheet" href="/css/main.css"/>
<link rel="stylesheet" href="/css/loginForm.css"/>

<section>
    <article>
        <form method="post" action="login" name="loginForm">
            <h2>LogIn</h2>
            <div class="field">
                <label>User ID</label><input name="userid" type="text" value="${dto.userid}" />
            </div>
            <div class="field">
                <label>Password</label><input name="pwd" type="password" >
            </div>
            <div class="btn">
                <input type="submit" value="LOGIN">
                <input type="button" value="JOIN" onclick="location.href='/contract'" >
                <input type="button" value="FIND ID" onclick="" >
            </div>
            <div class="btn">
                <input type="button" value="KaKao" style="background: yellow; color:black"
                       onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=7f54d0fdaa5df081339a616842e2b48e&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
                <input type="button" value="Naver" style="background: green" onclick="" >
                <input type="button" value="Google" style="background: red" onclick="" >
            </div>
            <div style="font-size:80%; font-weight:bold">${message} </div>

        </form>
    </article>

</section>

<%@ include file="../footer.jsp" %>