<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<html>

<body>
<div class="container">
	<main class="table">
		<section class="table_header">
			<h1>Q & A 게시판</h1>
		</section>

		<div class="table_ans">
			<div class="mypagerow">
				<div class="coltitle" style="flex:0.5;">No. ${qnaVO.qseq}</div>
				<div class="coltitle" id="subjectQ" style="flex:4;">${qnaVO.subject}</div>
				<div class="coltitle" style="flex:0.8;">${qnaVO.userid}</div>
				<div class="coltitle" style="flex:1;"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
			</div>
			<div class="mypagerow">
				<pre>${qnaVO.content}</pre>
			</div>
		</div>

		<div class="table_ans">
			<div class="mypagerow" >
				<label class="col" style="width:100%; padding:5px;">답변</label>
			</div>
			<div class="mypagerow">
					${qnaVO.reply}&nbsp; 관리자 답변 내용
			</div>
		</div>
		<div class="mypagerow"><a href="qnaList">목록으로</a></div>

		</form>
	</main>
</div>
</body>

</html>
<%@ include file="../footer.jsp" %>