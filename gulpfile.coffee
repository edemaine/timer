gulp = require 'gulp'
gulpCoffee = require 'gulp-coffee'
gulpPug = require 'gulp-pug'
gulpChmod = require 'gulp-chmod'

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

exports.watch = watch = ->
  gulp.watch '*.coffee', ignoreInitial: false, coffee
  gulp.watch '*.pug', ignoreInitial: false, pug
  gulp.watch '*.styl', pug

exports.default = gulp.parallel coffee, pug
