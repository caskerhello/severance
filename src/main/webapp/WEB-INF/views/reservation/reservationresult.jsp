<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>
    <div class="section-hospital">
        <div class="container">
            <div class="hospital-link">
                <div class="track">
                    <a class="link link1" href="#" title="새창">
                        <span class="text">내 과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link2" href="#" title="새창">
                        <span class="text">외 과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link3" href="#" title="새창">
                        <span class="text">이비인후과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link4" href="#" title="새창">
                        <span class="text">소아과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link5" href="#" title="새창">
                        <span class="text">정형외과</span>
                        <i class='bx bx-link-external'></i>
                    </a>
                </div>
            </div>

            <h1>예약 결과</h1>

            <div>
                <div>예약 의사 성명 : ${rrvo.doctorname}</div>
                <div>예약 의사 과 : ${rrvo.doctorsection}</div>

                <div>예약자 성명 : ${rrvo.membername}</div>
                <div>예약자 연락처 : ${rrvo.phone}</div>

                <div>예약일자 : ${rrvo.bookdate}</div>
                <div>예약시간 : ${rrvo.time}</div>
            </div>







        </div>
    </div>











</main>



<%@ include file="../footer.jsp" %>
