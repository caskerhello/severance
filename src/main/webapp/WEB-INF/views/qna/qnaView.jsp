<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<form name="frm">
			<h2> Q & A </h2>
			<div class="field" style="border-bottom: 2px dotted #0054d1;">
				<div class="col">no. ${qnaVO.qseq}</div>
				<div class="coltitle">${qnaVO.subject}</div>
				<div class="coltitle">${qnaVO.userid}</div>
				<div class="col"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
			</div>
			<div class="field">
				<div class="col"><pre>${qnaVO.content}</pre></div>
			</div>
			<div class="reply" style=" background: #0054d1; border-radius: 5px 5px 0 0; " >
				<label style="color:#fff; font-weight: bold; display:flex;">답변</label>
			</div>

			<div class="field">
			<div style="width:100%; padding:15px; border-bottom:1px dotted #0054d1;">${qnaVO.reply}&nbsp; 관리자 답변 내용</div>
			</div>
			<div class="btn" style="flex:1; background-color: #2faaff;" >
				<input type="button" value="목록으로" onClick="location.href='qnaList'">
			</div>

		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>