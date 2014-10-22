Gen     = require('../src/generator')
path    = require('path')
fs      = require('fs')
{ run } = require('./ProcessHelpers')


describe 'GenStatic =>', ->

  exists = (root, dirs...) ->
    for dir in dirs
      file = path.resolve(root, dir)
      expect(fs.existsSync(file), 'should have created file: ' + file).to.be.true

  rm = (cwd, t, cb) ->
    cmds =
      target : cwd
      commands: [ { name: 'rm', args: ['-rf', t] } ]
    run(cmds, cb)

  describe "generate =>", ->

    cmd     = null
    source  = 'files/sources/s1'
    target  = 'files/targets/t1'
    app_dir = 'dir/where/app/will/reside'
    port    = 9090

    createInputs = ->
      app_dir : app_dir
      port    : port

    beforeEach ->
      inputs  = createInputs()
      cmd     = _.defaults({}, { source: source, target: target }, inputs)
      Gen(cmd, true)()

    afterEach (done) ->
#      rm target, 'site', done
      done()

    it 'should have created the site/', ->
      exists(target,
        'app',
        'logs',
        'nginx.conf',
        'app/html',
        'app/images')

    it 'should have interpolated the app_dir', ->
      f = path.resolve(target, 'nginx.conf')
      c = fs.readFileSync(f, { encoding: 'utf8' }).toString()
      re = new RegExp(app_dir)
      expect(re.test(c)).to.be.true

    it 'should have interpolated the port', ->
      f = path.resolve(target, 'nginx.conf')
      c = fs.readFileSync(f, { encoding: 'utf8' }).toString()
      re = new RegExp(port)
      expect(re.test(c)).to.be.true
