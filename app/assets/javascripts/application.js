
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

//List Books Index
$(function() {
  var options = {
    valueNames: ['book-excerpt__title', 'book-excerpt__last-name', 'book-excerpt__number', 'book-excerpt__author']
  };
  var entryList = new List('books_list', options);
});

//List Authors Inde
$(function() {
  var author_index = {
    valueNames: ['author-excerpt__first', 'author-excerpt__last']
  };
  var entryList = new List('authors_list', author_index);
});

//List Videos Index
$(function() {
  var video_index = {
    valueNames: ['video-excerpt__title', 'vtag', 'vsponsor', 'vbook', 'vpubblication', 'vwriter', 'vauthor']
  };
  var entryList = new List('videos_list', video_index);
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
      strings: ["Un bel sito per LDS"],
      typeSpeed: 30,
      backDelay: 500,
      loop: false,
      contentType: 'html', // or text
      // defaults to false for infinite loop
      loopCount: false,
      callback: function(){ foo(); },
      resetCallback: function() { newTyped(); }
  });

  $("#home_h4").typed({
      strings: ["Cose che non ho, cose che non avrei potuto avere mai."],
      typeSpeed: 30,
      backDelay: 500,
      loop: false,
      contentType: 'html', // or text
      // defaults to false for infinite loop
      loopCount: false,

  });

  $(".reset").click(function(){
      $("#typed").typed('reset');
  });

});

function newTyped(){ /* A new typed object */ };
