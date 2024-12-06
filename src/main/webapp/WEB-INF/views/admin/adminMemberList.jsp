<%--
  Created by IntelliJ IDEA.
  User: mysas
  Date: 2024-12-05
  Time: 오전 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="get" name="frm">
  <th class="table-container">
    <th class="table">
      <div class="heading">
        <h2>Admin Member List</h2>
        <div class="search">
          <input type="text" name="search" placeholder="Search here">
          <lavel for="search"><i class="ri-search-line"></i></lavel>
        </div>
      </div>
      <table class="Admin Member List">
        <thead>

        <tr>
          <th>순번</th>
          <th>아이디</th>
          <th>이름</th>
          <th>이메일</th>
          <th>핸드폰번호</th>
          <th>주소</th>
          <th>가입일</th>
        </tr>
        </thead>
        <tbody>

        <c:if test="${empty memberList}">
          <tr>
            <td colspan="7">회원 목록이 없습니다.</td>
          </tr>
        </c:if>

        <!-- Add table data dynamically here -->
        <c:forEach items="${memberList}" var="amemberList">
          <tr>
            <td>${amemberList.mseq}</td>
            <td>${amemberList.userid}</td>
            <td>${amemberList.name}</td>
            <td>${amemberList.email}</td>
            <td>${amemberList.phone}</td>
            <td>${amemberList.address}</td>
            <td></td>
          </tr>
        </c:forEach>

        <div class="row">  <!-- 페이지의 시작 -->
          <div class="col" style="font-size:120%; font-weight:bold;">
            <c:if test="${paging.prev}" >
              <a href="adminMemberList?page=${paging.beginPage-1}">◀</a>&nbsp;
            </c:if>

            <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
              <c:if test="${index!=paging.page}">
                <a href="adminMemberList?page=${index}">${index}</a>&nbsp;
              </c:if>
              <c:if test="${index==paging.page}">
                <span style="color:red">${index}&nbsp;</span>
              </c:if>
            </c:forEach>

            <c:if test="${paging.next}" >
              <a href="adminMemberList&page=${paging.endPage+1}">▶</a>&nbsp;
            </c:if>
          </div>
        </div><!-- 페이지의 끝 -->
        </tbody>
      </table>
</form>
</body>
</html>
