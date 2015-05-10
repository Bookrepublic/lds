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

var editor = new MediumEditor('.editable');
  $('.editable').bind('input propertychange', function() {
  $("#post_" + $(this).attr("data-field-id")).val($(this).html());
});

$(function () {
  $(".editable").mediumInsert({
    editor: editor,
    addons: {
      images: {
        imagesUploadScript: "/images/post_image"
      }
    }
  })
});

$(function() {
 $('.menu-link').bigSlide();
});

//List Books Index
var options = {
  valueNames: ['book-excerpt__title', 'book-excerpt__last-name', 'book-excerpt__number', 'book-excerpt__author']
};
var entryList = new List('books_list', options);

//Add class to search
var search = $(".search__sort");

$(".or__item").click(function (e) {
  e.preventDefault();
  if(search.hasClass("is-open")) {
    search.removeClass("is-open");
  } else {
    search.addClass("is-open");
  };
});
