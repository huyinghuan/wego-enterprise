API = require '../lib/api'

class Base
  constructor: (@token, @agentid)->

  getAPI: (api, params = {})->
    queue = ["access_token=#{@token}"]
    for key, value of params
      queue.push("#{key}=#{value}")

    "#{api}?#{queue.join('&')}"

  ###
    重新设置token
    @params {string} token
    @return {null}
  ###
  setToken: (token)-> @token = token

  ###
    结果统一处理
  ###
  dealResult: (error, resp, body, callback)->
    callback = callback or ->
    if error or resp.statusCode isnt 200
      return callback(error, 500) #网络错误，没有发送出去

    if body.errcode is API.status.access_token_expired
      return callback(null, 403) #token 过期

    if body.errcode is API.status.OK
      return callback(null, 200, body)

    console.log body

    callback(null, 400, body) #该错误服务被理解


module.exports = Base