<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<script>
	var login = "${ login }";
	
	if(login == "fail") {
		alert("아이디 또는 비밀번호가 일치하지 않습니다. \n다시 확인 후 로그인 하십시요.");
	}
</script>
<div id="member">
  <div class="login">
    <img src="../img/member_txt_login.jpg" alt="로그인"/>
    <form action="#" method="post">
    <input type="hidden" name="referer" value="${ referer }"/>
      <div>
        <label>
          <span><img src="../img/member_txt_id.jpg" alt="아이디"></span>
          <input type="text" name="tr_id"/>
        </label>
        <label>
          <span><img src="../img/member_txt_pass.jpg" alt="비밀번호"></span>
          <input type="password" name="tr_pass"/>
        </label>
      </div>
      <input type="submit" value="로그인"/>
      <span>
        <a href="#">아이디찾기</a>
        <a href="#">비밀번호찾기</a>
        <a href="./terms.do">회원가입</a>
      </span>
    </form>
  </div>
</div>
<%@ include file="../footer.jsp" %>
