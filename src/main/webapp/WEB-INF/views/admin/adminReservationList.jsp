<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>

    <style>

        .cancel-button{
            width: 100px;
            display: block;
            margin: 5px auto;
            padding: 5px 5px;
            background-color: #F08282;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: box-shadow 0.2s;
        }

        .cancel-button:hover {
            background-color: #F06464
        }

        .result-button{
            display: block;
            margin: 5px auto;
            padding: 5px 5px;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            background-color: #7494ec;
            outline: none;
            transition: .3s;
        }

        .result-button:hover {
            background-color: #007cfb;
        }



    </style>

    <script type="text/javascript">

        function fn_go_page(pageNo) {

            var submitObj = new Object();

            submitObj.page= pageNo;

            $.ajax({
                url: "adminReservationListPaging",
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify(submitObj),
                dataType : "JSON",
                progress: true
            })
                .done(function(responseData) {

                    console.log("Success:", responseData);

                    var  result = new Array;
                    result = responseData.reservationList2;

                    console.log(result);

                    var paging2 = responseData.paging2;

                    console.log(paging2);

                    // var realEnd = paging2.totalPage;

                    var startDate = paging2.beginPage;
                    var startButtonDate = startDate - 1;
                    var endDate = paging2.endPage;
                    var endButtonDate = endDate + 1;
                    var pageIndex = paging2.page;

                    var resultCnt = paging2.totalCount;

                    var totalPageCnt = paging2.displayPage;
                    var recordCountPerPage = paging2.displayRow;


                    // var ii = (resultCnt - (pageIndex - 1) * recordCountPerPage);

                    var content = '';
                    var content2 = '';


                    $.each(result, function(key, value) {

                        content +=    '<tr>';


                        content +=    '<td>' + value.rseq + '</td>';
                        content +=    '<td>' + value.membername + '</td>';
                        content +=    '<td>' + value.phone + '</td>';
                        content +=    '<td>' +  value.indate  +'</td>';
                        content +=    '<td>' +  value.doctorname  +'</td>';
                        content +=    '<td>' +  value.bookdate  +'</td>';
                        content +=    '<td>' +  value.time  +'</td>';


                        content += '<td>';

                        if (value.result == 4) {
                            content += '진료 완료';
                            content += '<div><input type="button" value="결과변경(하락)" class="result-button" onclick="adminSetReservationResultDown(' + value.rseq + ',' + paging2.page + ')"/></div>';
                        } else if (value.result == 3) {
                            content += '예약 완료';
                            content += '<div><input type="button" value="예약취소" class="cancel-button" onclick="admincancelreservation(' + value.rseq + ')"/></div>';
                            content += '<div><input type="button" value="결과변경(상승)" class="result-button" onclick="adminSetReservationResultUp(' + value.rseq + ',' + paging2.page + ')"/></div>';
                            content += '<div><input type="button" value="결과변경(하락)" class="result-button" onclick="adminSetReservationResultDown(' + value.rseq + ',' + paging2.page + ')"/></div>';
                        } else if (value.result == 2) {
                            content += '예약 접수 완료';
                            content += '<div><input type="button" value="예약취소" class="cancel-button" onclick="admincancelreservation(' + value.rseq + ')"/></div>';
                            content += '<div><input type="button" value="결과변경(상승)" class="result-button" onclick="adminSetReservationResultUp(' + value.rseq + ',' + paging2.page + ')"/></div>';
                            content += '<div><input type="button" value="결과변경(하락)" class="result-button" onclick="adminSetReservationResultDown(' + value.rseq + ',' + paging2.page + ')"/></div>';
                        } else if (value.result == 1){
                            content += '예약 접수 중';
                            content += '<div><input type="button" value="예약취소" class="cancel-button" onclick="admincancelreservation(' + value.rseq +')"/></div>';
                            content += '<div><input type="button" value="결과변경(상승)" class="result-button" onclick="adminSetReservationResultUp(' + value.rseq + ',' + paging2.page + ')"/></div>';
                        }

                        content += '</td>';

                        // content += '<td>';
                        //
                        // if (value.result == 4) {
                        //     content += '진료 완료';
                        // } else if (value.result == 3 ) {
                        //     content += '예약 완료<div><input type="button" value="예약취소" onclick="admincancelreservation(' + value.rseq + ')"/></div>';
                        // } else if (value.result == 2 ) {
                        //     content += '예약 접수 완료<div><input type="button" value="예약취소" onclick="admincancelreservation(' + value.rseq + ')"/></div>';
                        // }else {
                        //     content += '예약 접수 중<div><input type="button" value="예약취소" onclick="admincancelreservation(' + value.rseq + ')"/></div>';
                        // }
                        //
                        // content += '</td>';






                        content +=    '</tr>';
                        // ii--;
                    });





                    $(".listData").html(content);





                    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
                    content2 +=    '<ol class="pagination" id="pagination">';

                    if(paging2.prev){
                        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" >◀</a></li>';
                        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" >◀</a></li>';
                    }

                    for (var num = startDate; num <= endDate; num++) {
                        if (num == pageIndex) {
                            content2 += '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on"><span style="color:red">' + num + '</span></a></li>';
                        } else {
                            content2 += '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
                        }
                    }

                    if(paging2.next){
                        content2 +=    '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonDate + '); return false;" >▶</a></li>';

                        content2 +=    '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + paging2.totalPages +'); return false;">▶</a></li>';
                    }

                    content2 +=    '</ol>';
                    content2 +=    '</div>';

                    $(".board-list-paging").html(content2);

                })
                .fail(function(e) {
                    alert("검색에 실패하였습니다.");
                    console.log("AJAX Error:", status, error);
                    console.log("Response:", xhr.responseText);
                })
                .fail(function(e) {
                    console.log("AJAX 요청 실패:", e);
                })
                .always(function() {

                });
        }

    </script>


    <script type="text/javascript">

        function adminSetReservationResultUp(rseq,page) {
            console.log(rseq);
            console.log(page);

            $.ajax({
                url: "adminSetReservationResultUp",
                type: "POST",

                data: {rseq:rseq},
                dataType : "JSON",
                progress: true
            })
                .done(function(responseData) {
                    // console.log(responseData);
                    // console.log(responseData.reservationResult);

                    fn_go_page(page);

                //  var content ="";
                //
                //     content="처리완료"
                //
                //
                //
                // $("#reservationresult"+rseq).html(content);


                })
                .fail(function(e) {
                    alert("검색에 실패하였습니다.");
                    console.log("AJAX Error:", status, error);
                    console.log("Response:", xhr.responseText);
                })
                .fail(function(e) {
                    console.log("AJAX 요청 실패:", e);
                })
                .always(function() {

                });
        }

    </script>


    <script type="text/javascript">

        function adminSetReservationResultDown(rseq,page) {
            console.log(rseq);
            console.log(page);

            $.ajax({
                url: "adminSetReservationResultDown",
                type: "POST",

                data: {rseq:rseq},
                dataType : "JSON",
                progress: true
            })
                .done(function(responseData) {

                    fn_go_page(page);

                    // console.log(responseData);
                    // console.log(responseData.reservationResult);
                    //
                    //
                    //
                    // var content ="";
                    //
                    // content="처리완료"
                    //
                    // $("#reservationresult"+rseq).html(content);
                })
                .fail(function(e) {
                    alert("검색에 실패하였습니다.");
                    console.log("AJAX Error:", status, error);
                    console.log("Response:", xhr.responseText);
                })
                .fail(function(e) {
                    console.log("AJAX 요청 실패:", e);
                })
                .always(function() {

                });
        }

    </script>




</head>
<body>
<form method="post" name="frm">
    <div class="table-container">
        <div class="table">
            <div class="heading">
                <h2>Admin Reservation List</h2>

            </div>
            <thead></thead>


            <table class="Admin Reservation List">
                <tr>
                    <th>번호</th>
                    <th>접수자성명</th>
                    <th>접수자연락처</th>
                    <th>접수일</th>
                    <th>의사성명</th>
                    <th>예약일</th>
                    <th>예약시간</th>
                    <th>예약결과</th>
                    <th>상세설정</th>
                </tr>

                <tbody class="listData">





                <c:if test="${empty reservationList}">
                    <p>예약 목록이 없습니다.</p>
                </c:if>









                <c:forEach items="${reservationList}" var="reservationList1">
                    <tr>
                        <td>${reservationList1.rseq}</td>
                        <td>${reservationList1.membername}</td>
                        <td>${reservationList1.phone}</td>
                        <td>${reservationList1.indate}</td>
                        <td>${reservationList1.doctorname}</td>
                        <td>${reservationList1.bookdate}</td>
                        <td>${reservationList1.time}</td>

                        <td id="reservationresult${reservationList1.rseq}">
                            <c:choose>
                            <c:when test="${reservationList1.result == 4}">진료 완료

                                <div><input type="button" value="결과변경(하락)" class="result-button" onclick="adminSetReservationResultDown(${reservationList1.rseq},${paging.page})"/></div></c:when>

                            <c:when test="${reservationList1.result == 3}">예약 완료
                                <div><input type="button" value="예약취소" class="cancel-button" onclick="admincancelreservation(${reservationList1.rseq})"/></div>
                                <div><input type="button" value="결과변경(상승)" class="result-button" onclick="adminSetReservationResultUp(${reservationList1.rseq},${paging.page})"/></div>
                                <div><input type="button" value="결과변경(하락)" class="result-button" onclick="adminSetReservationResultDown(${reservationList1.rseq},${paging.page})"/></div></c:when>

                            <c:when test="${reservationList1.result == 2}">예약 접수 완료
                                <div><input type="button" value="예약취소" class="cancel-button" onclick="admincancelreservation(${reservationList1.rseq})"/></div>
                                <div><input type="button" value="결과변경(상승)" class="result-button"  onclick="adminSetReservationResultUp(${reservationList1.rseq},${paging.page})"/></div>
                                <div><input type="button" value="결과변경(하락)" class="result-button" onclick="adminSetReservationResultDown(${reservationList1.rseq},${paging.page})"/></div>

                            </c:when>

                            <c:when test="${reservationList1.result == 1}">예약 접수 중
                            <div><input type="button" value="예약취소" class="cancel-button" onclick="admincancelreservation(${reservationList1.rseq})"/></div>

                            <div><input type="button" value="결과변경(상승)" class="result-button" onclick="adminSetReservationResultUp(${reservationList1.rseq},${paging.page})"/></div>



                            </c:when>


                        </c:choose>

                        </td>


                            <%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>
                    </tr>
                </c:forEach>

                </tbody>






            </table>



        </div>
    </div>

    <input type="hidden" id="pageIndex" name="pageIndex" val="" />
</form>

<!-- Paging[s] -->

<div class="board-list-paging">
    <c:set var="pageIndex" value="1"/>

    <ol class="pagination" id="pagination">

        <c:if test="${paging.prev}">
            <li class="prev_end">
                <a href="javascript:void(0);" onclick="fn_go_page(1); return false;" >◀</a>
            </li>
            <li class="prev">
                <a href="javascript:void(0);"  onclick="fn_go_page(${paging.beginPage - 1}); return false;" >◀</a>
            </li>
        </c:if>


        <c:forEach var="num" begin="${paging.beginPage}" end="${paging.endPage}">
            <li>
                <c:if test="${num==paging.page}">
                    <span style="color:red">${num}&nbsp;</span>
                </c:if>
                <c:if test="${num!=paging.page}">
                    <a href="javascript:void(0);" onclick="fn_go_page(${num}); return false;" class="num ${page eq num ? 'on':'' }" title="${num}">${num}</a>
                </c:if>



            </li>
        </c:forEach>


        <c:if test="${paging.next}">
            <li class="next">
                <a href="javascript:void(0);"  onclick="fn_go_page(${paging.endPage + 1}); return false;" >▶</a>
            </li>

            <li class="next_end">
                <a href="javascript:void(0);" onclick="fn_go_page(${paging.totalPages }); return false;">▶</a>
            </li>
        </c:if>
    </ol>
</div>
<!-- Paging[e] -->

</body>
</html>
