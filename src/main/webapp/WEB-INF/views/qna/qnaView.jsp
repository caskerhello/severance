<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<form name="frm">
			<div class="qna_top">
			<h2> 고객센터 ( Q&A ) </h2>
			</div>
			<div class="rowtitle" style="border-bottom: 2px dotted #0054d1;">
				<div class="coltitle">No. ${qnaVO.qseq}</div>
				<div class="coltitle" style="flex:4">${qnaVO.subject}</div>
				<div class="coltitle">${qnaVO.userid}</div>
				<div class="coltitle"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
			</div>
			<div class="field">
				<pre>${qnaVO.content}</pre>
			</div>
			<div class="rowtitle" >
				<label class="coltitle" style="width:100%; padding:5px;">답변</label>
			</div>
			<div class="field">
				${qnaVO.reply}&nbsp; 관리자 답변 내용
			</div>

			<div class="btn" style="background-color: #2faaff;" >
				<input type="button" value="목록으로" onClick="location.href='qnaList'">
			</div>

		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>