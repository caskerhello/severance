<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    // 메시지가 있을 경우 팝업 띄우기
    window.onload = function() {
        const message = "${message}";
        if (message) {
            alert(message);
        }
    };
</script>

<!-- 가운데 -->
<div class="container">
    <section class="center">
        <div class="center-text">
            <h1>
                <span class="part1">공감,</span>
                <span class="part2">또 하나의 치료</span>
            </h1>
            <p>질병 치료를 넘어 환자의 마음까지 치유하겠습니다.</p>
        </div>
    </section>
</div>



    <div class="section-hospital">
    <div class="container">
        <div class="hospital-link">
            <div class="track">
                <a class="link link1" href="doctorsection?doctorsection=1" title="새창">
                    <span class="text">정형외과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link2" href="doctorsection?doctorsection=2" title="새창">
                    <span class="text">이비인후과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link3" href="doctorsection?doctorsection=3" title="새창">
                    <span class="text">외과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link4" href="doctorsection?doctorsection=4" title="새창">
                    <span class="text">산부인과</span>
                    <i class='bx bx-link-external'></i>
                </a>

                <a class="link link5" href="doctorsection?doctorsection=5" title="새창">
                    <span class="text">비뇨기과</span>
                    <i class='bx bx-link-external'></i>
                </a>
            </div>
        </div>
    </div>
    </div>

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

    <div class="section-news">

                <div class="news header">
                    <h2 class="news-title">NEWS</h2>
                    <p class="news-subtitle">고객 여러분께 가장 빠른 소식을<br>제공해 드리겠습니다.</p>


                    <div class="nav-buttons">
                        <label for="slide1" class="nav-button">
                            <i class="bx bx-left-arrow-alt"></i>
                        </label>
                        <label for="slide2" class="nav-button">
                            <i class="bx bx-right-arrow-alt"></i>
                        </label>

                    </div>

                </div>


        <div class="news-slider-wrapper">
            <input type="radio" name="slider" id="slide1" checked>
            <input type="radio" name="slider" id="slide2">



            <div class="news-slider">
                <a href="https://home.ebs.co.kr/ebsnews/menu1/newsAllView/60541543/N?eduNewsYn=N" target="_blank" class="news-link">
                    <div class="news-content">
                        <h3>[EBS] 뉴스브릿지 '키 크는 주사'라더니 부작용도 급증 올바른 방법은?</h3>
                        <p>2024-11-01</p>
                    </div>
                </a>
                <a href="https://www.news1.kr/bio/general/5565838" target="_blank" class="news-link">
                    <div class="news-content">
                        <h3>[뉴스1][100세건강] 임신성당뇨래요...우리 애 잘못되는건 아니겠죠?</h3>
                        <p>2024-12-01</p>
                    </div>
                </a>

                <a href="https://health.chosun.com/site/data/html_dir/2024/10/10/2024101001557.html" target="_blank" class="news-link">
                    <div class="news-content">
                        <h3>[밀당365] 고소한데 스리라차소스를 곁들인...브로콜리 치즈 구이</h3>
                        <p>2025-01-01</p>
                    </div>
                </a>

                <a href="https://www.fnnews.com/news/202410101819197403" target="_blank" class="news-link">
                    <div class="news-content">
                        <h3>[파이낸셜뉴스] 눈물 콧물 쏙 빼게 하더니...알레르기 비염 놔두면 천식돼요</h3>
                        <p>2025-01-01</p>
                    </div>
                </a>

                <a href="https://www.donga.com/news/Health/article/all/20241009/130179269/2" target="_blank" class="news-link">
                    <div class="news-content">
                        <h3>[동아일보] 65세 이상은 독감 예방접종 필수...고용량 백신, 합병증 예방 효과</h3>
                        <p>2025-01-01</p>
                    </div>
                </a>

                <a href="https://www.donga.com/news/Health/article/all/20241009/130179275/2" target="_blank" class="news-link">
                    <div class="news-content">
                        <h3>[동아일보] 당뇨병 앓는 저소득층, 자살 위험 4.3배 높다</h3>
                        <p>2025-01-01</p>
                    </div>
                </a>
            </div>
        </div>



    </div>






<%@ include file="footer.jsp" %>
