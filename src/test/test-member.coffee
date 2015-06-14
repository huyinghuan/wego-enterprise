assert = require 'assert'

Member = require '../lib/member'

config = require './config'


describe("成员管理", ->


  it("创建", (done)->

    member = new Member(config.token, config.agentid)

    member.create({
      "userid": "huyinghuan"
      "name": "张三"
      "weixinid": "ec_huyinghuan"
    }, (error, statuscode, body)->
      (statuscode is 200).should.be.true
    )

  )

)