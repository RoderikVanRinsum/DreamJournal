# fix for Rails 4 turbolinks
ready = ->
  if form_hidden then $('.dream-form').hide() else $('.dream-form').show()
  $('#add-dream').unbind('click').on "click", (e) ->
    e.preventDefault()
    e.stopPropagation()
    $('.dream-form').slideToggle(700)
    return false

$(document).ready ready
$(document).on 'page:load', ready

