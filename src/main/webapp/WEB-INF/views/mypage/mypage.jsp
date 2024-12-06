<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<html>
<head>
	<link rel="stylesheet" href="/css/mypage.css"/>
</head>


<body>
<div class="container">
 <main class="table">
	 <section class="table_header">

		<h1>My Page</h1>

		<nav class="sub_menu">
			<div><a href="mypage">예약관리</a></div>
			<div><a href="updateMemberForm">회원정보 수정</a></div>
			<div><a href="deleteMember" onclick="withdrawal();">회원탈퇴</a></div>
		</nav>

	 </section>

	 <c:choose>
				<c:when test="${reserveList.size()==0}">
					<h3>예약 내역이 없습니다</h3>
				</c:when>

<c:otherwise>
	 <section class="table_body">
		 <div class="mypagerow">
			 <div class="coltitle">예약번호</div>
			 <div class="coltitle">예약자 성명</div>
			 <div class="coltitle">예약일</div>
			 <div class="coltitle">예약시간</div>
			 <div class="coltitle">의사성명</div>
			 <div class="coltitle">진료과</div>
			 <div class="coltitle">처리상태</div>
		 </div>
	 </section>

	 <div class="list">
		<c:forEach items="${reserveList}" var="rvo">
							<div class="mypagerow">
								<div class="col">${rvo.rseq}</div>
								<div class="col">${rvo.membername}</div>
								<div class="col">${rvo.bookdate}</div>

								<div class="col">
									<c:choose>
										<c:when test="${rvo.time == 0}">오전</c:when>
										<c:otherwise>오후</c:otherwise>
									</c:choose>

								</div>


								<div class="col">${rvo.doctorname}</div>

								<div class="col">
									<c:choose>
										<c:when test="${rvo.doctorsection == 5}">비뇨기과</c:when>
										<c:when test="${rvo.doctorsection == 4}">산부인과</c:when>
										<c:when test="${rvo.doctorsection == 3}">외과</c:when>
										<c:when test="${rvo.doctorsection == 2}">이비인후과</c:when>
										<c:otherwise>정형외과</c:otherwise>
									</c:choose>
								</div>


								<div class="col">
									<c:choose>
										<c:when test="${rvo.result == 4}">진료 완료</c:when>
										<c:when test="${rvo.result == 3}">예약 완료</c:when>

										<c:when test="${rvo.result == 2}">예약 접수 완료<div><input type="button" class="cancel-button" value="예약취소" onclick="cancelreservation(${rvo.rseq})"/></div></c:when>
										<c:otherwise>예약 접수 중<div><input type="button" class="cancel-button" value="예약취소" onclick="cancelreservation(${rvo.rseq})"/></div></c:otherwise>
									</c:choose>
								</div>

							</div>
						</c:forEach>
		       </c:otherwise>
		 </c:choose>

	 </div>
 </main>
</div>

</body>

</html>
<%@ include file="../footer.jsp" %>