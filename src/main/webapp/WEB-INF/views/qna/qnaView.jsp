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
				<div class="qboard-sub" id="subjectQ">${qnaVO.subject}</div>
				<div class="qboard-title">${qnaVO.userid}</div>
				<div class="qboard-title"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
			</div>
			<div class="colline">
				<pre>${qnaVO.content}</pre>
			</div>
			<div class="rowtitle" >
				<label class="qboard-title" style="width:100%; padding:5px;">답변</label>
			</div>
			<div class="colline">
				${qnaVO.reply}&nbsp; 관리자 답변 내용
			</div>

			<div class="btn" style="background-color: #2faaff;" >
				<label><input type="button" value="목록으로" onClick="location.href='qnaList'"></label>
			</div>

		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>