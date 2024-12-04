<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>


<h1>예약 결과</h1>

<div class="mainBox">
    <div class="contentBox">



        <table id="reservationresult">
            <tr>
                <td class="title">예약 의사 성명</td>
                <td class="title">예약 의사 과</td>
                <td class="title">예약자 성명</td>
                <td class="title">예약자 연락처</td>
                <td class="title">예약일자</td>
                <td class="title">예약시간</td>

            </tr>


            <tr>

                <td class="content">${rrvo.doctorname}</td>

                <td class="content">
                    <c:choose>
                        <c:when test="${rvo.doctorsection == 5}">비뇨기과</c:when>
                        <c:when test="${rvo.doctorsection == 4}">산부인과</c:when>
                        <c:when test="${rvo.doctorsection == 3}">외과</c:when>
                        <c:when test="${rvo.doctorsection == 2}">이비인후과</c:when>
                        <c:otherwise>정형외과</c:otherwise>
                    </c:choose>

                </td>

                <td class="content">${rrvo.membername}</td>

                <td class="content">${rrvo.phone}</td>

                <td class="content">${rrvo.bookdate}</td>

                <td class="content">
                <c:choose>
                    <c:when test="${rvo.time == 0}">오전</c:when>
                    <c:otherwise>오후</c:otherwise>
                </c:choose>
                </td>

            </tr>
        </table>





<%--        <div class="resulthead">--%>
<%--            <div>예약 의사 성명</div>--%>
<%--            <div>예약 의사 과</div>--%>
<%--            <div>예약자 성명</div>--%>
<%--            <div>예약자 연락처</div>--%>
<%--            <div>예약일자</div>--%>
<%--            <div>예약시간</div>--%>
<%--        </div>--%>

<%--        <div class="resultcontent">--%>
<%--            <div>${rrvo.doctorname}</div>--%>
<%--            <div>${rrvo.doctorsection}</div>--%>
<%--            <div>${rrvo.membername}</div>--%>
<%--            <div>${rrvo.phone}</div>--%>
<%--            <div>${rrvo.bookdate}</div>--%>
<%--            <div>${rrvo.time}</div>--%>
<%--        </div>--%>



<%--        <div>--%>
<%--            <div>예약 의사 성명 : 1${rrvo.doctorname}</div>--%>
<%--            <div>예약 의사 과 : 1${rrvo.doctorsection}</div>--%>

<%--            <div>예약자 성명 : 1${rrvo.membername}</div>--%>
<%--            <div>예약자 연락처 : 1${rrvo.phone}</div>--%>

<%--            <div>예약일자 : 1${rrvo.bookdate}</div>--%>
<%--            <div>예약시간 : 1${rrvo.time}</div>--%>
<%--        </div>--%>







    </div>
</div>











</main>



<%@ include file="../footer.jsp" %>
