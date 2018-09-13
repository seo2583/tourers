<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp" %>
<script> 
	var tr_id = "${ user.tr_id }";
</script>
<script src="/tourers/js/loginCheck.js"></script>
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
      <div class="view">
        <img src="../img/view.jpg" />
        <form action="#" method="post">
		  <table>
			<tr>
			  <td>제목</td>
			  <td><input type="text" name="title" value="${ view.title }" readonly /></td>
			</tr>
	        <tr>
			  <td>작성자</td>
			  <td><input type="text" name="tr_nick" value="${ view.tr_nick }" readonly /></td>
			</tr>
			<c:if test="${ !empty file }">
			<tr>
			  <td>첨부파일</td>
			  <td>
				<a href="/tourers/board/fileDown.do?seq=${ view.seq }">${ file.oldName }</a>
				<span>${ file.download }회 다운로드</span>
			  </td>
			</tr>
			</c:if>
			<tr>
			  <td>내용</td>
			  <td><textarea name="content" rows="25" readonly>${ view.content }</textarea></td>
			</tr>
		  </table>
		</form>
		
        <nav>
          <span>댓글 ${ view.comment } </span>
          <span>조회수 ${ view.hit }</span>
        </nav>
        
        <!-- 댓글리스트 -->
		<section class="comments">
		  <h3>댓글목록</h3>
		  <c:forEach var="comment" items="${ comments }" >
		  <div class="comment">
			<span>
			  <span>${ comment.tr_nick }</span>
			  <span>${ fn:substring(comment.regdate, 2, 10) }</span>
			</span>
			<textarea readonly>${ comment.content }</textarea>
			<c:if test="${ comment.tr_id eq user.tr_id }">
			<div>
			  <a href="/tourers/board/comment_delete.do?cat=${ cat }&pg=${ pg }&seq=${ view.seq }&c_seq=${ comment.seq }" class="del">삭제</a>
			</div>
			</c:if>
		  </div>
		  </c:forEach>
		
		  <c:if test="${ empty comments }">
			<p class="empty">등록된 댓글이 없습니다.</p>	
		  </c:if>

	      <h3>댓글쓰기</h3>
	      <div class="comment_write">
			<form action="/tourers/board/comment_write.do?cat=${ cat }&pg=${ pg }&seq=${ view.seq }" method="post">
			  <textarea name="content" rows="4" class="comment_content"></textarea>
			  <input type="submit" class="submit" value="등록" />
			</form>
		  </div>
		</section>
        <div class="btns">
       	  <c:if test="${ view.tr_id eq user.tr_id }">
    	  <a href="/tourers/board/post_delete.do?cat=${ cat }&pg=${ pg }&seq=${ view.seq }">삭제</a>
    	  <a href="/tourers/board/modify.do?cat=${ cat }&pg=${ pg }&seq=${ view.seq }">수정</a>
    	  </c:if>
    	  <a href="/tourers/board/commu.do?cat=${ cat }&pg=${ pg }">목록</a>
    	</div>
      </div>
    </article>
  </div>
</div>
<%@ include file="../footer.jsp" %>
