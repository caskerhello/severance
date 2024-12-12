<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
	<link rel="stylesheet" href="/css/reservationResult.css"/>
</head>


<body>



        <div class="container">
            <div class="header5">

            <div class="container5">
                <section class="center5">
                    <div class="center-text5">
                        <h1>
                            <span class="part3">공감,</span>
                            <span class="part4">또 하나의 치료</span>
                        </h1>

                        <p>질병 치료를 넘어 환자의 마음까지 치유하겠습니다.</p>
                    </div>
                </section>
            </div>

         <main class="table">
             <section class="table_header">

                <h1>예약 결과</h1>

             </section>


             <section class="table_body">
                 <div class="mypagerow3">
                     <div class="coltitle">예약 의사명</div>
                     <div class="coltitle">예약 병원과</div>
                     <div class="coltitle">예약자 성명</div>
                     <div class="coltitle">예약자 연락처</div>
                     <div class="coltitle">예약 날짜</div>
                     <div class="coltitle">예약 시간</div>
                 </div>
             </section>

             <div class="list">


							<div class="mypagerow4">
								<div class="col">${rrvo.doctorname}</div>


								<div class="col">
									<c:choose>
										<c:when test="${rrvo.doctorsection == 5}">비뇨기과</c:when>
                                        <c:when test="${rrvo.doctorsection == 4}">산부인과</c:when>
                                        <c:when test="${rrvo.doctorsection == 3}">외과</c:when>
                                        <c:when test="${rrvo.doctorsection == 2}">이비인후과</c:when>
                                        <c:otherwise>정형외과</c:otherwise>
									</c:choose>

								</div>


								<div class="col">${rrvo.membername}</div>
								<div class="col">${rrvo.phone}</div>
								<div class="col">${rrvo.bookdate}</div>

								<div class="col">
									<c:choose>
										<c:when test="${rrvo.time == 0}">오전</c:when>
                                        <c:otherwise>오후</c:otherwise>
									</c:choose>
								</div>
                            </div>

	                </div>
                </main>
            </div>
</div>

</body>

</html>


<%@ include file="../footer.jsp" %>
