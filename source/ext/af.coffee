jQuery -> 
  now = new Date()

  if (now.getMonth()+1) is 4
    if now.getDate() is 1
      alert "あうコレ!はじまります!"
      window.location.href = "http://april.it-college.ac.jp/"
    else
      jQuery('.latestnews').prepend('<li><a href="http://april.it-college.ac.jp/">あうコレ!はじまってます!</a></li>')
  else
    console.log "まだまだ…はじまってないんだからっ!!"
