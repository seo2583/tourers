$(function() {
	while ($('.resize').find('a').width() > $('.resize').width()) {
		var fontsize = parseInt($('.resize').find('a').css('font-size'));
		$('.resize').find('a').css('font-size', fontsize - 2);
	}
});