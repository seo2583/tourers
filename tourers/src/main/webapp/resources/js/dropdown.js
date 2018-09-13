$(function(){

  $(".menu_bar li").hover(function(){

    $("ul:first", this).show();
  }, function(){
    $("ul:first", this).hide();
  });

  $(".menu_bar ul li:has(ul)")
    .append("<p style='float:right;'>&#9656;</p>");
});
