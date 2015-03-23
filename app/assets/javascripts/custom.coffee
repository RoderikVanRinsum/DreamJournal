# todo: figure out if 'unbind', 'stoppropagation' or 'return false' fixed the slidetoggle bug
# fix for Rails 4 turbolinks
ready = ->
  if form_hidden then $('.dream-form').hide() else $('.dream-form').show()
  $('#add-dream').unbind('click').on "click", (e) -> # unbind to prevent slidetoggle from both
                                                     # opening and closing on heroku
    e.preventDefault()
    $('.dream-form').slideToggle(700)
    return false

$(document).ready ready
$(document).on 'page:load', ready

