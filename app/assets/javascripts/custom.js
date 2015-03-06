$(document).ready(function () {
  $('#add-dream').on("click", function(e) {
    e.preventDefault();
    $('article').slideToggle();
  });
});