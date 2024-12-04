<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/adminLogin.css">
</head>
<body>
    <div class="box">
        <img src="images/admin.png" class="main-img"/>
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
