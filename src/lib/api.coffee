baseUrl = "https://qyapi.weixin.qq.com/cgi-bin/"
module.exports =
  #发送消息API
  message_send: "#{baseUrl}message/send"
  #获取token
  get_token: "#{baseUrl}gettoken"

  #创建成员
  create_member: "#{baseUrl}user/create"
  status:
    access_token_expired: 42001
    OK: 0