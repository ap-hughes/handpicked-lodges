$(document).on('click', 'a[href^="#scroll-content"]', function (event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $($.attr(this, 'href')).offset().top -120
     }, 1200);
});
