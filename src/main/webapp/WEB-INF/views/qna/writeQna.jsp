<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
  <article>
    <form action="writeQna" method="post">
    <div class="qna_top">
        <h2>고객센터 ( Q&A )</h2>
    </div>

    <div class="rowQ">
        <div class="field">
            <div class="colline">
                <label>작성자</label>
                <input type="text" name="userid" value="${userid}" />
            </div>
            <div class="error-message">
                <c:if test="${not empty errorMessage1}">
                ${errorMessage1}
                </c:if>
            </div>
        </div>
    </div>


    <div class="rowQ">
        <div class="field"><label>제&nbsp;&nbsp;&nbsp;목</label></div>
        <div class="field">
            <div>
              <input type="text" id="subjectQ" name="subject" value="${subject}" maxlength="300" onkeyup="counter();" />
            </div>
            <c:if test="${not empty errorMessage2}">
                <div class="error-message">${errorMessage2}</div>
            </c:if>
        </div>
    </div>

    <div class="rowQ">
        <div class="field"><label>내&nbsp;&nbsp;&nbsp;용</label></div>
        <div class="field">
            <textarea id="contentQ" name="content" rows="10" maxlength="3000" style="width:100%; resize:none;" placeholder="질문 내용을 입력하세요." onkeyup="counter();">${content}</textarea>
        </div>
        <div>
          <div class="colline"><span id="textCount">(0/3000)</span></div>
          <c:if test="${not empty errorMessage3}">
              <div class="error-message">${errorMessage3}</div>
          </c:if>
        </div>
    </div>

    <div class="rowQ">
        <div class="btn" style="flex:1; background-color: #0054d1;">
            <label><input type="button" value="목록으로" onClick="location.href='qnaList'" /></label>
        </div>
        <div class="btn" style="flex:1; background-color: #2faaff;">
            <label><input type="submit" value="작성완료" /></label>
        </div>
    </div>
</form>

  </article>
</section>
<%@ include file="../footer.jsp" %>