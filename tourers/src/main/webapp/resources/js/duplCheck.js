// ajax통신을 위한 중복 체크 
// 전역변수는 form전송시 체크하기 위한 선언

var isIdOK = false;
var isNickOK = false;
var isEmailOK = false;

$(document).ready(function(){
				
	$('input[name=tr_id]').blur(function(){
		
		var uid = $(this).val();
		var json = {"type":"0", "value":uid};
		var regId = /^[a-z]+[a-z0-9]{3,12}$/g;
		
		$.ajax({
			url: '/tourers/member/duplCheck.do',
			data: json,
			type: 'POST',
			success: function(obj){
				if(obj.result == 1){
					$('.resultId').css('color','red').text('이미 사용중인 아이디입니다.');
					isIdOK = false;
				} else {
					if(uid == ''){
						$('.resultId').css('color','red').text('필수 정보입니다.');
						isIdOK = false;
					} else {
						if(!regId.test(uid)){
							$('.resultId').css('color', 'red').text('아이디 형식에 맞지 않습니다.');
							isIdOK = false;
						} else {
							$('.resultId').css('color','green').text('사용 가능한 아이디입니다.');
							isIdOK = true;
						}
					}
				}
			}
			
		});
		
	});
					
	$('input[name=tr_nick]').blur(function(){
		
		var nick = $(this).val();
		var json = {"type":"1", "value":nick};
		var regNick = /[0-9]|[a-z]|[A-Z]|[가-힣]{2,20}$/;
		
		$.ajax({
			url: '/tourers/member/duplCheck.do',
			data: json,
			type: 'POST',
			success: function(obj){
				if(obj.result == 1){
					$('.resultNick').css('color','red').text('이미 사용중인 닉네임입니다.');
					isNickOK = false;
				} else {
					if(nick == ''){
						$('.resultNick').css('color', 'red').text('필수 정보입니다.');
						isNickOK = false;
					} else {
						if(!regNick.test(nick)){
							$('.resultNick').css('color', 'red').text('닉네임 형식에 맞지 않습니다.');
							isNickOK = false;
						} else {
							$('.resultNick').css('color','green').text('사용 가능한 닉네임입니다.');
							isNickOK = true;
						}
					}
				}
			}
			
		});
		
	});
	
	$('input[name=tr_email]').blur(function(){
		
		var email = $(this).val();
		var json = {"type":"2", "value":email};
		var regMail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
		
		$.ajax({
			url: '/tourers/member/duplCheck.do',
			data: json,
			type: 'POST',
			success: function(obj){
				if(obj.result == 1){
					$('.resultEmail').css('color','red').text('이미 사용중인 이메일입니다.');
					isEmailOK = false;
				} else {
					if(email == ''){
						$('.resultEmail').css('color', 'red').text('필수 정보입니다.');
						isEmailOK = false;
					} else {
						if(!regMail.test(email)){
							$('.resultEmail').css('color', 'red').text('이메일 형식에 맞지 않습니다.');
							isEmailOK = false;
						} else {
							$('.resultEmail').css('color','green').text('사용 가능한 이메일입니다.');
							isEmailOK = true;
						}
					}

				}
			}
			
		});
		
	});
	
});