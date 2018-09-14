// 검색시 단어 자동완성
$(function() {
	var countries = [ "대한민국", "중국", "일본", "멕시코", "영국", "미국", "호주", "남아프리카공화국",
			"뉴질랜드", "캐나다", "프랑스", "스위스", "독일" ];

	$("#auto").autocomplete({
		source : countries
	});
});