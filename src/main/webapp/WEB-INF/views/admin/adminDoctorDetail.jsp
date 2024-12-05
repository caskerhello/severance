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
                <h2>Admin Doctor Detail</h2>

<%--                <div class="search">--%>
<%--                    <input type="text" name="search" placeholder="Search here">--%>
<%--                    <lavel for="search"><i class="ri-search-line"></i></lavel>--%>
<%--                </div>--%>
            </div>

            <table class="Admin Doctor Detail">
                <thead>

                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>섹션과</th>
                    <th>휴가</th>
                    <th>특이사항</th>
                </tr>


<%--                <c:foreach from="$doctorList" item="doctor" index="$index">--%>
<%--                    <tr>--%>
<%--                        <th>번호</th>--%>
<%--                        <th>이름</th>--%>
<%--                        <th>섹션과</th>--%>
<%--                        <th>휴가</th>--%>
<%--                        <th>특이사항</th>--%>
<%--                    </tr>--%>
<%--                </c:foreach>--%>
                <input type="button" value="돌아가기">

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
