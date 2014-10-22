GenStatic = require("../src/GenStatic")

describe 'GenStatic =>', ->

  describe 'contructor =>', ->

    it 'should instantiate without error', ->
      expect(-> new GenStatic()).to.not.throw(Error)

