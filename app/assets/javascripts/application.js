// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets

// トップへスクロール
$(document).ready(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});
$(document).ready(function () {
  $("#fade_about").skippr({
    transition : 'slide',
    speed : 2000,
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 3000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

// 退会へのボタン
$(document).ready(function(){
   $('.hidden_box').on('click',function(){
       $('.hidden_show').stop().slideToggle();
   });
});
// 写真プレビュー
$(function(){
  function readURL(input){
    if (input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function(e){
        $('.img_prev').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('.img_field').change(function(){
    readURL(this);
  });  
});