request = require 'request'
API = require './api'

class AccessToken
  ###
    构造函数
    @params {string} 开发者凭据 CorpID
    @params {string} 开发者凭据 Secret
    @return {AccessToken}
  ###
  constructor: (corpid, corpsecret)->
    @tokenUrl = "#{API.get_token}?corpid=#{corpid}&corpsecret=#{corpsecret}"

  ###
  获取token
  @params {function} 回调函数
    该回调函数应该接收以下参数：
      @params {object | string | null} 获取token出错的信息
      @params {string} 获取的token

  @return null
  ###
  get: (cb)->
    request(tokenUrl, {json: true},(error, resp, body)->
      return cb(error) if error
      return cb("无法返回结果") if not body
      if body.access_token
        cb(null, body.access_token)
      else if body.errcode
        cb(body.errmsg)
      else
        cb("未知错误")
    )

module.exports = AccessToken
