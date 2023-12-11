# Timer

This is a simple web app for counting down a desired number of minutes,
such as time-limited presentations (e.g., final projects in a class).
Main features:

* Large highly visible (and responsive) countdown timer
  showing remaining minutes and seconds.
* Sounds one bell at two minutes remaining,
  two bells at one minute remaining,
  and three bells at zero minutes remaining.
* After the timer expires, the display turns red, counts up from zero,
  and a warning displays.
* If the timer hasn't been started, the display is gray
  (to avoid mistakes).
* Controllable by keyboard or touch interface (see below).

## [Demo](https://erikdemaine.org/timer/)

## Usage

Control the timer using the following keyboard commands
(or by tapping on one of the corresponding buttons):

* <kbd>+</kbd>/<kbd>-</kbd>: Adjust the number of minutes on the timer (duration).
* Spacebar (or <kbd>p</kbd>): Start/pause/resume the timer.
* <kbd>r</kbd>: Reset the timer: stop timer and return to full duration.
* <kbd>b</kbd>: Ring the bell (for audio testing or if you want a talk to stop early).

You can also manipulate the timer duration (down to the second level)
by tapping on one of the digits: top half increments, and
bottom half decrements.

## Installation

To install this web app in your own web space,
clone this repository and run `npm install`
(to compile into HTML and JavaScript).
Then open `index.html`.

## Related Apps

I was inspired by the following related apps:

* [User-Configurable Countdown Timer](https://www.cs.hmc.edu/~geoff/countdowntimer.html), a CGI web app by Geoff Kuenning. This is highly configurable and works well, except the sound playback is inconsistent (on Windows).
* [Presentation Timer](https://play.google.com/store/apps/details?id=org.tmurakam.presentationtimer), an Android app by Takuya Murakami. This is what I used for years, and works great for identical-length presentations, but is tedious to reconfigure for presentations of varying lengths.

## License

This software is licensed under an [MIT license](LICENSE).

The [bell sound](bell.mp3) is
[in the public domain](https://freesound.org/people/domrodrig/sounds/116779/).
