<%--
  Created by IntelliJ IDEA.
  User: mysas
  Date: 2024-12-05
  Time: 오전 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
           <th>번호</th>
          <th>이름</th>
          <th>섹션과</th>
          <th>휴가</th>
          <th>특이사항</th>
        </tr>
        </thead>
        <tbody>
        <!-- Add table data dynamically here -->
        </tbody>
      </table>
    </div>
  </div>
</form>

</body>
</html>
