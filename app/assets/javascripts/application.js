// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$(function() {
  $("#categories th a, #categories .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#categories_search").keyup(function() {
    $.get($("#categories_search").attr("action"), $("#categories_search").serialize(), null, "script");
    return false;
  });
});
