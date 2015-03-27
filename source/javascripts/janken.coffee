teachers = [ 'typosone', 'yona', 'omas', 'masami', 'mizobe',
             'arakaki', 'tyou', 'suzuki', 'okuto', 'akamine',
             'yamauchi', 'nakazato', 'shiroma', 'sueyoshi']
storage = null
$ ->
  storage = JSON.parse(localStorage.getItem('teachers'))
  if storage == null
    storage = { typosone:false, yona:false, omas:false, masami:false, mizobe:false, arakaki:false, tyou:false, suzuki:false, okuto:false, akamine:false, yamauchi:false, nakazato:false, shiroma:false, sueyoshi:false }
    localStorage.setItem('teachers', JSON.stringify(storage))
  $('#comp').text(compleat())

  $('#gamestart').click ->
    $("#title").text('アザラシじゃんけん')
    $('#game_janken').fadeIn('slow')
    centeringModalSyncer()

    choice = ['g', 'c', 'p']
    setWidth = 100
      
    $ ->
      $('.enemyhand').frameAnimation(
        setWidth: setWidth,
        frameSpeed: 70,
        maxFrame: 3
      )

    $ ->
      $("#g").click ->
        $("#title").text(judge(choice[0]))
        fadeOutJanken()

      $("#c").click ->
        $("#title").text(judge(choice[1]))
        fadeOutJanken()

      $("#p").click ->
        $("#title").text(judge(choice[2]))
        fadeOutJanken()

      console.log JSON.parse(localStorage.getItem('teachers'))


    judge = (my) ->
      enemy = choice[Math.floor(Math.random() * choice.length)]

      $('.enemyhand').frameAnimation(loop:false)
      hoge = setInterval( ->
        left = -(choice.indexOf(enemy)) * setWidth
        $('.enemyhand').css({'background-position': left + 'px ' + '0px'})
        clearInterval(hoge)
      , 300)

      table = {g:'c', c:'p', p:'g'}
      switch enemy
        when table[my] then return dropTeacher('Win')
        when my then return dropTeacher('Draw')
        else
          return dropTeacher(null)

    dropTeacher = (result) ->
      switch result
        when 'Win' then teacher = teachers[Math.floor(Math.random() * teachers.length)]
        when 'Draw' then teacher = teachers[Math.floor(Math.random() * teachers.length)]
        else teacher = teachers[0]
      storage[teacher] = true
      localStorage.setItem('teachers', JSON.stringify(storage))
      return teacher

  centeringModalSyncer = () ->
    w = $(window).width()
    h = $(window).height()
    console.log h

    pxleft = w / 4
    #pxtop = h / 4
    pxtop = 0

    $("#game_janken").css({"left": pxleft + "px"})
    $("#game_janken").css({"top": pxtop + "px"})


  fadeOutJanken = () ->
    $('#game_janken').fadeOut('slow')
    $('#comp').text(compleat())

compleat = () ->
  count = 0
  for i in teachers
    if storage[i]
      count++
    else
      console.log i
  return ~~(count / teachers.length * 100) + '%'
