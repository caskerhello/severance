<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
    </div>
    </div>

    <div class="doc-content">
        <div class="col">
            <div class="col-img">
                <img src="/images/1_profile.jpg" />
            </div>

            <div class="col-text">
                <h4>내 과</h4>
                <p>서울의대 수석 졸업</p>
                <p>홍 길 동</p>
            </div>
        </div>

        <div class="col">
            <div class="col-img">
                <img src="/images/2_profile.jpg" />
            </div>

            <div class="col-text">
                <h4>외 과</h4>
                <p>서울의대 수석 졸업</p>
                <p>홍 길 동</p>
            </div>
        </div>

        <div class="col">
            <div class="col-img">
                <img src="/images/3_profile.jpg" />
            </div>

            <div class="col-text">
                <h4>이비인후과</h4>
                <p>서울의대 수석 졸업</p>
                <p>홍 길 동</p>
            </div>
        </div>

        <div class="col">
            <div class="col-img">
                <img src="/images/4_profile.jpg" />
            </div>

            <div class="col-text">
                <h4>소아과</h4>
                <p>서울의대 수석 졸업</p>
                <p>홍 길 동</p>
            </div>
        </div>

        <div class="col">
            <div class="col-img">
                <img src="/images/5_profile.jpg" />
            </div>

            <div class="col-text">
                <h4>정형외과</h4>
                <p>서울의대 수석 졸업</p>
                <p>홍 길 동</p>
            </div>
        </div>

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
