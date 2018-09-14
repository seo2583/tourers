// 해당 영역 (div, section 등)의 크기보다 큰 text의 fontsize를 조절
$(function() {
	while ($('.resize').find('a').width() > $('.resize').width()) {
		var fontsize = parseInt($('.resize').find('a').css('font-size'));
		$('.resize').find('a').css('font-size', fontsize - 2);
	}
});