gulp = require 'gulp'
gulpCoffee = require 'gulp-coffee'
gulpChmod = require 'gulp-chmod'
gulpPug = require 'gulp-pug'
gulpStylus = require 'gulp-stylus'

exports.coffee = coffee = ->
  gulp.src '*.coffee', ignore: 'gulpfile.coffee'
  .pipe gulpCoffee()
  .pipe gulpChmod 0o644
  .pipe gulp.dest './'

exports.pug = pug = ->
  gulp.src '*.pug'
  .pipe gulpPug pretty: true
  .pipe gulpChmod 0o644
  .pipe gulp.dest './'

exports.stylus = stylus = ->
  gulp.src '*.styl'
  .pipe gulpStylus pretty: true
  .pipe gulpChmod 0o644
  .pipe gulp.dest './'

exports.watch = watch = ->
  gulp.watch '*.coffee', coffee
  gulp.watch '*.pug', pug
  gulp.watch '*.styl', stylus

exports.default = gulp.series ...[
  gulp.parallel coffee, pug, stylus
]
