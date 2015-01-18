gulp      = require 'gulp'
plugins   = require('gulp-load-plugins')()
stylus    = require('gulp-stylus')



gulp.task 'build', ->
  gulp.src('**/*.coffee', { cwd: './src/scripts', cwdbase: true })
    .pipe(plugins.coffee())
    .pipe(gulp.dest('./app/js'))

  gulp.src('**/*.styl', { cwd: './src/styles', cwdbase: true })
    .pipe(stylus())
    .pipe(gulp.dest('./app/css'))

  gulp.src('**/*.css', { cwd: './src', cwdbase: true })
    .pipe(gulp.dest('./app/css'))

  gulp.src('**/*.js', { cwd: './src', cwdbase: true })
    .pipe(gulp.dest('./app/js'))

  gulp.src('angular/angular.min.js', { cwd: './bower_components', cwdbase: true })
    .pipe(gulp.dest('./app/js'))

gulp.task 'watch', ->
  gulp.watch([
      'src/**/*.coffee'
      'src/**/*.styl'
      'src/**/*.js'
      'src/**/*.css'],
    ['build'])


gulp.task 'default', ['watch'], ->