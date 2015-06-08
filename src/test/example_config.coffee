module.exports =
  ###
    设置->权限分组->某个权限组(如果不存在，请新建. 不建议使用系统管理组，权限过大)
      CorpID -> corpid
      Secret -> corpsecret

    新建
      新建后，请修改该管理组的通讯录权限（请根据需要来），应用权限（根据需要来，必须包括下面
      agentid对应的应用
    ）
  ###
  corpid: "your corpid"
  corpsecret: "your corpsecret"
  ###
    应用中心->我的应用->点击相应应用->应用ID
  ###
  agentid: '应用id'
  ###
    接口访问必须的token, 第一次获取，可以使用 README.md 中关于access-token部分获取
  ###
  token: "默认token"