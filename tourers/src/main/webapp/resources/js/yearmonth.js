$(function(){

  var dt = new Date();
  var year = "";

  $(".year").append("<option>-- 년 --</option>");
  $(".month").append("<option>-- 월 --</option>");

  for (var y = dt.getFullYear(); y >= 1950; y--){
    $(".year").append("<option value='"+ y +"'>"+ y +"</option>");
  }

  for (var i = 1; i <= 12 ; i++){
    $(".month").append("<option value='"+ i +"'>"+ i +"</option>");
  }

});
