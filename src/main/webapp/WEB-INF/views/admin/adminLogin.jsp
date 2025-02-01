<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/adminLogin.css">

    <!-- 리믹스 아이콘 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
</head>
<body>
    <div class="box">
        <i class="ri-account-circle-fill"
<%--           id="main-img"--%>
           style="color: #275DE8;
           position: absolute;
            top: -70px;
            left: calc(48% - 50px);
            display: flex;
            font-size: 120px;
"
        ></i>
<%--        <img src="images/admin.png" class="main-img" style="color: #1a4db2"/>--%>
        <h1>Admin Login</h1>
        <form method="post"  action="adminLogin">
            <p>Admin id</p>
            <input type="text" name="adminid" placeholder="id"/>
            <p>Password</p>
            <input type="password" name="pwd" placeholder="Password"/>

            <input type="submit" value="Login"/>

    <div style="font-size:80%; font-weight:bold">${message}</div>

        </form>
    </div>
</body>
</html>
