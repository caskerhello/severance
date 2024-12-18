<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="/css/header_footer.css"/>
<%--<link rel="stylesheet" href="/css/main.css"/>--%>
<link rel="stylesheet" href="/css/contractForm.css"/>

<style>
	textarea {
		white-space: pre-wrap;
	}
</style>

<section>
	<article>
		<form action="contractAgree" method="post">
			<div class="agreement-section">
				<input type="checkbox" id="agree-all" />
				<label for="agree-all"><strong>약관 전체 동의</strong></label>
			</div>
			<div>
				<div class="agreement-detail">
					<div>
						<input type="checkbox" id="terms-service" name="termsService" class="sub-checkbox" required />
						<label for="terms-service">연세메모리의 이용약관(필수)</label>
						<textarea readonly>
제 1조 목적
본 약관은 하이미디어 병원이 제공하는 [진료예약] 서비스(이하 "서비스")의 이용 조건 및 절차, 이용자와 회사 간의 권리와 의무를 규정하는 것을 목적으로 합니다.

제 2조 용어의 정의
"서비스"란 회사가 제공하는 모든 온라인 및 오프라인 서비스를 의미합니다.
"회원"이란 본 약관에 따라 회사와 이용계약을 체결하고 서비스를 이용하는 자를 말합니다.

제 3조 서비스 이용 계약 체결
이용자는 약관에 동의함으로써 서비스 이용 계약이 체결됩니다.
회사는 특정 이용자의 신청에 대해 승낙을 거부할 수 있습니다.

제 8조 회원의 의무
회원은 서비스 이용과 관련하여 아래 행위를 해서는 안 됩니다.
- 허위 정보 제공
- 타인의 개인정보 도용
- 서비스의 정상적 운영을 방해하는 행위
						</textarea>
					</div>

					<div>
						<input type="checkbox" id="privacy-policy" name="privacyPolicy" class="sub-checkbox" required />
						<label for="privacy-policy">개인정보 수집·이용(필수)</label>
						<textarea readonly>
1. 수집하는 개인정보 항목
필수정보: 휴대폰 번호, 아이디/비밀번호, 이름, 이메일
선택정보: 주소

2. 개인정보의 수집 및 이용 목적
서비스 제공 및 계약 이행
고객 문의 및 민원 처리
이벤트 및 프로모션 참여 관리

3. 개인정보의 보유 및 이용 기간
회원탈퇴 시 즉시 삭제

4. 개인정보 제공 및 위탁
회사는 개인정보를 제3자에게 제공하지 않습니다.
                        </textarea>
					</div>

					<div>
						<input type="checkbox" id="marketing-consent" name="marketingConsent" class="sub-checkbox" />
						<label for="marketing-consent">마케팅 정보 수신 동의(선택)</label>
						<textarea readonly>
1. 목적
회사는 회원이 동의할 경우 다음과 같은 정보를 제공합니다.

신규 서비스 및 상품 안내
할인 및 이벤트 정보
개인 맞춤형 추천 서비스

2. 제공 방법
이메일, SMS, 푸시 알림
                        </textarea>
					</div>
				</div>
			</div>

			<div class="agreement-buttons">
				<button id="home-button" type="button">홈으로</button>
				<button id="next-button" type="button">다음 단계로</button>
			</div>
		</form>
	</article>
</section>

<script>
	document.addEventListener("DOMContentLoaded", () => {
		const agreeAllCheckbox = document.getElementById("agree-all");
		const subCheckboxes = document.querySelectorAll(".sub-checkbox");
		const nextButton = document.getElementById("next-button");
		const homeButton = document.getElementById("home-button");
		const form = document.querySelector("form");

		agreeAllCheckbox.addEventListener("change", () => {
			const isChecked = agreeAllCheckbox.checked;
			subCheckboxes.forEach((checkbox) => (checkbox.checked = isChecked));
			updateButtonState();
		});

		subCheckboxes.forEach((checkbox) => {
			checkbox.addEventListener("change", () => {
				agreeAllCheckbox.checked = Array.from(subCheckboxes).every((cb) => cb.checked);
				updateButtonState();
			});
		});

		function updateButtonState() {
			const isAllRequiredChecked = Array.from(subCheckboxes)
					.filter((cb) => cb.hasAttribute("required"))
					.every((cb) => cb.checked);
			nextButton.disabled = !isAllRequiredChecked;
		}

		nextButton.addEventListener("click", () => {
			const isAllRequiredChecked = Array.from(subCheckboxes)
					.filter((cb) => cb.hasAttribute("required"))
					.every((cb) => cb.checked);

			if (isAllRequiredChecked) {
				form.submit();
			} else {
				alert("모든 필수 약관에 동의해야 합니다.");
			}
		});

		homeButton.addEventListener("click", () => {
			window.location.href = "/";
		});
	});
</script>

<%@ include file="../footer.jsp" %>