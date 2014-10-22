fs    = require('fs')
path  = require('path')
_     = require('lodash')


module.exports =
  class GenStatic
    constructor: ->

    generate: (opts) ->
      @writeFile(@translate(opts))

    writeFile: (conf) ->
      fs.writeFileSync('files/nginx.conf', conf, { encoding: 'utf8' })

    translate: (opts) ->
      template = @readFile({
        filename: 'files/nginx.conf.ftl'
      })

      _.template(template, opts)

    readFile: (opts) ->
      { filename } = opts
      nginx = fs.readFileSync(filename, 'utf8').toString()

      nginx

