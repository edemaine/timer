# Timer

This is a simple web app for counting down a desired number of minutes,
such as time-limited presentations (e.g., final projects in a class).
Main features:

<ul>
<li> Large highly visible (and responsive) countdown timer
     showing remaining minutes and seconds.
<li> Sounds one bell at two minutes remaining,
     two bells at one minute remaining,
     and three bells at zero minutes remaining.
<li> After the timer expires, the display turns red, counts up from zero,
     and a warning displays.
<li> Controllable by keyboard interface (see below).
</ul>

## [Demo](http://erikdemaine.org/timer/)

## Usage

Control the timer using the following keyboard commands:

* `+`/`-`: Adjust the number of minutes on the timer.
* Spacebar (or `p`): Start/pause the timer.
* `r`: Reset the timer.

## Installation

To install this web app in your own web space,
clone this repository and run `npm install`
(to compile into HTML, CSS, and JavaScript).
Then open `index.html`.

## Related Apps

I was inspired by the following related apps:
<ul>
<li> <a href="https://www.cs.hmc.edu/~geoff/countdowntimer.html">User-Configurable Countdown Timer</a>, a CGI web app by Geoff Kuenning. This is highly configurable and works well, except the sound playback is inconsistent (on Windows).
<li> <a href="https://play.google.com/store/apps/details?id=org.tmurakam.presentationtimer">Presentation Timer</a>, an Android app by Takuya Murakami. This is what I used for years, and works great for identical-length presentations, but is tedious to reconfigure for presentations of varying lengths.
</ul>

## License

This software is licensed under an <a href="LICENSE">MIT license</a>.

The <a href="bell.mp3">bell sound</a> is
<a href="https://freesound.org/people/domrodrig/sounds/116779/">in the public domain</a>.
