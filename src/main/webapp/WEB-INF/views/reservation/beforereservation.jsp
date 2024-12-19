<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



    <div class="section-hospital">
    <div class="container">
        <div class="hospital-link">
            <div class="track">
                <a class="link link1" href="beforedoctorsection?doctorsection=1" title="새창">
                    <span class="text">정형외과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link2" href="beforedoctorsection?doctorsection=2" title="새창">
                    <span class="text">이비인후과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link3" href="beforedoctorsection?doctorsection=3" title="새창">
                    <span class="text">외과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link4" href="beforedoctorsection?doctorsection=4" title="새창">
                    <span class="text">산부인과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link5" href="beforedoctorsection?doctorsection=5" title="새창">
                    <span class="text">비뇨기과</span>
                    <i class='bx bx-link-external'></i>
                </a>
            </div>
        </div>
    </div>
    </div>

    <c:choose>
      <c:when test="${empty doctorList}"> 진료 과를 먼저 선택해주세요
      </c:when>

      <c:otherwise>

      <div class="doc-content">
        <c:forEach items="${doctorList}" var="dVO" >
            <div class="col" onClick="location.href='doctorDetail?dseq=${dVO.dseq}'">
                <div class="col-img">
                    <img src="doctor_images/${dVO.savefilename}" />
                </div>

                <div class="col-text" >
                    <h4>
                    <c:choose>
                        <c:when test="${dVO.doctorsection == 5}">비뇨기과</c:when>
                        <c:when test="${dVO.doctorsection == 4}">산부인과</c:when>
                        <c:when test="${dVO.doctorsection == 3}">외과</c:when>
                        <c:when test="${dVO.doctorsection == 2}">이비인후과</c:when>
                        <c:otherwise>정형외과</c:otherwise>
                    </c:choose>


                    </h4>
                    <p>${dVO.bachd}</p>
                    <p>${dVO.mastd}</p>
                    <p>${dVO.doctd}</p>
                    <p>${dVO.name}</p>
                </div>
            </div>
        </c:forEach>


    </div>
      </c:otherwise>
    </c:choose>










<%@ include file="../footer.jsp" %>
