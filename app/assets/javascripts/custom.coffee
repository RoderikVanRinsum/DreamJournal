# fix for Rails 4 turbolinks
ready = ->
  if form_hidden then $('.dream-form').hide() else $('.dream-form').show()
  $('#add-dream').on "click", (e) ->
    e.preventDefault()
    $('.dream-form').slideToggle(700, 'easeInSine', ->)

$(document).ready ready
$(document).on 'page:load', ready

