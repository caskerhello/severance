<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/script/search.js"></script>

<link rel="stylesheet" href="/css/search_pwd.css"/>

<section>
    <article>
        <div class="box">
            <h3>비밀번호 찾기</h3>
            <p>회원가입 시 적은 이름과 이메일을 입력하세요 ☺</p>
            <form action="/search_pwd_page" method="post">
                <br />

                <p>이름</p>
                <input type="text" name="name" placeholder="홍길동" required>
                <p>이메일</p>
                <input type="email" name="email" placeholder="abc@naver.com" required>

                <button type="submit" class="btn btn-primary">비밀번호 찾기</button>

                <!-- 에러 메시지 -->
                <c:if test="${not empty error}">
                    <div style="color: red;">
                        <p>${error}</p>
                    </div>
                </c:if>
            </form>
        </div>
    </article>
</section>

<%@ include file="../footer.jsp" %>
