<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section>
  <article>
    <form action="writeQna" method="post"  name="formm">
      <h2 > Q & A </h2>
      <div class="field" >
        <label>작성자</label>
        <input type="text" name="userid" />
      </div>

      <div class="field" >
        <label>제목</label>
        <input type="text" name="subject" />
      </div>
      <div class="field" >
        <label>내용</label>
        <textarea name="content" rows="10"  cols="85" style="flex:3"></textarea>
      </div>
      <div class="field" >
        <div class="btn" style="flex:1; background-color: #0054d1;"><input type="button" value="목록으로" onClick="location.href='qnaList'" /></div>
        <div class="btn"  style="flex:1; background-color: #2faaff;"><input type="submit" value="작성하기" /></div>
      </div>
    </form>
  </article>
</section>
<%@ include file="../footer.jsp" %>