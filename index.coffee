renderTimePart = (x) -> x.toString().padStart 2, '0'

class Timer
  constructor: (@dom) ->
    @duration =
      minutes: 10
      seconds: 0
  addDuration: (minutes = 0, seconds = 0) ->
    @duration.minutes += minutes
    @duration.seconds += seconds
  reset: ->
  update: ->
    @dom.getElementById 'minutes'
    .textContent = renderTimePart @duration.minutes
    @dom.getElementById 'seconds'
    .textContent = renderTimePart @duration.seconds

window.onload = ->
  timer = new Timer document.getElementById 'timer'
  timer.update()
  window.addEventListener 'keypress', (e) ->
    switch e.key
      when 'r', 'R'
        timer.reset()
      when '+', '='
        timer.addDuration 1, 0
      when '-', '_'
        timer.addDuration -1, 0
    timer.update()
