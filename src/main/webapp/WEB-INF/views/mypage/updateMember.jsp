<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%-- css 호출 --%>
<link rel="stylesheet" href="/css/header_footer.css"/>
<link rel="stylesheet" href="/css/main.css"/>
<link rel="stylesheet" href="/css/updateMemberForm.css"/>


<section>

	<%@ include file="sub_image_menu.jsp" %>

	<article>
		<form  action="updateMember" method="post" name="joinForm">

			<h2>회원정보 수정</h2><br />
			<h3>기본정보입력</h3>
			<hr> <br />

			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" value="${dto.name}" readonly>
			</div>

			<div class="form-group">
				<label>아이디</label>
				<div>
					<input type="text" name="userid" value="${dto.userid}" readonly>
				</div>
			</div>

			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="pwd" placeholder="8자 이상, 20자 이내" required>
				<div class="info">※ 8자 이상 ~ 20자 이내로 설정해주세요.<br>
					※ 영문(대/소문자), 숫자, 특수문자를 모두 포함해주세요.<br>
					※ 비밀번호 예시: password!121</div>
			</div>

			<div class="form-group">
				<label>비밀번호 확인</label>
				<input type="password" name="pwdCheck" placeholder="비밀번호 재입력" required>
			</div>

			<div class="form-group">
				<label>연락처</label>
				<div>
					<input type="text" name="phone" value="${dto.phone}" placeholder="010-1234-5678" required>
				</div>
				<div class="info">예약 관련정보는 수신동의 여부와 관계없이 발송됩니다.</div>
			</div>

			<div class="form-group">
				<label>E-mail</label>
				<div>
					<input type="text" name="email" value="${dto.email}">
				</div>
				<div class="info">※ 회원가입 완료 및 예약 관련정보는 수신 동의 여부와 관계없이 발송됩니다.</div>
			</div>

			<h3>선택정보입력</h3>
			<hr> <br />

			<div class="form-group">
				<label>우편번호</label>
				<div>
					<input type="text" id="zip_num" name="zip_num" value="${dto.zip_num}" placeholder="우편번호" readonly required>
					<button type="button" id="addressSearchButton" onclick="sample6_execDaumPostcode()">주소찾기</button>
				</div>
			</div>

			<div class="form-group">
				<label>주소</label>
				<input type="text" id="sample6_address" name="address" value="${dto.address}" placeholder="도로명 주소를 입력하세요" required>
			</div>


			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function sample6_execDaumPostcode() {
					new daum.Postcode({
						oncomplete: function(data) {
							var addr = '';

							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							document.getElementById('zip_num').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;

							document.getElementById("sample6_address").focus();
						}
					}).open();
				}
			</script>

			<div class="form-submit">
				<input type="button" value="메인으로" onclick="location.href='/'">
				<input type="button" value="회원수정" onclick="go_update()">
			</div>

			<div class="field">
				${message}
			</div>
		</form>
	</article>
</section>