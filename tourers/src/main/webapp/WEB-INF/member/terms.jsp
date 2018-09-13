<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<script src="/tourers/js/termsChk.js"></script>
<div id="member">
  <div class="term">
    <section>
      <h1>회원약관동의</h1>
      <p>하단의 약관 내용을 확인하시고 동의여부를 결정해주십시오.</p>
    </section>
    <section>
      <table>
        <caption>- 이용약관</caption>
        <tr>
          <td>
            <textarea readonly>${ terms.terms }</textarea>
            <div>
              <label>
                <input type="checkbox" name="chk1" />
                &nbsp;동의합니다.
              </label>
            </div>
          </td>
        </tr>
      </table>
    </section>
    <section>
      <table>
        <caption>- 개인정보 취급방침</caption>
        <tr>
          <td>
            <textarea readonly>${ terms.privacy }</textarea>
            <div>
              <label>
                <input type="checkbox" name="chk2" />
                &nbsp;동의합니다.
              </label>
            </div>
          </td>
        </tr>
      </table>
    </section>
    <section>
      <a href="/tourers/member/login.do">취소</a>
      <a href="#" class="nextBtn">다음</a>
    </section>
  </div>
</div>
<%@ include file="../header.jsp" %>