### 成员管理
  {
   "userid": "zhangsan",
   "name": "张三",
   "department": [1, 2],
   "position": "产品经理",
   "mobile": "15913215421",
   "gender": "1",
   "email": "zhangsan@gzdev.com",
   "weixinid": "zhangsan4dev",
   "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]}
}
###
request = require 'request'
API = require './api'
Base = require './base'
_ = require 'lodash'

class Member extends Base
  constructor: ->
    super

  buildMember: (member)->
    def = {
      "userid": "zhangsan",
      "name": "张三",
      "department": [1],
      "position": "",
      "mobile": "",
      "gender": "1",
      "email": "",
      "weixinid": "",
      "extattr": {}
    }
    _.extend def, member

  ###
    创建成员通讯录
  ###
  create: (member, callback)->
    self = @
    request.post({
        url: self.getAPI(API.create_member)
        body: self.buildMember(member)
        json: true
      },
    (error, resp, body)-> self.dealResult(error, resp, body, callback)
    )

  ###
    更新成员
  ###
  update: (member, callback)->
    self = @
    request.post({
        url: self.getAPI(API.update_member)
        body: member
        json: true
      },
      (error, resp, body)-> self.dealResult(error, resp, body, callback)
    )

  ###
  获取成员
  ###
  get: (userid, callback)->
    self = @
    request.post({url: self.getAPI(API.get_member, {userid: userid}), json: true}
      ,(error, resp, body)-> self.dealResult(error, resp, body, callback)
    )

module.exports = Member