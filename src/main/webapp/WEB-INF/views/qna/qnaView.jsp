<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<form>
			<div class="qna_top">
				<h2> 고객센터 ( Q&A ) </h2>
			</div>
			<div class="rowtitle">
				<div class="qboard-title">No. ${qnaVO.qseq}</div>
				<div class="qboard-title" id="subjectQ" style="flex:4">${qnaVO.subject}</div>
				<div class="qboard-title">${qnaVO.userid}</div>
				<div class="qboard-title"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
			</div>
			<div class="field">
				<pre>${qnaVO.content}</pre>
			</div>
			<div class="rowtitle" >
				<label class="qboard-title" style="width:100%; padding:5px;">답변</label>
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