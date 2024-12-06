<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="/css/search_id.css"/>

<section>
    <article>
        <h3>아이디 찾기 결과</h3>
        <c:choose>
            <c:when test="${not empty MemberVO}">
                <p>찾으신 아이디: ${MemberVO.me_id}</p>
            </c:when>
            <c:otherwise>
                <p>${msg}</p>
            </c:otherwise>
        </c:choose>
        <a href="/search_id" class="btn btn-primary">다시 검색</a>
    </article>
</section>

<%@ include file="../footer.jsp" %>
