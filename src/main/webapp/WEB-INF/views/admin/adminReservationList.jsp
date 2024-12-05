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
                <h2>Admin Reservation List</h2>
                <div class="search">
                    <input type="text" name="search" placeholder="Search here">
                    <lavel for="search"><i class="ri-search-line"></i></lavel>
                </div>
            </div>
            <table class="Admin Reservation List">
                <thead>

                <tr>
                    <th>번호</th>
                    <th>접수일</th>
                    <th>결과</th>
                    <th>예약일</th>
                    <th>예약시간</th>
                    <th>수정</th>
                </tr>

                <c:if test="${empty reservationList}">
                    <p>예약 목록이 없습니다.</p>
                </c:if>


                <c:forEach items="${reservationList}" var="reservationList1">
                    <tr>
                        <th>${reservationList1.rseq}</th>
                        <th>${reservationList1.indate}</th>
                        <th>${reservationList1.result}</th>
                        <th>${reservationList1.bookdate}</th>
                        <th>${reservationList1.time}</th>
                            <%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>
                    </tr>
                </c:forEach>





                <tr>
                    <td colspan="4">
                        <jsp:include page="paging/paging.jsp" >
                            <jsp:param value="adminReservationList" name="address"/>
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
