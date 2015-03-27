$ ->
  rosterWindow = $('#roster')
  aucolle = $('#aucolle')
  rosterWidth = rosterWindow.outerWidth()

  $('#rosterView').click ->
    console.log 'auau'
    aucolle.toggleClass('open')
    if aucolle.hasClass('open')
      rosterWindow.css('display', 'block')
      aucolle.animate({'left' : rosterWidth}, 300)
      rosterWindow.animate({'left' : 0}, 300)
    else
      rosterWindow.css('display', 'none')
      rosterWindow.animate({'left' : -rosterWindow}, 300)
      aucolle.animate({'left' : 0}, 300)
