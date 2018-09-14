// 사진 슬라이드 (직접 사용하여 따로 호출하지 않음)
$(function() {
	
	var current = 0;
	var max = 0;
	var container;
	var count;

	function init() {
		container = jQuery('.spot_info .spot_image');
		max = container.children().length;
		$('.spot_info > section > nav').text("1/" + max);
		
		events();
	}

	function events() {
		jQuery("button.prev").on("click", prev);
		jQuery("button.next").on("click", next);
	}

	function prev(e) {
		current--;
		if (current < 0)
			current = max - 1;
		animate();
	}

	function next(e) {
		current++;
		if (current > max - 1)
			current = 0;
		animate();
	}

	function animate() {
		count = current+1 + "/" + max;
        $('.spot_info > section > nav').text(count);

		var moveX = current * 900;
		TweenMax.to(container, 0.6, {
			marginLeft : -moveX,
			ease : Expo.easeOut
		});
	}

	jQuery(document).ready(init);

});
