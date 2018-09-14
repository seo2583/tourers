// 구글맵 표시
function initialize() {

  var mapLocation = new google.maps.LatLng(latitude, longitude); // 지도에서 가운데로 위치할 위도와 경도
  var markLocation = new google.maps.LatLng(latitude, longitude); // 마커가 위치할 위도와 경도

  var mapOptions = {
    center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
    zoom: zoom_lev, // 지도 zoom단계
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
      mapOptions);

  var size_x = 30; // 마커로 사용할 이미지의 가로 크기
  var size_y = 30; // 마커로 사용할 이미지의 세로 크기

  // 마커로 사용할 이미지 주소
  var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                      new google.maps.Size(size_x, size_y),
                      '',
                      '',
                      new google.maps.Size(size_x, size_y));

  var marker;
  marker = new google.maps.Marker({
         position: markLocation, // 마커가 위치할 위도와 경도(변수)
         map: map,
         icon: image, // 마커로 사용할 이미지(변수)
         title: capital_name // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
