<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="/css/header_footer.css"/>
  <link rel="stylesheet" href="/css/main.css"/>
    <link rel="stylesheet" href="/css/reservation.css"/>
  <link rel="stylesheet" href="/css/qna.css"/>

    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <!-- 박스 아이콘 링크 -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- 리믹스 아이콘 링크 -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>

  <!-- 구글 폰트 링크 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

  <!-- Script -->
<script src="/script/qna.js"></script>
<script src="/script/mypage.js"></script>
<script src="/script/member.js"></script>

</head>
<body>

<header>
    <div class="logo-container">
        <a href="/" class="logo"><img src="/images/logo.png"></a>
        <a href="/" class="logo-text">하이미디어 병원</a>
    </div>

    <input type="checkbox" id="menu-toggle" class="menu-checkbox" />
    <label for="menu-toggle" class="menu-icon">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </label>

    <ul class="navlist">
<%--      <li><a href="#">의료진</a></li>--%>
      <li><a href="beforereservation">진료 예약</a></li>

      <li><a href="mypage?first=y">마이페이지</a></li>
      <li><a href="qnaList?first=y">고객센터</a></li>



    </ul>

    <div class="nav-content">
        <c:choose>
            <c:when test="${empty loginUser}">
                  <a href="loginForm">
                  <i class="ri-user-line"></i>
                  <span class="tooltip left">로그인</span>
                  </a> <!--로그인, 로그아웃-->

                  <a href="/contract">
                  <i class="ri-draft-line"></i>
                  <span class="tooltip right">회원가입</span>
                  </a> <!--회원가입-->
            </c:when>
            <c:otherwise>
			    <label> 환영합니다. ${loginUser.name}(${loginUser.userid}) 님 </label>
                <a href="logout"><i class="ri-logout-box-r-line"></i><span class="tooltip right">로그아웃</span></a> <!--로그인, 로그아웃-->
            </c:otherwise>
        </c:choose>
      <div class="bx bx-menu" id="menu-icon"></div>
    </div>

</header>

</div>
</body>
</html>
