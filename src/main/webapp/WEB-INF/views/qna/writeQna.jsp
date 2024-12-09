<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<html>
<head>
	<link rel="stylesheet" href="/css/writeQna.css"/>
</head>


<body>
<form action="writeQna" method="post">
    <div class="qnacontainer">
        <div class="contact-box">
            <div class="left"></div>

            <div class="right">
                <h2>Q & A 작성</h2>
                <div class="abc">
                    <input type="text" class="field" name="userid" value="${userid}" placeholder="작성자" />
                    <span class="error-message"><c:if test="${not empty errorMessage1}">${errorMessage1}</c:if></span>
                </div>

            <div class="abc">
                    <input type="text" class="field" id="subjectQ" name="subject" value="${subject}" maxlength="300" onkeyup="counter();" placeholder="제목">
                    <span class="error-message"><c:if test="${not empty errorMessage2}">${errorMessage2}</c:if></span>
            </div>

                <div class="abc">
                        <div class="textarea-container">
                            <textarea class="field area" id="contentQ" name="content" onkeyup="counter();" rows="10" maxlength="3000" placeholder="문의 내용">${content}</textarea>
                            <span id="textCount">(0/3000)</span> <!-- 글자 수 카운트 -->

                            <!-- 에러 메시지 -->
                            <span class="error-message">
                                <c:if test="${not empty errorMessage3}">${errorMessage3}</c:if>
                            </span>
                        </div>
                </div>

                <div class="buttons">
                    <input type="button" class="btn" value="목록으로" onClick="location.href='qnaList'">
                    <input type="submit" class="btn" value="작성완료">
                </div>
            </div>
        </div>
    </div>
</form>

</body>

</html>
<%@ include file="../footer.jsp" %>