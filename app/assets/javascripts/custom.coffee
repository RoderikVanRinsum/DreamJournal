# fix for Rails 4 turbolinks
ready = ->
  if form_hidden then $('.dream-form').hide() else $('.dream-form').show()

  # unbind to prevent slidetoggle from both opening and closing on heroku
  $('#add-dream').unbind('click').on "click", (e) -> 
    e.preventDefault()
    $('.dream-form').slideToggle(700)

$(document).ready ready
$(document).on 'page:load', ready

