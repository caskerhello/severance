<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="/css/search_id.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/script/search.js"></script>

<div class="container">
    <div class="container1">
        <div class="form-box">
            <form action="/search_id_page" method="post">
                <h3>아이디 찾기</h3>
                <div class="input-box">
                    <label for="me_name">이름</label>
                    <input type="text" id="me_name" name="me_name" class="form-control" placeholder="홍길동" required/>
                </div>
                <div class="input-box">
                    <label for="me_tel">전화번호</label>
                    <input type="text" id="me_tel" name="me_tel" class="form-control" placeholder="010-1234-5678" required/>
                </div>
                <button type="submit" class="btn btn-primary">Search ID</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
