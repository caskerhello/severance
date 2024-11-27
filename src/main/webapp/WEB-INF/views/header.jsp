<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/css/header_footer.css" />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/section.css" />
<link rel="stylesheet" href="/css/product.css" />
<link rel="stylesheet" href="/css/mypage.css" /> -->

<!-- <script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/hmenu.js"></script>
<script src="/script/member.js"></script>
<script src="/script/mypage.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- 화면이동없이 서버와 데이터를 주고 받을 수 있는 환경을 제공합니다	-->
<!-- <script type="text/javascript">
	$(function(){
			$('#idcheckButton').click(function(){

					var formselect = $('#joinFrm')[0];
					var formdata = new FormData( formselect );
					$.ajax({
							url:"<%=request.getContextPath()%>/idcheck",
							type:"POST",
							// enctype:"multipart/form-data",
							async: false,
							data: formdata,
							timeout: 10000,
							contentType : false,
							processData : false,

							success:function(data){
								// alert(data.idmessage);

								if( data.idmessage == '1'){
										$('#idmessage').html("&nbsp;&nbsp;<span style='color:blue' >사용 가능합니다</span>");
										$('#reid').val(data.userid);
								}else{
										$('#idmessage').html("&nbsp;&nbsp;<span style='color:red' >사용중인 아이디입니다</span>");
										$('#reid').val("");
								}
							},
							error:function(){
								alert("중복 조회 실패");
							},
					});
			});
	});
</script> -->
</head>

<body>
<div id="wrap">
	<header>
		<nav id="top_menu">
			<div id="logo">
				<a href="/">
					<img src="/images/sev_logo@2x.png"   height="100">
				</a>
			</div>

			<div class="gnb">
					<c:choose>
						<c:when test="${empty loginUser}">
							<a href="loginForm">LOGIN</a>
							<a href="contract">JOIN</a>
						</c:when>
						<c:otherwise>
							<a href="#">${loginUser.name}(${loginUser.userid})</a>
				       		<a href="logout">LOGOUT</a>
						</c:otherwise>
					</c:choose>
					<a href="cartList">예약</a>
					<a href="mypage">MYPAGE</a>
					<a href="customer">고객센터</a>
			</div>
			<div class="hmenu">
						<div></div>	
						<div></div>
						<div></div>
			</div>
		</nav>

		<div id="main_img">
			<img src="/images/img-visual-patient1.jpg"  />
		</div>
		<nav id="section_menu">
				<a href="section?section=1">내과</a>
				<a href="section?section=2">외과</a>
				<a href="section?section=3">이비인후과</a>
				<a href="section?section=4">소아과</a>
				<a href="section?section=5">정형외과</a>
		</nav>
	</header>

