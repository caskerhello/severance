<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<form>
			<div class="qna_top">
				<h2> 고객센터 ( Q&A ) </h2>
				<div class="btn">
					<input type="button" value="질문하기" onClick="location.href='writeQnaForm'"/>
				</div>
			</div>

			<!-- QnA 게시판 시작 -->
			<div class="board">
				<div class="rowtitle">
					<div class="qboard-title">No.</div>
					<div class="qboard-title">작성자</div>
					<div class="qboard-title">제목</div>
					<div class="qboard-title">작성일</div>
					<div class="qboard-title">답변</div>
				</div>
				<c:forEach items="${qnaList}" var="qnaVO" >
					<div class="rowQ" onClick="qnaView('${qnaVO.qseq}')">
						<div class="colline">${qnaVO.qseq}</div>
						<div class="colline">${qnaVO.userid}</div>
						<div class="colline" style="flex:4">${qnaVO.subject}</div>
						<div class="colline"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
						<div class="colline">
							<c:choose>
								<c:when test="${empty qnaVO.reply }">N</c:when>
								<c:otherwise>Y</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
				<!-- QnA 게시판 끝 -->

				<!-- paging 시작 -->
				<div class="rowQ">
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
				</div>
				<!-- paging 끝 -->

			</div>
		</form>
	</article>
</section>
 <%@ include file="../footer.jsp" %>