<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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




<%--    <%--%>
<%--        System.out.println(request.getAttribute("paging2"));--%>
<%--        System.out.println("jsp페이징1:"+request.getAttribute("paging2"));--%>
<%--        JSONObject paging = (JSONObject)request.getAttribute("paging2");--%>
<%--        System.out.println("jsp페이징2:"+paging);--%>

<%--    %>--%>
</head>
<body>

<form method="get" name="frm">
    <div class="table-container">
        <div class="table">
            <div class="heading">
                <h2>Admin Doctor List</h2>

            </div>
            <table class="Admin Doctor List">
                <thead>

                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>진료과목</th>
                    <th>출근일</th>
                    <th>상세설정</th>
                </tr>

                <c:if test="${empty doctorList}">
                    <p>의사 목록이 없습니다.</p>
                </c:if>


                <c:forEach items="${doctorList}" var="doctorList1">
                    <tr>
                        <th>${doctorList1.dseq}</th>
                        <th>${doctorList1.name}</th>
                        <th>${doctorList1.doctorsection}</th>
                        <th>${doctorList1.daylimit}</th>
                            <%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>
                    </tr>
                </c:forEach>









                </thead>
                <tbody>
                <!-- Add table data dynamically here -->
                </tbody>
            </table>
        </div>
    </div>

    <input type="hidden" id="pageIndex" name="pageIndex" val="" />
</form>

<!-- Paging[s] -->

<div class="col-sm-12 col-md-7" style="text-align:right">
    <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
        <ul class="pagination">

            <c:if test="${searchVO.prev}">
                <li class="paginate_button page-item previous" id="dataTable_previous">
                    <a href="javascript:void(0);" onclick="fn_go_page(${searchVO.startDate - 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                </li>
            </c:if>

            <c:forEach var="num" begin="${searchVO.startDate}" end="${searchVO.endDate}">
                <li class="paginate_button page-item">
                    <a href="javascript:void(0);" onclick="fn_go_page(${num}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${searchVO.next}">
                <li class="paginate_button page-item next" id="dataTable_next">
                    <a href="javascript:void(0);" onclick="fn_go_page(${searchVO.endDate + 1}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- Paging[e] -->

</body>
</html>
