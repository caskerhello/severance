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
  <div class="table-container">
    <div class="table">
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
          <th>아이디</th>
          <th>이름</th>
          <th>주소</th>
          <th>이메일</th>
          <th>핸드폰번호</th>
        </tr>
        </thead>
        <tbody>
        <!-- Add table data dynamically here -->
        <c:forEach items="${memberList}" var="memberVO">
          <div class="row">
            <div class="col">${memberVO.userid} </div>
            <div class="col">${memberVO.name} </div>
            <div class="col">${memberVO.address} </div>
            <div class="col">${memberVO.email} </div>
            <div class="col">${memberVO.phone} </div>
          </div>
        </c:forEach>
        </tbody>
      </table>
    </div>
    </div>
  </div>
</form>
</body>
</html>
