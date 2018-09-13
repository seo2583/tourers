<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <li class='on'><a href="/tourers/board/commu.do?cat=pic&pg=1">사진 공유</a></li>
        <li><a href="/tourers/board/commu.do?cat=together&pg=1">여행 동행</a></li>
        <li><a href="/tourers/board/commu.do?cat=freetalk&pg=1">자유게시판</a></li>
        <li><a href="/tourers/board/commu.do?cat=qna&pg=1">Q & A</a></li>
      </ul>
    </aside>
    <article id="board">
      <img src="../img/com_pic.jpg" alt="커뮤니티" />
      <div class="picture">
        <ul>
        	<c:forEach var="a" items="${ list }" varStatus="status">
        	<li>
              <div onclick="location.href='/tourers/board/view.do?cat=${ cat }&pg=${ pg }&seq=${ a.seq }';">
              	<img src="${ pic[status.index] }" alt="사진" />
              </div>
              <table>
                <tr><td><a href="/tourers/board/view.do?cat=${ cat }&pg=${ pg }&seq=${ a.seq }">${ a.title }</a></td><td>[${ a.comment }]</td></tr>
                <tr><td>조회 ${ a.hit }&nbsp; | &nbsp;${ fn:substring(a.regdate, 2, 10) }</td></tr>
                <tr><td>${ a.tr_nick }</td></tr>
              </table>
            </li>
        	</c:forEach>
        </ul>
        <div class="writeBtn">
        <c:if test="${ !empty user }">
          <a href="/tourers/board/write.do?cat=${ cat }&pg=${ pg }" class="btnWrite">글쓰기</a>
        </c:if>
        </div>
      </div>
      <nav class="paging">
        <span>
		<c:if test="${ pg gt 10 }"> 
		  <a href="/tourers/board/commu.do?cat=${ cat }&pg=${ previous }" class="prev">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${ begin }" end="${ end }">
		  <a href="/tourers/board/commu.do?cat=${ cat }&pg=${ i }" class="num">${ i }</a>
		</c:forEach>
		
		<fmt:parseNumber var="counts" integerOnly="true" value="${ (count - 1) / 10 }" />
		<fmt:parseNumber var="pcounts" integerOnly="true" value="${ (pg - 1) / 10 }" />
		<c:if test="${ counts ne pcounts }">
		  <a href="/tourers/board/commu.do?cat=${ cat }&pg=${ next }" class="next">다음</a>
		</c:if>
		</span>
      </nav>
    </article>
  </div>
</div>
<%@ include file="../footer.jsp" %>
