_ = require 'lodash'
request = require 'request'
http = require 'http'

API = require './api'
Base = require './base'
class Message extends Base
  ###
    @params {string}  接口访问token
    @params {string}  应用id
  ###
  constructor: ->
    super


  ###
    构建发送消息体
    ＠params {object} 相关消息设置
    ＠return {Object} 完整消息体
  ###
  buildMessage: (message)->
    def = {
      "touser": "",
      "toparty": "",
      "totag": "",
      "agentid": @agentid,
      "text": {
        "content": ""
      },
      "safe":"0"
    }
    _.extend def, message

  ###
  给成员发文本消息
    ＠params {string | array<string> } 用户ID 或者 ID数组 。必须
    @params {string} 消息内容。 必须
    @params {Function} 回调函数, 自定义。 可选
      该回调函数 Function 应该接收以下参数
        @params {object | null}  错误堆栈，如果没有发生错误则为null
        @params {number} 消息发送结果状态
          500 请求错误或者网络错误
          403 token 过期
          200 发送成功
          400 未知错误
        @params {object | null | undefined} 服务器返回的具体结果

    @return null
  ###
  sendText: (userID, content, callback)->
    self = @
    #数组的情况
    userID = userID.join("|") if _.isArray userID

    message = @buildMessage(
      touser: userID
      text: content: content
      msgtype: "text",
    )

    request.post({
        url: self.getAPI(API.message_send)
        body: message
        json: true
      },
      (error, resp, body)-> self.dealResult(error, resp, body, callback)
    )


module.exports = Message