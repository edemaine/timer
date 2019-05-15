renderTimePart = (x) -> x.toString().padStart 2, '0'

class Timer
  constructor: (@dom) ->
    @duration = 10 * 60 * 1000  # 10 minutes
    @started = null
    @elapsed = 0
  addDuration: (minutes = 0, seconds = 0) ->
    @duration.minutes += minutes
    @duration.seconds += seconds
    @update()

  remaining: ->
    left = @duration
    left -= @elapsed
    if @started
      now = new Date
      left -= now - @started
    left
  update: ->
    left = @remaining()
    left /= 1000
    @dom.getElementById 'minutes'
    .textContent = renderTimePart left // 60
    @dom.getElementById 'seconds'
    .textContent = renderTimePart Math.floor left %% 60

  toggle: ->
    if @started?
      @pause()
    else
      @start()
  start: ->
    return if @started?
    @started = new Date
    @schedule()
  pause: ->
    return unless @started?
    clearTimeout @timeout if @timeout?
    now = new Date
    @elapsed += now - @started
    @started = null
    @update()
  reset: ->
    @pause()
    @elapsed = 0

  schedule: ->
    next = @remaining()
    next -= Math.floor next
    @timeout = setTimeout =>
      @update()
      @schedule()
    , next

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
      when ' ', 'p', 'P'
        timer.toggle()
