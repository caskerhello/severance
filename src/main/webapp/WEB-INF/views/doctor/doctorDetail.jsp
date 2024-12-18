<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <title>111</title>
  <link rel="stylesheet" type="text/css" href="css/doctorDetail.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<body>



<section class="about">

  <div class="main">
    <div class="container">
      <img src="doctor_images/${dvo.savefilename}" />
    </div>

    <div class="about-text">
      <h1><div>${dvo.name}</div></h1>
      <div class="sun"></div><br><br>
      <div class="content">${dvo.content}</div>


      <button onclick="location.href='reservationform?dseq=${dvo.dseq}'">진료예약</button>
    </div>
  </div>

  <section class="history">
    <div class="mark">
      <img src="doctor_images/${dvo.univlogo}" />
    </div>

    <div class="profile-text">
      <div>${dvo.bachd}</div><br>
      <div>${dvo.mastd}</div><br>
      <div>${dvo.doctd}</div><br>
      <div>${dvo.resume}</div>
    </div>

  </section>
</section>



</body>

</html>

<%@ include file="../footer.jsp" %>