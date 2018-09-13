<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<script>
	var latitude = "${ nation.tr_capital_lat }";
	var longitude = "${ nation.tr_capital_long }";
	var zoom_lev = ${ nation.tr_capital_zoom };
	var capital_name = "${ nation.tr_capital_name }";
</script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyDzhRBs4fQds-EhiYMeaoimO3Jed6J11wo"></script>
<script src="/tourers/js/location_googleMap.js"></script>
<script src="/tourers/js/fontsize.js"></script> 

<div class="sub">
  <section class="bg">
    <img src="/tourers/img/aside_bg.jpg" alt="배경" />
  </section>
  <div>
    <aside>
      <ul>
        <li class="resize"><a href="/tourers/nation/nationInfo.do?nationName=${ nation.tr_country_name_simple }">${ nation.tr_country_name_simple }</a></li>
        <li><a href="/tourers/nation/spotName.do?nationName=${ nation.tr_country_name_simple }">주요 관광지</a></li>
        <li><a href="#">액티비티</a></li>
        <li><a href="#">투어</a></li>
        <li><a href="#">맛집</a></li>
        <li><a href="#">시장 & 공원</a></li>
        <li><a href="#">여행 후기</a></li>
      </ul>
    </aside>
    <article id="board">
      <div class="guide">
        <div>
        <section class="flag">
            <img src="/tourers/${ nation.tr_national_flag }" alt="국기"/>
            <table>
              <caption>${ nation.tr_country_name }</caption>
              <tr>
                <td>수도</td>
                <td>${ nation.tr_capital_name }</td>
              </tr>
              <tr>
                <td>언어</td>
                <td>${ nation.tr_language }</td>
              </tr>
              <tr>
                <td>화폐단위</td>
                <td>${ nation.tr_currency }</td>
              </tr>
              <tr>
                <td>기후</td>
                <td>${ nation.tr_weather }</td>
              </tr>
            </table>
          </section>
          <img src="/tourers/${ nation.tr_nation_bg1 }" alt="사진1"/>
          <img src="/tourers/${ nation.tr_nation_bg2 }" alt="사진2"/>
          <img src="/tourers/${ nation.tr_nation_bg3 }" alt="사진3"/>
        </div>
        <div id="map_canvas"></div>
      </div>
    </article>
  </div>
</div>
<%@ include file="../footer.jsp" %>