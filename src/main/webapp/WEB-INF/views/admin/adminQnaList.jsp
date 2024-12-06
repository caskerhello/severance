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
        <h2>Admin Qna List</h2>

      </div>
      <table class="Admin Qna List">
        <thead>


        <tr>
          <th>번호</th>
          <th>아이디</th>
          <th>제목</th>
<%--          <th>내용</th>--%>
          <th>답변</th>
          <th>등록일</th>
          <th>상세설정</th>
        </tr>

        <c:if test="${empty qnaList}">
          <p>Qna 목록이 없습니다.</p>
        </c:if>


        <c:forEach items="${qnaList}" var="qnaList1">
          <tr>
            <th>${qnaList1.qseq}</th>
            <th>${qnaList1.userid}</th>
            <th>${qnaList1.subject}</th>
<%--&lt;%&ndash;            <th>${qnaList1.content}</th>&ndash;%&gt;--%>
            <th>
              <c:choose>
                <c:when test="${qnaList1.reply == null}">미답변</c:when>
                <c:otherwise>답변완료</c:otherwise>
              </c:choose></th>
<%--                ${qnaList1.reply}--%>
            <th>${qnaList1.indate}</th>
              <%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>
          </tr>
        </c:forEach>





        <tr>
          <td colspan="4">
            <jsp:include page="paging/paging.jsp" >
              <jsp:param value="adminQnaList" name="address"/>
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
