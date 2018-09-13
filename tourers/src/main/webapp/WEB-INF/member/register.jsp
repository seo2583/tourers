<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="/tourers/js/postcode.js"></script>
<script src="/tourers/js/yearmonth.js"></script>
<script src="/tourers/js/duplCheck.js"></script>
<script src="/tourers/js/validation.js"></script>

<div id="member">
	<div class="register">
		<h1>회원가입 / 정보입력</h1>
		<form action="/tourers/member/register.do" method="post">
			<section>
				<table>
					<caption>필수정보입력</caption>
					<tr>
						<th><span class="essential">*</span>아이디</th>
						<td>
							<input type="text" name="tr_id" maxlength="12" placeholder="아이디를 입력" required /> 
							<span>&nbsp;영문(소), 숫자로 4~12자까지 설정해주세요.</span>
							<span class="result resultId"></span>
						</td>
					</tr>
					<tr>
						<th><span class="essential">*</span>비밀번호</th>
						<td>
							<input type="password" name="tr_pass" placeholder="비밀번호를 입력" required /> 
							<span>&nbsp;영문, 숫자, 특수문자를 조합하여 6~12자까지 설정해 주세요.</span>
							<span class="result resultPass"></span>
						</td>
					</tr>
					<tr>
						<th><span class="essential">*</span>비밀번호확인</th>
						<td>
							<input type="password" name="tr_pass2" placeholder="비밀번호를 확인" required /> 
							<span>&nbsp;비밀번호 재입력</span>
							<span class="result resultPass2"></span>
						</td>
					</tr>
				</table>
			</section>
			<section>
				<table>
					<caption>기본 정보입력</caption>
					<tr>
						<th><span class="essential">*</span>이름</th>
						<td>
							<input type="text" name="tr_name" placeholder="이름을 입력" required />
							<span class="resultName"></span>
						</td>
					</tr>
					<tr>
						<th><span class="essential">*</span>닉네임</th>
						<td>
							<input type="text" name="tr_nick" placeholder="닉네임을 입력" required />
							<span class="resultNick"></span>
						</td>
					</tr>
					<tr>
						<th><span class="essential">*</span>EMAIL</th>
						<td>
							<input type="email" name="tr_email" placeholder="이메일 입력" required />
							<span class="resultEmail"></span>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="tr_gender">
								<option>----</option>
								<option value="1">남</option>
								<option value="2">여</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<select class="year" name="tr_year"></select> 
							<select class="month" name="tr_month"></select>
						</td>
					</tr>
					<tr class="addr">
						<th>주소</th>
						<td>
							<div>
								<input type="text" name="tr_zip" id="zip" placeholder="우편번호 입력 클릭" readonly />
								<button type="button" class="btnFind" onclick="postcode()">주소검색</button>
							</div>
							<div>
								<input type="text" name="tr_addr1" id="addr1" size="50" placeholder="주소를 검색하세요." readonly />
							</div>
							<div>
								<input type="text" name="tr_addr2" id="addr2" size="50" placeholder="상세주소를 입력하세요." />
							</div>
						</td>
					</tr>
				</table>
			</section>
			<div>
				<input type="submit" class="join" value="회원가입" />
			</div>
		</form>
	</div>
</div>

<%@ include file="../footer.jsp"%>