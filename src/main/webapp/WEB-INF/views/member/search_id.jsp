<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/script/search.js"></script>

<link rel="stylesheet" href="/css/search_id.css"/>

<section>
    <article>
        <div class="box">
            <h1>아이디 찾기</h1>
            <p>회원가입 시 작성한 이름과 핸드폰번호를 입력하세요 ☺</p>
            <form action="/search_id_page" method="post">
                <br />

                <p for="me_name">이름</p>
                <input type="text" id="me_name" name="me_name" class="form-control" placeholder="홍길동" required/>

                <p for="me_tel">핸드폰번호</p>
                <input type="text" id="me_tel" name="me_tel" class="form-control" placeholder="010-1234-5678" required/>

                <hr />
                <button type="submit" class="btn btn-primary">아이디 찾기</button>
            </form>
        </div>
    </article>
</section>

<%@ include file="../footer.jsp" %>
