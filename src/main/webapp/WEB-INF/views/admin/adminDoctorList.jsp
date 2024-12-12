<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/admin/script/admin.js"></script>



    <style>
        .tbody td{text-align: center}

        .adminmodal .on{
            display: block;
        }

        .adminmodal_btn {
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
        .adminmodal_btn:hover {
            background-color: #007cfb;
        }


        .adminmodal_btn2 {
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
        .adminmodal_btn2:hover {
            background-color: #007cfb;
        }

        .adminmodal_btn3 {
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

        .adminmodal_btn3:hover {
            background-color: #F06464
        }

        /*모달 팝업 영역 스타일링*/
        .adminmodal {
            /*팝업 배경*/
            display: none; /*평소에는 보이지 않도록*/
            position: absolute;
            top:0;
            left: 0;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            background: rgba(0,0,0,0.5);
        }
        .adminmodal .adminmodal_popup {
            /*팝업*/
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background: #ffffff;
            border-radius: 20px;
        }
        .adminmodal .adminmodal_popup .adminclose_btn {
            display: block;
            padding: 10px 20px;
            background-color: royalblue;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: box-shadow 0.2s;
        }
    </style>
<script>
    var adminmodal = document.querySelector('.adminmodal');
    var adminmodalOpen = document.querySelector('.adminmodal_btn');
    var adminmodalClose = document.querySelector('.adminclose_btn');

    adminmodalClose.addEventListener('click',function(){
        //display 속성을 none으로 변경
        adminmodal.style.display = 'none';
    });
</script>


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
                        content +=    '<td>' + value.doctorsection + '</td>';
                        content +=    '<td>' + value.image + '</td>';

                        content +=    '<td>' +  value.daylimit  +'</td>';

                        content += '<td>'+
                            '<input type="button" class="adminmodal_btn" value="의사정보수정" onclick="adminDoctorUpdateForm('+value.dseq+','+paging2.page+')">'+
                                '<input type="button" class="adminmodal_btn3" value="의사정보삭제" onclick="adminDoctorDelete('+value.dseq+','+paging2.page+')">'+
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



    </script>

    <script type="text/javascript">


    </script>

</head>
<body>

<form method="post" name="frm">
    <div class="table-container">
        <div class="table">
            <div class="heading1" style="display: flex; justify-content: space-between; width: 350px">
                <h2>Admin Doctor List</h2>
                <input type="button" class="adminmodal_btn2" value="의사정보입력 양식" onclick="adminDoctorInsertForm()"
                style="background-color: #7494ec; cursor: pointer; outline: none; border: none;color: #fff; transition: .3s; margin-right: 10px;">
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
                        <td>${doctorList1.image}</td>
                        <td>${doctorList1.daylimit}</td>
                        <td>
                            <input type="button" class="adminmodal_btn" value="의사정보수정" onclick="adminDoctorUpdateForm(${doctorList1.dseq},${paging.page})">
                            <input type="button" class="adminmodal_btn3" value="의사정보삭제" onclick="adminDoctorDelete(${doctorList1.dseq},${paging.page})">
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
            </table>
        </div>
<br>

        <div class="adminmodal">
            <div class="adminmodal_popup">
            <table>
            <tbody class="listData2">

                <tr>

                </tr>
                <button type="button" class="adminclose_btn">닫기</button>
            </tbody>
            </table>
            </div>
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
