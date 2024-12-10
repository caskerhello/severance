<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<html>
<head>
	<link rel="stylesheet" href="/css/qnaList.css"/>
</head>


<body>
<div class="container">
 <main class="table">
	 <section class="table_header">

		<h1>Q & A 게시판</h1>

		<nav class="sub_menu">
			<div><a href="writeQnaForm">질문하기</a></div>
		</nav>

	 </section>

	 <section class="table_body">
		 <div class="mypagerow">
			 <div class="coltitle" style="flex:0.8">번호</div>
			 <div class="coltitle" style="flex:1">작성자</div>
			 <div class="coltitle" style="flex:4">제목</div>
			 <div class="coltitle" style="flex:1.5">작성일</div>
			 <div class="coltitle" style="flex:0.5">답변</div>
		 </div>
	 </section>

	 <div class="list">
		<c:forEach items="${qnaList}" var="qnaVO" >
					<div class="mypagerow" onClick="qnaView('${qnaVO.qseq}')">
						<div class="col" style="flex:0.8">${qnaVO.qseq}</div>
						<div class="col">${qnaVO.userid}</div>
						<div class="col" style="flex:4">${qnaVO.subject}</div>
						<div class="col" style="flex:1.5"><fmt:formatDate value="${qnaVO.indate}" type="date"/></div>
						<div class="col">
							<c:choose>
								<c:when test="${empty qnaVO.reply }">N</c:when>
								<c:otherwise>Y</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
	 </div>

	<div class="paging">
		<div class="coltitle" style="font-size:120%; font-weight:bold;">
			<c:if test="${paging.prev}" >
			<a href="qnaList?page=${paging.beginPage-1}">◀</a>
			</c:if>

			<c:forEach begin="${paging.beginPage}"  end="${paging.endPage}" var="index">
			<c:if test="${index!=paging.page}" >
			<a href="qnaList?page=${index}" >${index}&nbsp;</a>
			</c:if>
			<c:if test="${index==paging.page}" >
			<span class="use">${index}&nbsp;</span>
			</c:if>
			</c:forEach>
			&nbsp;
			<c:if test="${paging.next}" >
			<a href="qnaList?page=${paging.endPage+1}">▶</a>
			</c:if>
		</div>
	</div>
 </main>
</div>

</body>

</html>
<%@ include file="../footer.jsp" %>