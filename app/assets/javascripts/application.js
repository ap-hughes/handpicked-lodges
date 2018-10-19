//= require rails-ujs
//= require ckeditor/init
//= require_tree .
//= require jquery
//= require jquery-ui
//= require jquery.slick
//= require bootstrap-sprockets

// $(document).ready(function() {
//   $("#accordion").accordion({
//     collapsible: true
//   });
// });
// $(".header").click(function () {

//     $header = $(this).parents(".description-text");
//     //getting the next element
//     $content = $(".description-text");

//     //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
//     $content.slideToggle(500, function () {
//         //execute this after slideToggle is done
//         //change text of header based on visibility of content div
//         $header.text(function () {
//             //change text based on condition
//             return $content.is(":visible") ? "Collapse" : "More Detail";
//         });
//     });

// });
// $(document).ready(function(){
//   $('.slider').slick({
//       slidesToShow: 1,
//       slidesToScroll: 1,
//       arrows: true,
//       fade: true,
//       asNavFor: '.slider-nav'
//   });
//   $('.slider-nav').slick({
//       slidesToShow: 3,
//       slidesToScroll: 1,
//       asNavFor: '.slider',
//       dots: true,
//       arrows: true,
//       centerMode: false,
//       focusOnSelect: true
//   });
//   // $('.carousel').slick({
//   // slidesToShow: 1,
//   // dots:true,
//   // centerMode: true,
//   // });
//   // $('.slider-for').slick({
//   // slidesToShow: 1,
//   // slidesToScroll: 1,
//   // arrows: false,
//   // fade: true,
//   // asNavFor: '.slider-nav'
//   // });
//   // $('.slider-nav').slick({
//   //   slidesToShow: 3,
//   //   slidesToScroll: 1,
//   //   asNavFor: '.slider-for',
//   //   dots: true,
//   //   focusOnSelect: true
//   // });
// });
