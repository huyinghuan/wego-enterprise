assert = require 'assert'

Member = require '../lib/member'

config = require './config'


describe("成员管理", ->
  member = new Member(config.token, config.agentid)

  it("创建", (done)->

    member.create({
      "userid": "huyinghuan"
      "name": "张三"
      "weixinid": "ec_huyinghuan"
    }, (error, statuscode, body)->
      (statuscode is 200).should.be.true
      done()
    )

  )

  it("修改", (done)->
    member.update({
        "userid": "huyinghuan"
        "name": "王五"
      }, (error, statuscode, body)->
        (statuscode is 200).should.be.true
        done()
    )
  )

  it("获取", (done)->
    member.get("huyinghuan", (error, statuscode, body)->
      console.log statuscode
      (statuscode is 200).should.be.true
      console.log body
      done()
    )
  )

)