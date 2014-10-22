Gen     = require('rubber-stamp')
path    = require('path')
fs      = require('fs')


module.exports = (opts, isTesting) ->

  { source, target } = opts

  gen = Gen.using(source, target, opts, "Generates into a directory a static nginx site.")
    .mkdir()
    .mkdirs(
      'app',
      'logs',
      'app/html',
      'app/images'
    )
    .copy('app/html/index.html')
    .translate('nginx.conf.ftl', 'nginx.conf')

  ->
    nogen = path.resolve(opts.target, ".rstamp.nogen")

    if fs.existsSync(nogen)
      console.log("#{nogen} file is present in target directory.")
      console.log("Aborting generation.")
    else
      gen.apply()