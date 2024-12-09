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

            submitObj.page= pageNo;

            $.ajax({
                url: "adminQnaListPaging",
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify(submitObj),
                dataType : "JSON",
                progress: true
            })
                .done(function(responseData) {

                    console.log("Success:", responseData);

                    var result = new Array;
                    result = responseData.qnaList2;

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


                    $.each(result, function (key, value) {

                        content += '<tr>';


                        content += '<td>' + value.qseq + '</td>';
                        content += '<td>' + value.userid + '</td>';
                        content += '<td>' +
                            '<a href="javascript:void(0);" onclick="fn_view_page(' + value.qseq + ');">' +
                            value.subject +
                            '</a>';

                        content += '<td id="replytd' + value.qseq + '">';

                        if (value.reply == null) {
                            content += '미답변';
                        } else {
                            content += '답변완료';
                        }

                        content += '</td>';

                        content += '<td>' + value.indate + '</td>';

                        content += '</tr>';

                        // ii--;
                    });


                    $(".listData").html(content);


                    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
                    content2 += '<ol class="pagination" id="pagination">';

                    if (paging2.prev) {
                        content2 += '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" >◀</a></li>';
                        content2 += '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" >◀</a></li>';
                    }


<%--                    <c:if test="${num==paging.page}">--%>
<%--                    <span style="color:red">${num}&nbsp;</sp--%>

<%--                    </c:if>--%>
<%--                    <c:if test="${num!=paging.page}">--%>
<%--                    <a href="javascript:void(0);" onClick="fn_go_page(${num}); return false;"--%>
<%--                       className="num ${page eq num ? 'on':'' }" title="${num}">${num}<--%>

<%--                    </c:if>--%>


                    for (var num = startDate; num <= endDate; num++) {
                        if (num == pageIndex) {
                            content2 += '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on"><span style="color:red">' + num + '</span></a></li>';
                        } else {
                            content2 += '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
                        }
                    }


                    if (paging2.next) {
                        content2 += '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonDate + '); return false;" >▶</a></li>';

                        content2 += '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + paging2.totalPages + '); return false;">▶</a></li>';
                    }

                    content2 += '</ol>';
                    content2 += '</div>';

                    $(".board-list-paging").html(content2);

                })
                .fail(function (e) {
                    alert("검색에 실패하였습니다.");
                    console.log("AJAX Error:", status, error);
                    console.log("Response:", xhr.responseText);
                })
                .fail(function (e) {
                    console.log("AJAX 요청 실패:", e);
                })
                .always(function() {

                });
        }

    </script>

    <script>
        function update_reply(qseq){
            console.log(qseq)

            let reply = document.getElementsByName('reply')[0].value;
            console.log(reply)

            $.ajax({
                url: "adminQnaReplyUpdate",
                type: "POST",
                data: { qseq: qseq , reply:reply},
                dataType : "json",
                progress: true
            })
                .done(function(responseData) {

                    console.log("Success:", responseData);

                    var  result = new Array;
                    result = responseData.qvo;


                    var content2 = '';




                    content2 += '<tr>'
                    content2 +=    '<td>' + '번호('+qseq+')</td>';
                    content2 +=    '<td>' + '내용' + '</td>';
                    content2 +=    '<td colspan="3"> ' + result.content + '</td>';
                    content2 += '</tr>'


                    content2 += '<tr>'
                    content2 +=    '<td>' + '번호('+qseq+')</td>';

                    if (result.reply == null) {
                        content2 +=    '<td colspan="4">  <textarea rows="4" cols="200" name="reply"></textarea> </td>';
                        content2 +=    '<td><input type="button" value="답변하기" onclick="update_reply('+ qseq+')" /></td>';
                    } else {
                        content2 +=    '<td colspan="5">  '+result.reply+' </td>';

                    }


                    content2 += '</tr>'

                    $(".listData2").html(content2);
                    // content += '<td name=replytd'+value.qseq+'>';


                    $("#replytd"+qseq).html("답변완료");

                    // var content3 = '';
                    // $(".listData3").html(content3);






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

    <script>

        function fn_view_page(qseq) {

            console.log(qseq)

            $.ajax({
                url: "adminQnaDetail",
                type: "POST",
                data: { qseq: qseq },
                dataType : "json",
                progress: true
            })
                .done(function(responseData) {

                    console.log("Success:", responseData);

                    var  result = new Array;
                    result = responseData.qvo;


                    var content2 = '';




                        content2 += '<tr>'
                        content2 +=    '<td>' + '번호('+qseq+')</td>';
                        content2 +=    '<td>' + '내용' + '</td>';
                        content2 +=    '<td colspan="3"> ' + result.content + '</td>';
                        content2 += '</tr>'


                        content2 += '<tr>'
                        content2 +=    '<td>' + '번호('+qseq+')</td>';

                    if (result.reply == null) {
                        content2 +=    '<td colspan="4">  <textarea rows="4" cols="200" name="reply"></textarea> </td>';
                        content2 +=    '<td><input type="button" value="답변하기" onclick="update_reply('+ qseq+')" /></td>';
                    } else {
                        content2 +=    '<td colspan="5">  '+result.reply+' </td>';

                    }


                        content2 += '</tr>'

                    $(".listData2").html(content2);

                    // var content3 = '';
                    // $(".listData3").html(content3);






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
                <h2>Admin Qna List</h2>

            </div>
            <thead></thead>


            <table class="Admin Qna List">
                <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>제목</th>
                    <%--          <th>내용</th>--%>
                    <th>답변</th>
                    <th>등록일</th>
                    <th>상세설정</th>
                </tr>

                <tbody class="listData">





                <c:if test="${empty qnaList}">
                    <p>Qna 목록이 없습니다.</p>
                </c:if>









                <c:forEach items="${qnaList}" var="qnaList1">

                    <tr>

                        <td>${qnaList1.qseq}</td>
                        <td>${qnaList1.userid}</td>
                        <td><a href="javascript:void(0);"  onclick="fn_view_page(${qnaList1.qseq});" >${qnaList1.subject}</a></td>
                            <%--&lt;%&ndash;            <th>${qnaList1.content}</th>&ndash;%&gt;--%>


                        <td id="replytd${qnaList1.qseq}">
                            <c:choose>
                                <c:when test="${qnaList1.reply == null}">미답변</c:when>
                                <c:otherwise>답변완료</c:otherwise>
                            </c:choose></td>
                            <%--                ${qnaList1.reply}--%>
                        <td>${qnaList1.indate}</td>
                            <%--                    <th><input type="button" value="의사정보수정" onclick="href='adminUpdateDoctor'"><input type="button" value="의사정보삭제" onclick="href='adminDeleteDoctor'"></th>--%>

                    </tr>

                </c:forEach>




                </tbody>

                <tbody class="listData2">
<%--                <tr class="listData2">--%>


<%--                </tr>--%>
<%--                <tr class="listData3">--%>

<%--                </tr>--%>




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
