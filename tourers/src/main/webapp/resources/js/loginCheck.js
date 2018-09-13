$(function(){
		
	var comment_content = $(".comment_content");

	comment_content.click(function(){
		
		if(tr_id == ""){
			if (confirm('로그인 후에 댓글을 작성할 수 있습니다.\n로그인 화면으로 이동 하시겠습니까?')){
				location.href = "/tourers/member/login.do";
			}
			else {
				comment_content.attr('readonly','readonly');
				return false;
			}
		}
		
	});
	
});