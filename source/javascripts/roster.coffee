$ ->
  teachers = [ 'tsuyopon', 'akamine', 'arakaki', 'masami', 'mizobe',
               'nakazato', 'nohara', 'okuto', 'omas', 'sueyoshi',
               'suzuki', 'yamauchi', 'yonashiro', 'kocho']
  rosterWindow = $('.roster')
  aucolle = $('#aucolle')
  rosterWidth = rosterWindow.outerWidth()

  $('#rosterView').click ->
    storage = JSON.parse(localStorage.getItem('teachers'))
    for i in teachers
      if storage != null and storage[i]
        $('.teachers').append('<li> <img src="./images/teachers_icon/icon_' + i + '.png" alt=""> </li>')
      else
        $('.teachers').append('<li> <img src="./images/teachers_icon/empty_icon2.png" alt=""> </li>')
    rosterSlide()

    $('li').click ->
      index = $('li').index(this)
      if storage[teachers[index]]
        $('#detail').html('<img src="./images/teachers_detail/detail_' + teachers[index] + '.png" alt="">')

  $('#exit').click ->
    rosterSlide()
  rosterSlide = ->
    aucolle.toggleClass('open')
    if aucolle.hasClass('open')
      aucolle.animate({'left' : rosterWidth }, 300)
      rosterWindow.animate({'left' : 390}, 300)
    else
      #$('li').remove()
      rosterWindow.animate({'left' : -rosterWidth }, 300)
      aucolle.animate({'left' : -275}, 300)
