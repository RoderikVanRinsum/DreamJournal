// Fix so link_to links work (broken in Rails 4 bc of turbolinks)
var ready = function() {
  $('#add-dream').on("click", function(e) {
    e.preventDefault();
    $('article').slideToggle();
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);