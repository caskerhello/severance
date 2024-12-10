<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<html>
<head>
	<link rel="stylesheet" href="/css/qnaView.css"/>
</head>


<body>
<form>
    <div class="qnacontainer1">
        <div class="contact-box1">
            <div class="left2"></div>

            <div class="right2">
                <h2>Q & A View</h2>
                <div class="abc1">
                    <input type="text" class="field1" name="userid" value="작성자 : ${qnaVO.userid}" readonly/>

                </div>

            <div class="abc1">
                <input type="text" class="field1" name="subject" value="제목 : ${qnaVO.subject}" readonly/>
            </div>

                <div class="abc1">
                    <input type="text" class="field1" name="datevo" value="등록일 : <fmt:formatDate value='${qnaVO.indate}' pattern='yyyy-MM-dd' />" readonly/>

                </div>

                <div class="abc1">
                    <div class="textarea-container1">
                        <textarea class="field1 area" name="content" readonly>내용 : ${qnaVO.content}</textarea>

                    </div>
                </div>

                <div class="abc1">
                    <div class="textarea-container1">
                        <textarea class="field1 area" name="content" readonly>답변 : ${qnaVO.reply}</textarea>
                    </div>
                </div>

                <div class="buttons">
                    <input type="button" class="btn" value="목록으로" onClick="location.href='qnaList'">
                </div>
            </div>
        </div>
    </div>
</form>

</body>

</html>
<%@ include file="../footer.jsp" %>