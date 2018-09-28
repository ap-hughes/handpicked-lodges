$(document).ready(function(){
  $('.back-img').hide();
  function anim() {
      $("#wrap img").first().appendTo('#wrap').fadeOut(1500);
      $("#wrap img").first().fadeIn(1500);
      setTimeout(anim, 5000);
  }
  anim();
});
