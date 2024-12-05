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
                <h2>Admin Doctor List</h2>
                <div class="search">
                    <input type="text" name="search" placeholder="Search here">
                    <lavel for="search"><i class="ri-search-line"></i></lavel>
                </div>
            </div>
            <table class="Admin Doctor List">
                <thead>

                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>진료과목</th>
                    <th>휴가</th>
                    <th>수정</th>
                </tr>

                <c:if test="${empty doctorList}">
                    <p>의사 목록이 없습니다.</p>
                </c:if>


                <c:forEach items="${doctorList}" var="doctorList1">
                <tr>
                    <th>${doctorList1.dseq}</th>
                    <th>${doctorList1.name}</th>
                    <th>${doctorList1.doctorsection}</th>
                    <th>${doctorList1.daylimit}</th>
<%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>
                </tr>
                </c:forEach>





                <tr>
                    <td colspan="4">
                <jsp:include page="paging/paging.jsp" >
                    <jsp:param value="adminDoctorList" name="address"/>
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
