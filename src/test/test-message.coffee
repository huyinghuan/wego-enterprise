assert = require 'assert'

config = require './config'

describe("发送消息", ->
  Message = require('../index').Message

  message = new Message(config.token, config.agentid)

  describe.only("单个用户", ->
    it("发送成功", (done)->
      message.sendText(["huyinghuan"], "Hello World!", (error, status, body)->
        console.log status
        console.log error
        console.log body
        done()
      )
    )
  )
)
###
  POST /cgi-bin/message/send?access_token=arojTv8ZQffNfIIMtbh3jOSv4rKsOqFjstTmPhoS9skTCBdtwT-iMQIsOh2Sve63 HTTP/1.1
Host: qyapi.weixin.qq.com
Cache-Control: no-cache
Postman-Token: de7492db-394d-d57d-f979-82b9062085b7

{"touser":"huyinghuan","toparty":"","totag":"","msgtype":"text","agentid":"12","text":{"content":"Hello World!"},"safe":"0"}
###