// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require fotorama
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require owl.carousel

$(document).ready(function() {
    $(".fc-slide").owlCarousel({
      autoPlay: 7000,
      singleItem: true,
      stopOnHover: true,
      slideSpeed: 500,
      paginationSpeed: 500,
      rewindSpeed: 1000,
      navigation: true,
      navigationText: ['<span class="ion-chevron-left"></span>','<span class="ion-chevron-right"></span>']
    });
});
  
