<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
<section>
	<article>
		<form>
			<div class="qna_top">
				<h2> Q & A </h2>
				<div class="btn">
					<input type="button" value="질문하기" onClick="location.href='writeQnaForm'"/>
				</div>
			</div>
			<div class="tb">
				<div class="row" style="background:#0054d1; color:#fff; border-radius:5px 5px 0 0;">
					<div class="coltitle">No.</div>
					<div class="coltitle">작성자</div>
					<div class="qnatitle">제목</div>
					<div class="coltitle">작성일</div>
					<div class="coltitle">답변여부</div>
				</div>
				<c:forEach items="${qnaList}" var="qnaVO" >
					<div class="row">
						<div class="col">${qnaVO.qseq}</div>
						<div class="col" onClick="qnaView('${qnaVO.qseq}')">${qnaVO.userid}</div>
						<div class="qnatitle" onClick="qnaView('${qnaVO.qseq}')">${qnaVO.subject}</div>
						<div class="col"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
						<div class="col">
							<c:choose>
								<c:when test="${empty qnaVO.reply }">N</c:when>
								<c:otherwise>Y</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>

				<div class="row">  <!-- 페이지의 시작 -->
					<div class="coltitle" style="font-size:120%; font-weight:bold;">
						<c:if test="${paging.prev}" >
							<a href="qnaList?page=${paging.beginPage-1}">◀</a>
						</c:if>
						&nbsp;

						<c:forEach begin="${paging.beginPage}"  end="${paging.endPage}" var="index">
							<c:if test="${index!=paging.page}" >
								<a href="qnaList?page=${index}">${index}&nbsp;</a>
							</c:if>
							<c:if test="${index==paging.page}" >
								<span style="color:red">${index}&nbsp;</span>
							</c:if>
						</c:forEach>

						&nbsp;
						<c:if test="${paging.next}" >
							<a href="qnaList?page=${paging.endPage+1}">▶</a>
						</c:if>
					</div>
				</div><!-- 페이지의 끝 -->

			</div>
		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>