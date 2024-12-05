<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/adminboard.css"/>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            // 기본 페이지는 doctorList로 설정
            $(".doctor-list-content").load("/doctorList"); // 컨트롤러에서 설정한 경로로 수정

            // 메뉴 클릭 시 동적으로 페이지를 로드
            $(".sidebar ul li a").click(function(e) {
                e.preventDefault();  // 기본 링크 이동을 방지
                var targetPage = $(this).attr("href");  // 클릭된 메뉴의 href 속성에서 타겟 페이지를 가져옴

                console.log("Clicked on:", targetPage);  // 클릭된 페이지 확인을 위해 콘솔 출력

                // 로드할 페이지가 doctorList인지 reservationList인지 확인하고 동적으로 로드
                if (targetPage === "../doctor/doctorList.jsp") {
                    console.log("Loading doctorList...");
                    $(".doctor-list-content").load("/doctorList");  // /doctorList 경로로 페이지 로드
                } else if (targetPage === "../reservation/reservationList") {
                    console.log("Loading reservationList...");
                    $(".doctor-list-content").load("/reservationList");  // /reservationList 경로로 페이지 로드
                } else if (targetPage === "../member/memberList") {
                    console.log("Loading memberList...");
                    $(".doctor-list-content").load("/memberList");  // /reservationList 경로로 페이지 로드
                } else if (targetPage === "../qna/qnaList") {
                    console.log("Loading qnaList...");
                    $(".doctor-list-content").load("/qnaList");  // /reservationList 경로로 페이지 로드
                }
            });
        });

    </script>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <ul>
            <li>
                <a href="#">
                    <i class="ri-home-7-fill"></i>
                    <div class="title">Admin Menu</div>
                </a>
            </li>
            <li>
                <a href="../doctor/doctorList.jsp">
                    <i class="ri-team-fill"></i>
                    <div class="title">의료진 리스트</div>
                </a>
            </li>
            <li>
                <a href="../reservation/reservationList">
                    <i class="ri-calendar-schedule-fill"></i>
                    <div class="title">예약 리스트</div>
                </a>
            </li>
            <li>
                <a href="../member/memberList">
                    <i class="ri-user-heart-fill"></i>
                    <div class="title">회원 리스트</div>
                </a>
            </li>
            <li>
                <a href="../qna/qnaList">
                    <i class="ri-heart-pulse-fill"></i>
                    <div class="title">Q & A</div>
                </a>
            </li>
        </ul>
    </div>

    <!-- Main content area for doctor list -->
    <div class="main">
        <div class="top-bar">
            <div class="top-title">
                <label><i class="ri-hospital-line"></i></label>
                <h1>Severance</h1>
            </div>
        </div>

        <!-- Insert the doctor list content here -->
        <div class="doctor-list-content">



        </div>
    </div>
</div>
</body>
</html>
