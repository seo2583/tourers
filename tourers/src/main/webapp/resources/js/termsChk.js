$(function() {

	var nextBtn = $('.nextBtn');
	var chk1 = $('input[name=chk1]');
	var chk2 = $('input[name=chk2]');

	nextBtn.click(function() {

		var rs1 = chk1.is(':checked');
		var rs2 = chk2.is(':checked');

		if (rs1 && rs2) {
			location.href = "/tourers/member/register.do";
		} else {
			alert("이용약관과 개인정보 취급방침에 모두 동의하셔야 합니다.");
		}

	});

});