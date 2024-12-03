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
                        <span class="text">정형외과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link2" href="#" title="새창">
                        <span class="text">이비인후과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link3" href="#" title="새창">
                        <span class="text">외 과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link4" href="#" title="새창">
                        <span class="text">산부인과</span>
                        <i class='bx bx-link-external'></i>
                    </a>

                    <a class="link link5" href="#" title="새창">
                        <span class="text">비뇨기과</span>
                        <i class='bx bx-link-external'></i>
                    </a>
                </div>
            </div>
        </div>


        <div class="sub_page" >
		<article  style="flex-direction:column">
			<h2>${section}</h2>
			<div class="sectionDoctor">
				<c:forEach items="${doctorsection}"  var="doctorVO">
					<div class="sectionitem"
						onClick="location.href='doctorDetail?dseq=${doctorVO.dseq}'" >
						<img src="images/Doctor_image/${doctorVO.savefilename}" />
						<div>${doctorVO.name}-${doctorVO.price}</div>
					</div>
				</c:forEach>
			</div>
		</article>
	</div>
    </div>


</main>



<%@ include file="../footer.jsp" %>
