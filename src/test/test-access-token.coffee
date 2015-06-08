assert = require 'assert'

AccessToken = require('../index').AccessToken

config = require './config'

###
  获取token
###
describe("token", ->
  it("should work well", (done)->
    access_token = new AccessToken(config.corpid, config.corpsecret)
    access_token.get((error, token)->
      if error
        console.log error
        return done(error)
      console.log token
      (token?).should.be.true
      done()
    )
  )
)