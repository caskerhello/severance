
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/memberList.css">
</head>
<body>
<form method="get" name="frm">
    <div class="table-container">
        <div class="table">
            <div class="heading">
                <h2>Member List</h2>
                <div class="search">
                    <input type="text" name="search" placeholder="Search here">
                    <lavel for="search"><i class="ri-search-line"></i></lavel>
                </div>
            </div>
            <table class="memberList">
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
