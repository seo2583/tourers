$(function() {
	
	var form = $('.register > form');
	var regName = /^[가-힣]{2,5}$/;
	var regPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}$/;
	
	$('input[name=tr_name]').blur(function(){
			
		var name = $(this).val();
		
		if (name == '') {
			$('.resultName').css('color', 'red').text('필수 정보입니다.');
		} else {
			if (!regName.test(name)) {
				$('.resultName').css('color', 'red').text('형식에 맞지 않습니다.');
			}  else {
				$('.resultName').css('color','green').text('');
			}
		}
	});
	
	$('input[name=tr_pass]').blur(function(){
		
		var pass = $(this).val();
		
		if (pass == '') {
			$('.resultPass').css('color', 'red').text('필수 정보입니다.');
		} else {
			if (!regPw.test(pass)) {
				$('.resultPass').css('color', 'red').text('형식에 맞지 않습니다.');
			}  else {
				$('.resultPass').css('color','green').text('사용 가능한 비밀번호 입니다.');
			}
		}
	});
	
	$('input[name=tr_pass2]').blur(function(){
			
		var pass = $('input[name=tr_pass]').val();
		var pass2 = $(this).val();
		
		if (pass2 == '') {
			$('.resultPass2').css('color', 'red').text('필수 정보입니다.');
		} else {
			if (pass != pass2) {
				$('.resultPass2').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			}  else {
				$('.resultPass2').css('color','green').text('');
			}
		}
	});

	// 회원가입버튼을 클릭했을때
	form.submit(function(){
		
		var pw1 = $('input[name=tr_pass]').val();
		var pw2 = $('input[name=tr_pass2]').val();
		var name = $('input[name=tr_name]').val();
		
		if (!isIdOK) {
			alert("아이디를 다시 입력하세요.");
			return false;
		}
		
		if (!regPw.test(pw1)) {
			alert("비밀번호 형식에 맞지 않습니다.");
			return false;
		}
		
		if (pw1 != pw2) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
 
		if (!regName.test(name)) {
			alert("정확하게 이름을 입력해주세요.");
			return false;
		}
		
		if (!isNickOK) {
			alert("닉네임을 다시 확인해주세요.");
			return false;
		}

		if (!isEmailOK) {
			alert("이메일주소를 다시 확인해주세요.");
			return false;
		}

		return true;
	});
	
});