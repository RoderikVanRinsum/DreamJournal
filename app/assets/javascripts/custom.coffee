# fix for Rails 4 turbolinks
ready = ->
  $('#add-dream').on "click", (e) ->
    e.preventDefault()
    $('article').slideToggle()

$(document).ready ready
$(document).on 'page:load', ready