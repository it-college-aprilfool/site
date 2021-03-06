teachers = [ 'tsuyopon', 'akamine', 'arakaki', 'masami', 'mizobe',
             'nakazato', 'nohara', 'okuto', 'omas', 'sueyoshi',
             'suzuki', 'yamauchi', 'yonashiro', 'kocho']
storage = null
$ ->
  storage = JSON.parse(localStorage.getItem('teachers'))
  if storage == null
    storage = { tsuyopon:false, akamine:false, arakaki:false, masami:false, mizobe:false, nakazato:false, nohara:false, okuto:false, omas:false, sueyoshi:false, suzuki:false, yamauchi:false, yonashiro:false, kocho: false}
    localStorage.setItem('teachers', JSON.stringify(storage))
  $('#comp').text(complete())

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
      $("#g").unbind()
      $("#c").unbind()
      $("#p").unbind()
      $("#g").click ->
        $("#title").text(judge(choice[0]))
        fadeOutJanken()
      $("#c").click ->
        $("#title").text(judge(choice[1]))
        fadeOutJanken() 
      $("#p").click ->
        $("#title").text(judge(choice[2]))
        fadeOutJanken()



    judge = (my) ->
      console.log 'call judge'
      enemy = choice[Math.floor(Math.random() * choice.length)]

      $('.enemyhand').frameAnimation(loop:false)
      hoge = setInterval( ->
        left = -(choice.indexOf(enemy)) * setWidth
        $('.enemyhand').css({'background-position': left + 'px ' + '0px'})
        clearInterval(hoge)
      , 300)

      table = {g:'c', c:'p', p:'g'}
      switch enemy
        when table[my] then dropTeacher('Win')
        when my then dropTeacher('Draw')
        else
          dropTeacher(null)

    dropTeacher = (result) ->
      switch result
        when 'Win'
          teacher = teachers[Math.floor(Math.random() * teachers.length)]
          alert '勝った! そして何かドロップしたようだ…'
        when 'Draw'
          teacher = teachers[Math.floor(Math.random() * teachers.length)]
          alert '引き分けだけど…何かドロップしてるよ…?'
        else
          teacher = teachers[0]
          alert '負けだ!しかしtypnが落ちてる!'
      storage[teacher] = true
      localStorage.setItem('teachers', JSON.stringify(storage))
      return teacher

  centeringModalSyncer = () ->
    w = $(window).width()
    h = $(window).height()

    pxleft = w / 4
    #pxtop = h / 4
    pxtop = 0

    $("#game_janken").css({"left": pxleft + "px"})
    $("#game_janken").css({"top": pxtop + "px"})


  fadeOutJanken = () ->
    $('#game_janken').fadeOut('slow')
    $('#comp').text(complete())

complete = () ->
  count = 0
  for i in teachers
    if storage[i]
      count++
  return ~~(count / teachers.length * 100) + '%'
