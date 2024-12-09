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
        url: "adminMemberListPaging",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(submitObj),
        dataType : "JSON",
        progress: true
      })
              .done(function(responseData) {

                console.log("Success:", responseData);

                var  result = new Array;
                result = responseData.memberList2;

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


                  content +=    '<td>' + value.mseq + '</td>';
                  content +=    '<td>' + value.userid + '</td>';
                  content +=    '<td>' + value.pwd + '</td>';
                  content +=    '<td>' + value.name  +'</td>';
                  content +=    '<td>' + value.email + '</td>';
                  content +=    '<td>' + value.zip_num + '</td>';
                  content +=    '<td>' + value.address + '</td>';
                  content +=    '<td>' + value.phone + '</td>';
                  content +=    '<td>' + value.indate + '</td>';

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

                for (var num=startDate; num<=endDate; num++) {
                  if (num == pageIndex) {
                    content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on">' + num + '</a></li>';
                  } else {
                    content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
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

</head>
<body>

<form method="post" name="frm">
  <div class="table-container">
    <div class="table">
      <div class="heading">
        <h2>Admin Member List</h2>

      </div>
      <thead></thead>


      <table class="Admin Member List">
        <tr>
          <th>번호</th>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>이름</th>
          <th>이메일</th>
          <th>우편번호</th>
          <th>주소</th>
          <th>핸드폰번호</th>
          <th>가입일</th>
          <th>상세설정</th>
        </tr>

        <tbody class="listData">





        <c:if test="${empty memberList}">
          <p>맴버 목록이 없습니다.</p>
        </c:if>









        <c:forEach items="${memberList}" var="memberList1">
          <tr>
            <td>${memberList1.mseq}</td>
            <td>${memberList1.userid}</td>
            <td>${memberList1.pwd}</td>
            <td>${memberList1.name}</td>
            <td>${memberList1.email}</td>
            <td>${memberList1.zip_num}</td>
            <td>${memberList1.address}</td>
            <td>${memberList1.phone}</td>
            <td>${memberList1.indate}</td>

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
        <a href="javascript:void(0);" onclick="fn_go_page(${num}); return false;" class="num ${page eq num ? 'on':'' }" title="${num}">${num}</a>
      </li>
    </c:forEach>


            <c:if test="${paging.next}">
                <li class="next">
                    <a href="javascript:void(0);"  onclick="fn_go_page(${paging.endPage + 1}); return false;" >▶</a>
                </li>

                <li class="next_end">
                    <a href="javascript:void(0);" onclick="fn_go_page(${paging2.totalPages }); return false;">▶</a>
                </li>
            </c:if>
  </ol>
</div>
<!-- Paging[e] -->

</body>
</html>
