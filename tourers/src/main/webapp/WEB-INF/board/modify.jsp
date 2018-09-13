<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<div class="sub">
  <section class="bg">
    <img src="../img/aside_bg.jpg" alt="배경" />
  </section>
  <div>
    <aside>
      <img src="../img/com_logo.jpg" alt="소개" />
      <ul>
        <li><a href="/tourers/board/commu.do?cat=info&pg=1">정보 공유</a></li>
        <li><a href="/tourers/board/commu.do?cat=pic&pg=1">사진 공유</a></li>
        <li><a href="/tourers/board/commu.do?cat=together&pg=1">여행 동행</a></li>
        <li><a href="/tourers/board/commu.do?cat=freetalk&pg=1">자유게시판</a></li>
        <li><a href="/tourers/board/commu.do?cat=qna&pg=1">Q & A</a></li>
      </ul>
    </aside>
    <article id="board">
      <img src="../img/com_${ cat }.jpg" alt="커뮤니티" />
      <div class="write">
        <img src="../img/modify.jpg" alt="글쓰기" />
        <form action="/tourers/board/modify.do?cat=${ cat }&pg=${ pg }&seq=${ vo.seq }" method="post">
		  <table>
		  	<tr>
			  <td>제목</td>
			  <td><input type="text" name="title" value="${ vo.title }" required /></td>
		    </tr>
		    <c:if test="${ !empty bfvo }">
	        <tr>
		  	  <td>첨부 파일 </td>
		  	  <td>${ bfvo.oldName }</td>
		    </tr>
		    </c:if>
		    <tr>
		  	  <td>내용</td>
		  	  <td><textarea name="content" rows="25" required>${ vo.content }</textarea></td>
		    </tr>
		  </table>
		  <div class="btns">
		    <a href="/tourers/board/view.do?cat=${ cat }&pg=${ pg }&seq=${ vo.seq }" class="cancel">취소</a>
		    <input type="submit" class="submit" value="작성완료" />
		  </div>
		</form>
      </div>
    </article>
  </div>
</div>
<%@ include file="../footer.jsp" %>
