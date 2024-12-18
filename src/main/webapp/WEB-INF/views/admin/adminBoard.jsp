<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="org.json.JSONObject"%>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/admin/adminboard.css"/>
    <link rel="stylesheet" href="/css/admin/adminList.css"/>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="/admin/script/admin.js"></script>



    <script type="text/javascript">

        // 초기 로딩 시 placeholder 설정
        window.onload = updatePlaceholder;


        // function update_image(){
        //     console.log("clicked");
        //     var formselect = $('#fileupForm')[0];   // 지목된 폼을 변수에 저장
        //     var formData = new FormData( formselect );
        //     $.ajax(
        //         {
        //             url:"/fileup" ,
        //             type:"POST",
        //             enctype:"multipart/form-data",
        //             data: formData,
        //             timeout: 10000,
        //             contentType : false,
        //             processData : false,
        //
        //             success: function( data ){
        //                 $('#filename').html("<div>" + data.image + "</div>" );
        //                 $("#filename").append("<img src='doctor_images/" + data.savefilename + "' height='150'/>");
        //                 $('#image').val( data.image );
        //                 $('#savefilename').val( data.savefilename );
        //             },
        //             error:function(){  alert("실패"); },
        //         }
        //     );
        // }


    </script>



    <script>
        $(document).ready(function () {
            // 기본 페이지는 doctorList로 설정
            $(".admin-content").load("/adminDoctorList", function() {
                fn_go_page(1);  $('#key').val(''); document.getElementById("searchCategory").value = "adminDoctorList"; go_search() // doctorList 페이지 로드 후 페이지 번호를 1로 설정
            }); // 컨트롤러에서 설정한 경로로 수정





            // 메뉴 클릭 시 동적으로 페이지를 로드
            $(".sidebar ul li a").click(function (e) {
                e.preventDefault();  // 기본 링크 이동을 방지
                var targetPage = $(this).attr("href");  // 클릭된 메뉴의 href 속성에서 타겟 페이지를 가져옴

                console.log("Clicked on:", targetPage);  // 클릭된 페이지 확인을 위해 콘솔 출력

                // 로드할 페이지가 doctorList인지 reservationList인지 확인하고 동적으로 로드
                if (targetPage === "../admin/adminDoctorList") {
                    console.log("Loading adminDoctorList...");
                    $(".admin-content").load("/adminDoctorList", function() {
                        fn_go_page(1);  $('#key').val(''); document.getElementById("searchCategory").value = "adminDoctorList"; go_search() ;updatePlaceholder();// doctorList 페이지를 로드하고, 페이지 번호를 1로 설정
                    });  // /doctorList 경로로 페이지 로드

                } else if (targetPage === "../admin/adminReservationList") {
                    console.log("Loading adminReservationList...");
                    $(".admin-content").load("/adminReservationList", function() {
                        fn_go_page(1);  $('#key').val(''); document.getElementById("searchCategory").value = "adminReservationList"; go_search(); updatePlaceholder(); // reservationList 페이지를 로드하고, 페이지 번호를 1로 설정
                    });  // /reservationList 경로로 페이지 로드

                } else if (targetPage === "../admin/adminMemberList") {
                    console.log("Loading adminMemberList...");
                    $(".admin-content").load("/adminMemberList", function() {
                        // fn_go_page(1); $('#key').val(''); document.getElementById("searchCategory").value = "adminMemberList"; go_search()
                        fn_go_page(1);  $('#key').val(''); document.getElementById("searchCategory").value = "adminMemberList"; go_search() ; updatePlaceholder();
                        // memberList 페이지를 로드하고, 페이지 번호를 1로 설정
                    });  // /reservationList 경로로 페이지 로드

                } else if (targetPage === "../admin/adminQnaList") {
                    console.log("Loading adminQnaList...");
                    $(".admin-content").load("/adminQnaList", function() {
                        fn_go_page(1); $('#key').val(''); document.getElementById("searchCategory").value = "adminQnaList"; go_search() ; updatePlaceholder();// qnaList 페이지를 로드하고, 페이지 번호를 1로 설정
                    });  // /reservationList 경로로 페이지 로드
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
                url: url,   // 서버의 URL
                method: 'GET',            // GET 방식
                data: { key: key, page: 1 },       // 파라미터로 검색어 전송
                success: function(response) {

                    // 페이지를 1번으로 초기화하고, 검색 결과를 로드
                    $(".admin-content").load(url, function() {
                        // 페이지가 로드된 후 초기화
                        $('#key').val(''); // 검색어 입력창을 공백으로 초기화
                    });

                },
                error: function() {
                    alert('검색 중 오류가 발생했습니다.');
                }
            });
        }

        function checkEnter(event) {
            if (event.key === "Enter") {
                go_search(); // 엔터 키가 눌렸을 때 go_search() 호출
            }
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




    <script type="text/javascript">

        function fn_go_page(pageNo) {

            var submitObj = new Object();

            submitObj.pageIndex= pageNo;
            submitObj.searchWrd= $("#searchWrd").val();

            $.ajax({
                url: path+"/gnb01/lnb06/snb03/areaListAjax.do",
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify(submitObj),
                dataType : "json",
                progress: true
            })
                .done(function(data) {

                    var  result = new Array;
                    result = data.resultList;
                    var searchVO = data.searchVO;
                    var realEnd = searchVO.realEnd;
                    var startDate = searchVO.startDate;
                    var startButtonDate = startDate - 1;
                    var endDate = searchVO.endDate;
                    var endButtonDate = endDate + 1;
                    var pageIndex = searchVO.pageIndex;
                    var resultCnt = data.resultCnt;
                    var totalPageCnt = data.totalPageCnt;
                    var recordCountPerPage = searchVO.recordCountPerPage;


                    var ii = (resultCnt - (pageIndex - 1) * recordCountPerPage);

                    var content = '';
                    var content2 = '';

                    $.each(result, function(key, value) {

                        content +=    '<tr class="memList">';
                        content +=    '<td class="t_c">' + ii + '</td>';
                        content +=    '<td class="t_c">' + value.me_sido + '</td>';
                        content +=    '<td>' + value.me_gugun + '<button type="button" class="btnInfo fr"></button></td>';
                        content +=    '<td class="t_c">' + value.me_biz_name + '</td>';
                        content +=    '<td class="t_c">' +  value.me_name  +'</td>';
                        content +=    '<td class="t_c">' +  value.me_biz_tel + '</td>';
                        content +=    '</tr>';
                        ii--;
                    });

                    $(".listData").html(content);

                    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
                    content2 +=    '<ol class="pagination" id="pagination">';

                    if(searchVO.prev){
                        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" ></a></li>';
                        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" ></a></li>';
                    }

                    for (var num=startDate; num<=endDate; num++) {
                        if (num == pageIndex) {
                            content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on">' + num + '</a></li>';
                        } else {
                            content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
                        }
                    }

                    if(searchVO.next){
                        content2 +=    '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonDate + '); return false;" ></a></li>';
                        content2 +=    '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + searchVO.realEnd +'); return false;"></a></li>';
                    }

                    content2 +=    '</ol>';
                    content2 +=    '</div>';

                    $(".board-list-paging").html(content2);

                })
                .fail(function(e) {
                    alert("검색에 실패하였습니다.");
                })
                .always(function() {

                });
        }

    </script>







<%--    <script>--%>



<%--        function generatePagination(pagingData) {--%>
<%--            let paginationHTML = '';--%>

<%--            // 이전 페이지 버튼--%>
<%--            if (pagingData.prev) {--%>
<%--                paginationHTML += `<button class="prev">Prev</button>`;--%>
<%--            }--%>

<%--            // 페이지 번호 버튼--%>
<%--            for (let i = pagingData.beginPage; i <= pagingData.endPage; i++) {--%>
<%--                paginationHTML += `<button class="page" data-page="${i}">${i}</button>`;--%>
<%--            }--%>

<%--            // 다음 페이지 버튼--%>
<%--            if (pagingData.next) {--%>
<%--                paginationHTML += `<button class="next">Next</button>`;--%>
<%--            }--%>

<%--            // 페이징 영역에 추가--%>
<%--            document.getElementById('pagination').innerHTML = paginationHTML;--%>
<%--        }--%>


<%--        $(document).on('click', '.page', function() {--%>
<%--            let page = $(this).data('page'); // 클릭한 페이지 번호--%>

<%--            $.ajax({--%>
<%--                url: '/your-api-endpoint', // API 엔드포인트--%>
<%--                type: 'GET',--%>
<%--                data: {--%>
<%--                    page: page,--%>
<%--                    rows: pagingData.displayRow--%>
<%--                },--%>
<%--                success: function(response) {--%>
<%--                    // 응답으로 받은 데이터를 처리하여 화면에 출력--%>
<%--                    displayData(response.data);--%>

<%--                    // 페이징 데이터 업데이트--%>
<%--                    pagingData = response.paging;--%>
<%--                    generatePagination(pagingData);--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>

<%--        function displayData(data) {--%>
<%--            // 받은 데이터를 화면에 표시하는 로직 (예: 테이블에 추가)--%>
<%--            let html = '';--%>
<%--            data.forEach(item => {--%>
<%--                html += `<div>${item.name}</div>`; // 데이터 표시--%>
<%--            });--%>
<%--            $('#dataContainer').html(html);--%>
<%--        }--%>
<%--    </script>--%>






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

            <!-- 검색 입력 필드 -->
            <div class="search2">
                <input type="text" name="key" id="key" placeholder="의사 검색" onclick="go_search()" onkeydown="checkEnter(event)"/>
                <label for="key"><i class="ri-search-line"></i></label>
            </div>

            <div class="heading2">
                <div class="search-menu">
                    <select id="searchCategory" onchange="updatePlaceholder()">
                        <option value="adminDoctorList">의사리스트</option>
                        <option value="adminReservationList">예약리스트</option>
                        <option value="adminMemberList">맴버리스트</option>
                        <option value="adminQnaList">QNA리스트</option>
                    </select>
                </div>
            </div>

        </div>

        <!-- Insert the doctor list content here -->
        <div class="admin-content">



        </div>
    </div>
</div>
</body>
</html>
