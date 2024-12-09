<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
  // 성공 메시지를 팝업으로 표시
  window.onload = function() {
    alert("${successMessage}");
    window.location.href = "/loginForm"; // 팝업 확인 후 메인 페이지로 이동
  };
</script>

<%@ include file="../footer.jsp" %>
