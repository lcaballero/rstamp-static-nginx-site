qu        = require('inquirer')
Gen       = require('./generator')
_         = require('lodash')
path      = require('path')


questions = ->
  [
    {
      name    : "app_dir"
      type    : "input"
      message : "Where would you like to write the project?"
      default : "#{process.cwd()}"
    }
    {
      name    : "port"
      type    : "input"
      message : "What would you like to name the npm package?"
      default : 8080
    }
  ]

module.exports = ->
  qu.prompt(questions(), (answers) ->

    opts = _.defaults({}, {
      target: answers.app_dir
      source: path.resolve(__dirname, "../files/sources/s1")
    }, answers)

    Gen(opts)()
  )

