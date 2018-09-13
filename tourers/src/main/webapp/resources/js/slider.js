$(function(){

  var slides = $('.slider > ul > li');
  var i = 0;

  setInterval(function(){
    slides.eq(i).animate({'left' : '-100%'}, 1000);
    i++;

    if (i == 4){
      i=0;
    }

    slides.eq(i).css('left', '100%').animate({'left' : '0'}, 1000);

  }, 4000);
});
