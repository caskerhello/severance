<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idcheck.jsp</title>
	<script type="text/javascript">
		function idok(id){
			opener.document.joinForm.userid.value = id;
			opener.document.joinForm.reid.value =  id;
			self.close();
		}
	</script>
	<style type="text/css">
		body{display: flex; justify-content: center; flex-direction: column;}
	</style>
</head>
<body>
<form method="post" name="idCheckForm" action="idcheck" style="margin:20px 20px; display: flex; justify-content: center;">
	아이디 : <input type="text" name="userid" value="${userid}" /><!-- value 에 현재 중복체크된 아이디 표시 -->
	<input type="submit" value="중복체크" />
</form>

<div style="display: flex; justify-content: center;">
	<c:choose>
		<c:when test="${result==-1}">
			${userid}는 이미 사용중인 아이디여서 사용이 불가능합니다.
			<script type="text/javascript">
				opener.document.joinForm.userid.value="";
				opener.document.joinForm.reid.value="";
			</script>
		</c:when>
		<c:otherwise>
			${userid}는 사용 가능한 아이디입니다.
			<input type="button" value="사용하겠습니다" onClick="idok('${userid}')" />
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>
