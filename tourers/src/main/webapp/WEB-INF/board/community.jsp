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
        <li class=${ cat eq 'info' ? 'on' : '' }><a href="/tourers/board/commu.do?cat=info&pg=1">정보 공유</a></li>
        <li class=${ cat eq 'pic' ? 'on' : '' }><a href="/tourers/board/commu.do?cat=pic&pg=1">사진 공유</a></li>
        <li class=${ cat eq 'together' ? 'on' : '' }><a href="/tourers/board/commu.do?cat=together&pg=1">여행 동행</a></li>
        <li class=${ cat eq 'freetalk' ? 'on' : '' }><a href="/tourers/board/commu.do?cat=freetalk&pg=1">자유게시판</a></li>
        <li class=${ cat eq 'qna' ? 'on' : '' }><a href="/tourers/board/commu.do?cat=qna&pg=1">Q & A</a></li>
      </ul>
    </aside>
    <article id="board">
      <img src="../img/com_${ cat }.jpg" alt="커뮤니티" />
      <div class="list">
        <table>
          <tr>
            <td>글번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회</td>
          </tr>
          <c:forEach var="a" items="${ list }">
          <tr>
            <td>
				<c:out value="${ total }"/>
				<c:set var="total" value="${ total - 1 }"/>
			</td>
            <td>
            	<a href="/tourers/board/view.do?cat=${ cat }&pg=${ pg }&seq=${ a.seq }">${ a.title }</a>
            	<c:if test="${ a.file eq 1 }">&nbsp;<i class="fa fa-file-image-o"></i></c:if>
            	&nbsp;[${ a.comment }]
            </td>
            <td>${ a.tr_nick }</td>
            <td>${ fn:substring(a.regdate, 2, 10) }</td>
            <td>${ a.hit }</td>
          </tr>
          </c:forEach>
        </table>
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
