
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require medium-editor
//= require bigSlide
//= require iacquire-medium-editor-insert-plugin
//= require listjs
//= require typed
//= require isotope
//= require site_isotope
//= require filtrr2

var editor = new MediumEditor('.editable');
  $('.editable').bind('input propertychange', function() {
  $("#post_" + $(this).attr("data-field-id")).val($(this).html());
});

$(".editable").mediumInsert({
  editor: editor,
  addons: {
    images: {
      imagesUploadScript: "/images/post_image"
    }
  }
});


$(function() {
 $('.menu-link').bigSlide();
});

//Add class to search
$(function() {
  var search = $(".search__sort");

  $(".or__item").click(function (e) {
    e.preventDefault();
    if(search.hasClass("is-open")) {
      search.removeClass("is-open");
    } else {
      search.addClass("is-open");
    };
  });
});

// Toggle
document.addEventListener('DOMContentLoaded', function(){
  var elements = document.querySelectorAll('[data-class-toggle]');

  Array.prototype.forEach.call(elements, function(el, i) {
    var classToToggle = el.getAttribute('data-class-toggle');
    var elToToggle = document.querySelector(el.getAttribute('data-element'));

    el.addEventListener('click', function(e) {
      var method = elToToggle.classList.contains(classToToggle) ? 'remove' : 'add';
      elToToggle.classList[method](classToToggle);
      e.stopPropagation();
      e.preventDefault();
    });
  });
});


// Typed

$(function(){

  $("#home_h1").typed({
      strings: [""],
      typeSpeed: 30,
      backDelay: 500,
      loop: false,
      showCursor: false,
      loopCount: false,
  });

  $("#home_h4").typed({
      strings: ["George Steiner"],
      typeSpeed: 30,
      backDelay: 500,
      loop: false,
      showCursor: false,
      loopCount: false,

  });

});

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-63038025-1', 'auto');
ga('send', 'pageview');
