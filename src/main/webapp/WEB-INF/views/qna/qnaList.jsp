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
			<div class="tb">
				<div class="rowtitle">
					<div class="coltitle">No.</div>
					<div class="coltitle">작성자</div>
					<div class="coltitle" style="flex:4">제목</div>
					<div class="coltitle">작성일</div>
					<div class="coltitle">답변여부</div>
				</div>
				<c:forEach items="${qnaList}" var="qnaVO" >
					<div class="row" onClick="qnaView('${qnaVO.qseq}')">
						<div class="colQ">${qnaVO.qseq}</div>
						<div class="colQ">${qnaVO.userid}</div>
						<div class="colQ" style="flex:4">${qnaVO.subject}</div>
						<div class="colQ"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
						<div class="colQ">
							<c:choose>
								<c:when test="${empty qnaVO.reply }">N</c:when>
								<c:otherwise>Y</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
				<!-- QnA 게시판 끝 -->

				<!-- paging 시작 -->
				<div class="row">
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