$(function() {
	
	$(".search").on("submit", function(event){
		event.preventDefault();
		
		var nationName = $("#auto").val();
		
		$.ajax({
			url: '/tourers/nation/isNation.do?nationName='+nationName,
			type: 'GET',
			success: function(result){
				if(result == 1){
					location.href = '/tourers/nation/nationInfo.do?nationName='+nationName;			
				}	
				else{
					alert("죄송합니다. "+nationName+"의 검색 결과를 찾을 수 없습니다. \n다시 시도해 주세요.")	
				}
			}
		
		});
		
	});
	
});