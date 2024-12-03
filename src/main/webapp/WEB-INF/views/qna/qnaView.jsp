<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<form name="frm">
			<h2> Q & A </h2>
			<div class="row">
				<div class="col">no. ${qnaVO.qseq}</div>
				<div class="qnatitle">${qnaVO.subject}</div>
				<div class="col">${qnaVO.userid}</div>
				<div class="col"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
			</div>
			<div class="field" style="border-top:1px dotted #2faaff;">
				<div><pre>${qnaVO.content}</pre></div>
			</div>
			<div class="field" style="background: #2faaff; border-radius: 3px; " >
				<label style="color:#fff; font-weight: bold; ">답변</label>
				<div style="padding:10px;">${qnaVO.reply}&nbsp;</div>
			</div>

			<div class="btn" >
		   		<input type="button" value="목록으로" onClick="location.href='qnaList'">
		   	</div>
		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>