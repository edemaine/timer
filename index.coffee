bellCount = 3  # one bell at T minus 2, two bells at T minus 1, three bells at T
bellSkip = 0.3
interBellDelay = 400

minute = 60 * 1000  # 1 minute

renderTimePart = (x) -> x.toString().padStart 2, '0'

ringTimeout = null
ringBells = (count) ->
  clearTimeout ringTimeout if ringTimeout?
  bell = document.getElementById 'bell'
  bell.pause()
  bell.currentTime = bellSkip
  bell.play()
  .catch (e) -> console.error e.message
  if count > 1
    ringTimeout = setTimeout (-> ringBells count-1), interBellDelay
  null

class Timer
  constructor: (@dom, @callback) ->
    @duration = 5 * minute
    @started = null
    @elapsed = @bells = 0
  addDuration: (delta) ->
    @duration += delta
    @bells = 0
    @update()

  remaining: ->
    left = @duration
    left -= @elapsed
    if @started
      now = new Date
      left -= now - @started
    left
  update: ->
    ## Compute number of seconds left
    left = @remaining()
    left /= 1000

    ## Bell ringing
    mins = Math.ceil left / 60
    if @started and mins < bellCount
      bells = bellCount - mins
      if @bells < bells <= bellCount
        @bells = bells
        ringBells @bells

    ## Update display
    @dom.classList.toggle 'started', @started?
    if left < 0
      @dom.classList.add 'negative'
      left = -left
    else
      @dom.classList.remove 'negative'
    left = Math.ceil left
    @dom.getElementById 'minutes'
    .textContent = renderTimePart left // 60
    @dom.getElementById 'seconds'
    .textContent = renderTimePart left %% 60

    @callback?.call @, @

  toggle: ->
    if @started?
      @pause()
    else
      @start()
  start: ->
    return if @started?
    @started = new Date
    @update()
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
    @elapsed = @bells = 0
    @update()

  schedule: ->
    next = @remaining()
    next -= Math.floor next
    @timeout = setTimeout =>
      @update()
      @schedule()
    , next

toggleDark = ->
  {classList} = document.documentElement
  dark = window.matchMedia('(prefers-color-scheme: dark)').matches
  dark = true if classList.contains 'dark'
  dark = false if classList.contains 'light'
  dark = not dark
  classList.toggle 'dark', dark
  classList.toggle 'light', not dark

window.onload = ->
  timer = new Timer document.getElementById('timer'), ->
    document.getElementById('verb').innerHTML = (
      if timer.started
        'pause'
      else if timer.elapsed
        'resume'
      else
        'start'
    ) + ' timer'
  timer.update()

  window.addEventListener 'keypress', handleKey = (e) ->
    switch e.key
      when 'r', 'R'
        timer.reset()
      when '+', '='
        timer.addDuration minute
      when '-', '_'
        timer.addDuration -minute
      when ' ', 'p', 'P'
        timer.toggle()
      when 'b', 'B'
        ringBells 1
      when 'd', 'D'
        toggleDark()

  document.body.addEventListener 'click', (e) =>
    {classList} = e.target
    if classList.contains 'button'
      handleKey key: e.target.dataset.key
    else if classList.contains 'change'
      timer.addDuration e.target.dataset.seconds * 1000
