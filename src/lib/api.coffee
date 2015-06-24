baseUrl = "https://qyapi.weixin.qq.com/cgi-bin/"
module.exports =
  #发送消息API
  message_send: "#{baseUrl}message/send"
  #获取token
  get_token: "#{baseUrl}gettoken"

  #创建成员
  create_member: "#{baseUrl}user/create"
  #修改成员
  update_member: "#{baseUrl}user/update"
  #获取成员
  get_member: "#{baseUrl}user/get"
  status:
    access_token_expired: 42001
    access_token_miss: 41001
    OK: 0