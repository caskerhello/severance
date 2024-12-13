<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="action" value="${param.address}" />

<style>

	/* 전체 페이징 영역 */
	.paginationcol {
		display: flex;
		padding-left: 0;
		list-style-type: none;
		justify-content: center;  /* 버튼을 중앙에 배치 */
		text-decoration: none;
		color: inherit;
		margin-top: 10px;
	}

	/* 각 페이지 번호를 감싸는 li */
	.paginationcol li {
		display: flex;
		justify-content: center;
		align-items: center;

	}

	/* 페이지 번호 버튼 스타일 */
	.paginationcol a {
		display: inline-block;
		padding: 5px 10px;
		background-color: #7494ec;  /* 파란색 배경 */
		color: white;
		border-radius: 25px;  /* 둥근 버튼 */
		font-size: 16px;
		transition: background-color 0.3s, transform 0.2s;  /* 효과 전환 */
		text-align: center;
		text-decoration: none;
		margin-right: 10px; /* 각 버튼 간의 간격을 10px로 설정 */
		margin-top: 5px;

	}

	/* 페이지 번호 버튼 호버 효과 */
	.paginationcol a:hover {
		background-color: #007cfb;  /* 마우스 오버 시 짙은 파란색 */
		transform: scale(1.1);  /* 버튼 크기 확대 */
	}

	/* 페이지 번호 버튼 클릭 시 효과 */
	.paginationcol a:active {
		background-color: #1c658c;  /* 클릭 시 색상 */
		transform: scale(1);  /* 클릭 후 크기 유지 */
	}

	/* 비활성화된 버튼 스타일 */
	.paginationcol .disabled a {
		background-color: #bdc3c7;  /* 비활성화된 버튼 색상 */
		color: #ecf0f1;
		cursor: not-allowed; /* 클릭 불가 */
	}

	/* 첫 번째 페이지 버튼 왼쪽 간격 없애기 */
	.paginationcol li:first-child a {
		margin-left: 0;
	}

	/* 마지막 페이지 버튼 오른쪽 간격 없애기 */
	.paginationcol li:last-child a {
		margin-right: 0;
	}




</style>

<div class="paginationrow">
		<div class="paginationcol">
							
				<c:if test="${paging.prev}">
					<a href="${action}?page=${paging.beginPage-1}">◀</a>
				</c:if>

				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:if test="${index==paging.page}">
						<span style="background-color: #e74c3c; color: white; padding: 3px 9px; border-radius: 25px; display: inline-block; margin-right: 5px; text-align: center; text-decoration: none; line-height: 30px;">${index}</span>&nbsp;
					</c:if>

					<c:if test="${index!=paging.page}">
						<a href="${action}?page=${index}">${index}</a>
					</c:if>
				</c:forEach>

				<c:if test="${paging.next}">
						<a href="${action}?page=${paging.endPage+1}">▶</a>
				</c:if>
		</div>
</div><!-- 페이지의 끝 -->