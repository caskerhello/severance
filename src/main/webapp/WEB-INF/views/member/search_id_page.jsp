<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/script/search.js"></script>

<link rel="stylesheet" href="/css/search_id_page.css"/>

<section>
    <article>
        <div class="box">
            <h1>아이디 찾기 결과</h1>
            <br />
            <c:choose>
                <c:when test="${not empty MemberVO}">
                    <p>찾으신 아이디: ${MemberVO.me_id}</p>
                </c:when>
                <c:otherwise>
                    <p>${msg}</p>
                </c:otherwise>
            </c:choose>
            <br>
            <a href="/search_id" class="btn btn-primary">다시 검색</a>
            <hr />
            <a href="/search_pwd" class="btn btn-primary">비밀번호 찾기</a>
            <hr />
            <a href="/loginForm" class="btn btn-primary">로그인</a>
        </div>
    </article>
</section>

<%@ include file="../footer.jsp" %>
