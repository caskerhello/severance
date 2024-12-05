<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section>
  <article>
    <form action="writeQna" method="post"  name="formm">
      <div class="qna_top">
       
      <h2 > 고객센터 ( Q&A ) </h2>
      </div>

      <div class="row" >
        <div class="field"><label>작성자</label></div>
        <div class="field"><input type="text" name="userid" /></div>
      </div>

      <div class="row" >
        <div class="field"><label>제&nbsp;&nbsp;&nbsp;목</label></div>
        <div class="field"><input type="text" id="subjectQ" name="subject" cols="90" maxlength="300" onkeyup="counter();" /></div>
      </div>
      <div class="row" >
        <div class="field">
          <label>내&nbsp;&nbsp;&nbsp;용</label>
        </div>
        <div class="field"><textarea id="contentQ" name="content" rows="10"  cols="90" maxlength="3000" style="width:100%; resize:none;" placeholder="질문 내용을 입력하세요." onkeyup="counter();" ></textarea></div>
        <span id="textCount">(0/3000)</span>
      </div>
      <div class="row" >
        <div class="btn" style="flex:1; background-color: #0054d1;"><input type="button" value="목록으로" onClick="location.href='qnaList'" /></div>
        <div class="btn"  style="flex:1; background-color: #2faaff;"><input type="submit" value="작성완료" /></div>
      </div>
    </form>
  </article>
</section>
<%@ include file="../footer.jsp" %>