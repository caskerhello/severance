<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<form method="get" name="frm">
  <div class="table-container">
    <div class="table">
      <div class="heading">
        <h2>Admin Member List</h2>

      </div>
      <table class="Admin Member List">
        <thead>


        <tr>
          <th>번호</th>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>이름</th>
          <th>이메일</th>
          <th>우편번호</th>
          <th>주소</th>
          <th>핸드폰번호</th>
          <th>가입일</th>
          <th>상세설정</th>
        </tr>

        <c:if test="${empty memberList}">
          <p>멤버 목록이 없습니다.</p>
        </c:if>


        <c:forEach items="${memberList}" var="memberList1">
          <tr>
            <th>${memberList1.mseq}</th>
            <th>${memberList1.userid}</th>
            <th>${memberList1.pwd}</th>
            <th>${memberList1.name}</th>
            <th>${memberList1.email}</th>
            <th>${memberList1.zip_num}</th>
            <th>${memberList1.address}</th>
            <th>${memberList1.phone}</th>
            <th>${memberList1.indate}</th>

              <%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>
          </tr>
        </c:forEach>





        <tr>
          <td colspan="4">
            <jsp:include page="paging/paging.jsp" >
              <jsp:param value="adminMemberList" name="address"/>
            </jsp:include>
          </td>
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
