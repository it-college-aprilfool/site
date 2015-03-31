$ ->
  rosterWindow = $('#roster')
  aucolle = $('#aucolle')
  rosterWidth = rosterWindow.outerWidth()

  $('#rosterView').click ->
    rosterSlide()
  rosterWindow.click ->
    rosterSlide()

  rosterSlide = ->
    aucolle.toggleClass('open')
    if aucolle.hasClass('open')
      aucolle.animate({'left' : rosterWidth}, 300)
      rosterWindow.animate({'left' : 275}, 300)
    else
      console.log 'auau'
      console.log rosterWindow
      rosterWindow.animate({'left' : -rosterWidth}, 300)
      aucolle.animate({'left' : -275}, 300)
