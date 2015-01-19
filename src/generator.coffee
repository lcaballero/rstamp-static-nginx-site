Gen     = require('rubber-stamp')
path    = require('path')
fs      = require('fs')


module.exports = (opts, isTesting) ->

  { source, target } = opts

  gen = Gen.using(source, target, opts, "Generates into a directory a static nginx site.")
    .mkdir()
    .mkdirs(
      'app'
      'logs'
      'app/html'
      'app/images'
      'app/css'
      'app/js'
      'src'
      'src/styles'
      'src/scripts'
    )
    .copy(
      'app/html/index.html'
      '.gitignore'
      'gulpfile.coffee'
      'mime.types'
      'src/scripts/FirstController.coffee'
      'src/styles/base.styl'
    )
    .translate('nginx.conf.ftl', 'nginx.conf')
    .translate('open.ftl.sh', 'open.sh')
    .translate('start.sh', 'start.sh')
    .run(
      commands:
        if isTesting then []
        else [
          name: 'chmod'
          args: ['+x', './open.sh', './start.sh']
        ,
          name: 'npm'
          args: ['install', 'coffee-script', 'gulp', 'gulp-coffee', 'gulp-load-plugins', 'gulp-stylus', '--save-dev']
        ,
          name: 'bower'
          args: ['install', 'angular']
        ,
          name: 'git'
          args: ['init']
        ]
    )

  createPackgeJson = (opts) ->
    name : path.basename(opts.app_dir)
    version : '0.0.1'
    descpription : 'Default static nginx site.'

  writePackageJson = (opts) ->
    json = createPackgeJson(opts)
    fs.writeFileSync(
      path.resolve(target, 'package.json'),
      JSON.stringify(json, null, '  '))

  ->
    nogen = path.resolve(opts.target, ".rstamp.nogen")

    if fs.existsSync(nogen)
      console.log("#{nogen} file is present in target directory.")
      console.log("Aborting generation.")
    else
      writePackageJson(opts)
      gen.apply()
