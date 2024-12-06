<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/adminboard.css"/>
    <link rel="stylesheet" href="/css/doctorList.css"/>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="/admin/script/admin.js"></script>

    <script>
        $(document).ready(function() {
            // 기본 페이지는 doctorList로 설정
            $(".admin-content").load("/adminDoctorList"); // 컨트롤러에서 설정한 경로로 수정

            // 메뉴 클릭 시 동적으로 페이지를 로드
            $(".sidebar ul li a").click(function(e) {
                e.preventDefault();  // 기본 링크 이동을 방지
                var targetPage = $(this).attr("href");  // 클릭된 메뉴의 href 속성에서 타겟 페이지를 가져옴

                console.log("Clicked on:", targetPage);  // 클릭된 페이지 확인을 위해 콘솔 출력

                // 로드할 페이지가 doctorList인지 reservationList인지 확인하고 동적으로 로드
                if (targetPage === "../admin/adminDoctorList") {
                    console.log("Loading adminDoctorList...");
                    $(".admin-content").load("/adminDoctorList");  // /doctorList 경로로 페이지 로드

                } else if (targetPage === "../admin/adminReservationList") {
                    console.log("Loading adminReservationList...");
                    $(".admin-content").load("/adminReservationList");  // /reservationList 경로로 페이지 로드

                } else if (targetPage === "../admin/adminMemberList") {
                    console.log("Loading adminMemberList...");
                    $(".admin-content").load("/adminMemberList");  // /reservationList 경로로 페이지 로드

                } else if (targetPage === "../admin/adminQnaList") {
                    console.log("Loading adminQnaList...");
                    $(".admin-content").load("/adminQnaList");  // /reservationList 경로로 페이지 로드
                }
            });
        });

    </script>


    <script>
        function go_search() {



            var category = document.getElementById("searchCategory").value;  // 선택한 카테고리 가져오기
            var key = $('#key').val();   // 입력된 검색어 가져오기

            // 카테고리와 검색어를 기반으로 검색 요청 보내기
            if (category === "adminDoctorList") {
                // 의사리스트 검색 로직
                var url="adminDoctorList"
                console.log("검색 카테고리: 의사리스트, 검색어: " + key);
            } else if (category === "adminReservationList") {
                // 예약리스트 검색 로직
                var url="adminReservationList"
                console.log("검색 카테고리: 예약리스트, 검색어: " + key);
            } else if (category === "adminMemberList") {
                // 맴버리스트 검색 로직
                var url="adminMemberList"
                console.log("검색 카테고리: 맴버리스트, 검색어: " + key);
            } else if (category === "adminQnaList") {
                // QNA리스트 검색 로직
                var url="adminQnaList"
                console.log("검색 카테고리: QNA리스트, 검색어: " + key);
            }

            // 여기에서 실제 검색 처리를 위해 서버로 데이터 전송하거나, 필터링 작업을 수행할 수 있습니다.

            // AJAX 요청
            $.ajax({
                url: 'adminDoctorList',   // 서버의 URL
                method: 'GET',            // GET 방식
                data: { key: key },       // 파라미터로 검색어 전송
                success: function(response) {

                    $(".admin-content").load(url);

                },
                error: function() {
                    alert('검색 중 오류가 발생했습니다.');
                }
            });
        }

    </script>

    <script>
        function admincancelreservation(rseq){

            var url="adminReservationList"

            var rseq = rseq;
            var ans = confirm("예약을 취소하시겠습니까??");
            if( ans ){

                $.ajax({
                    url: 'admincancelreservation',   // 서버의 URL
                    method: 'GET',            // GET 방식
                    data: { rseq : rseq },       // 파라미터로 검색어 전송
                    success: function(response) {


                        $(".admin-content").load(url);

                    },
                    error: function(xhr, status, error) {
                        alert("오류 발생: " + error);
                    }

                });



            }
        }
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
                <a href="../admin/adminDoctorList">
                    <i class="ri-team-fill"></i>
                    <div class="title">의료진 리스트</div>
                </a>
            </li>
            <li>
                <a href="../admin/adminReservationList">
                    <i class="ri-calendar-schedule-fill"></i>
                    <div class="title">예약 리스트</div>
                </a>
            </li>
            <li>
                <a href="../admin/adminMemberList">
                    <i class="ri-user-heart-fill"></i>
                    <div class="title">회원 리스트</div>
                </a>
            </li>
            <li>
                <a href="../admin/adminQnaList">
                    <i class="ri-heart-pulse-fill"></i>
                    <div class="title">Q & A</div>
                </a>
            </li>
        </ul>
    </div>


    <div class="main">
        <div class="top-bar">
            <div class="top-title">
                <label><i class="ri-hospital-line"></i></label>
                <h1>Severance</h1>
            </div>

            <div class="heading">


                <div class="search-menu">
                    <select id="searchCategory">
                        <option value="adminDoctorList">의사리스트</option>
                        <option value="adminReservationList">예약리스트</option>
                        <option value="adminMemberList">맴버리스트</option>
                        <option value="adminQnaList">QNA리스트</option>
                    </select>

                    <!-- 검색 입력 필드 -->
                    <input type="text" name="key" id="key" placeholder="Search here" />

                    <!-- 검색 버튼 -->
                    <button type="button" onclick="go_search()">
                        <i class="ri-search-line"></i> 검색
                    </button>
                </div>

<%--                <h2>Admin Doctor List</h2>--%>
<%--                <div class="doctorlistsearch">--%>
<%--                    <input type="text" name="key" id="key" value="${key}" placeholder="Search here"/>--%>

<%--                    <button type="button" onclick="go_search('adminDoctorList')">--%>
<%--                        <i class="ri-search-line"></i>--%>
<%--                    </button>--%>
<%--                </div>--%>


            </div>
        </div>

        <!-- Insert the doctor list content here -->
        <div class="admin-content">



        </div>
    </div>
</div>
</body>
</html>
