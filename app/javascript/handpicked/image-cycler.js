$(document).ready(function(){
  $('.back-img').hide();
  function anim() {
      $("#image-cycler img").first().appendTo('#image-cycler').fadeOut(1500);
      $("#image-cycler img").first().fadeIn(1500);
      setTimeout(anim, 5000);
  }
  anim();
});
