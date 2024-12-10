<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <style>
        .tbody td{text-align: center}

    </style>



    <script type="text/javascript">

        function fn_go_page(pageNo) {

            var submitObj = new Object();

            submitObj.page= pageNo;

            $.ajax({
                url: "adminDoctorListPaging",
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify(submitObj),
                dataType : "JSON",
                progress: true
            })
                .done(function(responseData) {

                    console.log("Success:", responseData);

                    var  result = new Array;
                    result = responseData.doctorList2;

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


                        content +=    '<td>' + value.dseq + '</td>';
                        content +=    '<td>' + value.name + '</td>';
                        content +=    '<td>' + value.image + '</td>';
                        content +=    '<td>' + value.doctorsection + '</td>';
                        content +=    '<td>' +  value.daylimit  +'</td>';

                        content += '<td>'+
                            '<input type="button" value="의사정보수정" onclick="adminDoctorUpdateForm('+value.dseq+','+paging2.page+')">'+
                                '<input type="button" value="의사정보삭제" onclick="adminDoctorDelete('+value.dseq+','+paging2.page+')">'+
                        '</td>'

                        content +=    '</tr>';
                        // ii--;
                    });

                    $(".listData").html(content);





                    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
                    content2 +=    '<ol class="pagination" id="pagination">';

                    if(paging2.prev){
                        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" >▶</a></li>';
                        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" >▶</a></li>';
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

        function adminDoctorUpdateForm(dseq,page) {
            console.log(page)



            $.ajax({
                url: "adminDoctorUpdateForm",
                type: "POST",

                data: {dseq:dseq},
                dataType : "JSON",
                progress: true
            })
                .done(function(data) {
                    var result = new Array;
                    result = data.doctor;


                    var content = "";

                    content += '<tr>';


                    content += '<td id="admindoctorupdatedseq">' + result.dseq + '</td>';
                    // content +=    '<td>' + result.name + '</td>';
                    // content +=    '<td>' + result.doctorsection + '</td>';
                    content += '<td colspan="3">' + result.content + '</td>';
                    // content +=    '<td>' +  result.bachd  +'</td>';
                    // content +=    '<td>' +  result.mastd  +'</td>';
                    // content +=    '<td>' +  result.doctd  +'</td>';
                    // content +=    '<td>' +  result.resume  +'</td>';
                    content += '<td>' + result.univlogo + '</td>';

                    content += '</tr>';


                    content += '<tr>';


                    // content +=    '<td>' + result.dseq + '</td>';
                    // content +=    '<td>' + result.name + '</td>';
                    // content +=    '<td>' + result.doctorsection + '</td>';
                    // content +=    '<td colspan="3">' + result.content + '</td>';
                    content += '<td>' + '약력' + '</td>';
                    content += '<td>' + '[학부]' + result.bachd + '<br>' + '[석사]' + result.mastd + '</td>';

                    content += '<td>' + '[박사]' + result.doctd + '<br>' + '[경력]' + result.resume + '</td>';

                    // content +=    '<td>' +  result.univlogo  +'</td>';

                    content += '</tr>';

                    content += '<tr>';


                    content += '<td>' + result.name + '</td>';
                    content += '<td><input type="text" id="admindoctorupdatename" placeholder="이름"/></td>';
                    content += '<td><input type="text" id="admindoctorupdatedoctorsection" placeholder="진료과"/></td>';

                    content += '<td><input type="text" id="admindoctorupdatedaylimit" placeholder="출근일"/></td>';

                    content += '</tr>';

                    content += '<tr>';
                    content += '<td colspan="5"><textarea id="admindoctorupdatecontent" placeholder="과 설명" rows="4" cols="200"/></td>';
                    content += '</tr>';


                    content += '<tr>';


                    content += '<td>' + '약력' + '</td>';

                    content += '<td colspan="4"><input type="text" style="width: 300px;" id="admindoctorupdatebachd" placeholder="학부"/><input type="text" style="width: 300px;" id="admindoctorupdatemastd" placeholder="석사"/><input type="text" style="width: 300px;" id="admindoctorupdatedoctd" placeholder="박사"/><input type="text" style="width: 300px;" id="admindoctorupdateresume" placeholder="이력"/></td>';

                    // content +=    '<td>' +  result.univlogo  +'</td>';

                    content += '</tr>';


                    content += '<td>' + '사진/로고' + '</td>';

                    content += '<td>' +
                    '<div class="field" >' +

                        '<label>의사사진</label>' +
                        '<div>' +
                            '<input type="hidden" name="image"  id="image" value="'+result.image+'"/>' +
                            '<input type="hidden" name="savefilename" id="savefilename" value="'+result.savefilename+'" >' +

                            '<div id="filename">' +
                             result.image +
                            '<img src="/doctor_images/'+result.savefilename+'" width="50" />'+
                            '</div>'+
                        '</div>'+
                    '</div>'+

                    '<div>'+
                    '<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">' +
                    '<input type="file" name="fileimage"/>' +
                    '<input type="button" id="imageAddBtn" value="추가" onclick="update_docimage()" />' +
                    '</form>' +
                    '</div></td>;'





                    content += '<td>' +
                        '<div class="field" >' +

                        '<label>로고</label>' +
                        '<div>' +
                        '<input type="hidden" name="image2"  id="image2" value="'+result.univlogo+'"/>' +
                        '<input type="hidden" name="savefilename2" id="savefilename2" value="'+result.univlogofilename+'" >' +

                        '<div id="filename2">' +
                        result.univlogo +
                        '<img src="/doctor_images/'+result.univlogofilename+'" width="50" />'+
                        '</div>'+
                        '</div>'+
                        '</div>'+

                        '<div>'+
                        '<form name="fromm" id="fileupForm2" method="post" enctype="multipart/form-data">' +
                        '<input type="file" name="fileimage"/>' +
                        '<input type="button" id="imageAddBtn" value="추가" onclick="update_logimage()" />' +
                        '</form>' +
                        '</div></td>;'


                    content += '<td>' + '<input type="button" id="DoctorAddBtn" onclick="update_doc()" value="정보수정"/>' + '</td>';

                    content += '</tr>';


                    $(".listData2").html(content);


                })
                .fail(function (e) {
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
                <h2>Admin Doctor List</h2>
                <input type="button" value="의사정보입력양식" onclick="adminDoctorInsertForm()">

            </div>
            <thead></thead>


            <table class="Admin Doctor List">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>진료과목</th>
                    <th>사진</th>
                    <th>출근일</th>


                    <th>상세설정</th>
                </tr>

            <tbody class="listData">

                <c:if test="${empty doctorList}">
                    <p>의사 목록이 없습니다.</p>
                </c:if>

                <c:forEach items="${doctorList}" var="doctorList1">
                    <tr>
                        <td>${doctorList1.dseq}</td>
                        <td>${doctorList1.name}</td>
                        <td>${doctorList1.doctorsection}</td>
                        <th>${doctorList1.image}</th>
                        <td>${doctorList1.daylimit}</td>
                        <td>
                            <input type="button" value="의사정보수정" onclick="adminDoctorUpdateForm(${doctorList1.dseq},${paging.page})">
                            <input type="button" value="의사정보삭제" onclick="adminDoctorDelete(${doctorList1.dseq},${paging.page})">
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
            </table>
        </div>
<br>

        <div class="table">
            <table>
            <tbody class="listData2">

                <tr>

                </tr>

            </tbody>
            </table>
        </div>










    </div>

    <input type="hidden" id="pageIndex" name="pageIndex" val="" />
</form>

<!-- Paging[s] -->
<div>페이지 넘기기</div>
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
