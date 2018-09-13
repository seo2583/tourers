<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script>
<script src="/tourers/js/fontsize.js"></script> 
<script>
	$(function(){
		
		$(".spot_btn button").click(function(){
			$(".spot_info").css("display","block");
			
			var index = $('.spot_btn button').index(this);
			var spotNameArray = new Array();
			var spotName = "";
			
			$(".spot").each(function(i, e){
				spotNameArray.push($(this).val());
			});
			
			spotName = spotNameArray[index];
			
			$.ajax({
				url: '/tourers/nation/spotDetail.do?spotName='+spotName,
				type: 'GET',
				success: function(result){
		 			
					$('h2').html(result.tr_spot_name);
					$('.name').html(result.tr_spot_name);
					$('.time').html(result.tr_time);
					$('.money').html(result.tr_money);
					$('.homepage').html(result.tr_homepage);
					$('.location').html(result.tr_location_addr);
					$('.tip').html(result.tr_tip);
					$('.title').html(result.tr_spot_explain_title);					
					$('.content').html(result.tr_spot_explain_content);
					$('.spot_image *').remove();
					
					$('.spot_image').append('<li><img class="img" src="/tourers/' +  result.tr_spot_img1 + '" alt="스팟사진1"></li>');
					
					if( result.tr_spot_img2 != null){
						$('.spot_image').append('<li><img class="img" src="/tourers/' +  result.tr_spot_img2 + '" alt="스팟사진2"></li>');
					}
					if( result.tr_spot_img3 != null){
						$('.spot_image').append('<li><img class="img" src="/tourers/' +  result.tr_spot_img3 + '" alt="스팟사진3"></li>');
					}
					if( result.tr_spot_img4 != null){
						$('.spot_image').append('<li><img class="img" src="/tourers/' +  result.tr_spot_img4 + '" alt="스팟사진4"></li>');
					}
					if( result.tr_spot_img5 != null){
						$('.spot_image').append('<li><img class="img" src="/tourers/' +  result.tr_spot_img5 + '" alt="스팟사진5"></li>');
					}
					
					picMove();
					
				}
				
			});
			
		});
	
		var max = 0;
		var current = 0;
		var container;
		var count;
		
		function picMove(){
			console.log(current);
			container = jQuery('.spot_info .spot_image');
			max = container.children().length;
			$('.spot_info > section > nav').text(current+1 + "/" + max);
			
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
		
	});
</script>
<!-- <script src="/tourers/js/picMove.js"></script> -->

<div class="sub">
  <section class="bg">
    <img src="../img/aside_bg.jpg" alt="배경" />
  </section>
  <div>
    <aside>
      <ul>
        <li class="resize"><a href="/tourers/nation/nationInfo.do?nationName=${ nName }">${ nName }</a></li>
        <li class="on"><a href="/tourers/nation/spotName.do?nationName=${ nName }">주요 관광지</a></li>
        <li><a href="#">액티비티</a></li>
        <li><a href="#">투어</a></li>
        <li><a href="#">맛집</a></li>
        <li><a href="#">시장 & 공원</a></li>
        <li><a href="#">여행 후기</a></li>
      </ul>
    </aside>
    <article id="board">
      <div class="tour_spot">
        <nav class="spot_btn">
          <c:forEach var="s" items="${ spots }">
          <button class="spot" type="button" value="${ s.tr_spot_name }">${ s.tr_spot_name }</button>
          </c:forEach>
          <c:if test="${ empty spots }">
          	<p>업데이트 중입니다.<br /><br />(영국만 가능)</p>
          </c:if>
        </nav>
        <div class="spot_info">
          <section>
            <h2>관광지이름</h2>
            <button class="like"><i class="far fa-heart"></i></button>
            <ul class="spot_image">
            </ul>
            <nav></nav>
            <button class="picMove prev" type="button"></button>
            <button class="picMove next" type="button"></button>
          </section>
          <div class="spot_intro">
            <ul>
              <li><i class="fas fa-tag"></i><span class="name">관광지이름</span></li>
              <li><i class="far fa-clock"></i><span class="time">관광지 운영시간</span></li>
              <li><i class="fas fa-money-bill"></i><span class="money">비용</span></li>
            </ul>
            <ul>
              <li><i class="fas fa-link"></i><span class="homepage">홈페이지주소</span></li>
              <li><i class="fas fa-map-marker-alt"></i><span class="location">위치</span></li>
              <li><i class="far fa-hand-point-right"></i><span class="tip">꿀팁</span></li>
            </ul>
          </div>
          <div class="spot_explain spot_explain_title">
           	<span class="title">관광지 설명 타이틀</span>
          </div>
          <div class="spot_explain spot_explain_content">
           	<span class="content">관광지 설명 내용</span>
          </div>
        </div>
      </div>
    </article>
  </div>
</div>
<%@ include file="../footer.jsp" %>