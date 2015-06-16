微信企业号
----------------
  微信企业号 node库, 基于官方API接口封装
  
##安装

```
  npm install wego-enterprise
```


## 说明
 1. 该包使用 Mocha 进行测试
 2. 所有测试文件在 test目录下
 3. 运行测试前请根据```example_config.coffee```进行相关操作，保证测试用例跑起来
 
 
## API 文档

### AccessToken

  获取访问微信接口使用的token
  
#### 构造函数

```coffee
  ###
    构造函数
    @params {string} 开发者凭据 CorpID
    @params {string} 开发者凭据 Secret
    
    @return {AccessToken}
  ###
  accessToken = new AccessToken(CorpID, Secret)
```

#### get

  获取 token
  
```coffee
  ###
    @params {function} 回调函数
      该回调函数应该接收以下参数：
        @params {object | string | null} 获取token出错的信息
        @params {string} 获取的token
  
    @return null
  ###
  
  accessToken.get(callback)
```

### Base 基础类

  该类的所有方法成员函数和构造函数将被子类继承，无法直接使用

#### 构造函数

```coffee
  ###
    @params {string}  接口访问token
    @params {string}  应用id
    
    @return {Base} 
  ###
  
  #这里的 T 使用时为其对应的子类，t 为对应之类实例
  #如: message = new Message(token, agentid)
  
  t = new T(token, agentid)
```

#### setToken

  token失效后 重新设置 token
  
```coffee
  ###
    @params {string} token
    @return {null}
  ###
  t.setToken(token)
```


### Message extends Base

  消息发送接口
  
#### 构造函数

  继承父类


#### sendText

  发送文本消息
  
```coffee
  ###
    @params {string | array<string> } 用户ID 或者 ID数组 。必须
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
  message.sendText(userID, content, callback)
```



### Member
  通讯录管理（注意需要在微信权限控制面板中给相应应用增加通讯录管理权限）
  
#### 构造函数
  继承父类

#### create
  创建成员
  
```coffee
  ###
    @params {JSON object} 成员对象
      必须包含 userid, name, weixinid. 其他属性请参考微信文档如下:
      参数	必须	说明
      access_token	是	调用接口凭证
      userid	是	成员UserID。对应管理端的帐号，企业内必须唯一。长度为1~64个字节
      name	是	成员名称。长度为1~64个字节
      department	否	成员所属部门id列表。注意，每个部门的直属成员上限为1000个
      position	否	职位信息。长度为0~64个字节
      mobile	否	手机号码。企业内必须唯一，mobile/weixinid/email三者不能同时为空
      gender	否	性别。1表示男性，2表示女性
      email	否	邮箱。长度为0~64个字节。企业内必须唯一
      weixinid	否	微信号。企业内必须唯一。（注意：是微信号，不是微信的名字）
      extattr	否	扩展属性。扩展属性需要在WEB管理端创建后才生效，否则忽略未知属性的赋值
    
    @params {function} 回调函数
      回调函数必须接收 3个参数 error, statuscode, body
        当statuscode为200时操作成功，其它时操作失败，失败信息请参考body和error
    
    @return null

  ###
  member.create({
        "userid": "huyinghuan"
        "name": "张三"
        "weixinid": "ec_huyinghuan"
      }, (error, statuscode, body)->
        (statuscode is 200).should.be.true
        done()
      )
```

#### update

 更新成员信息
 
```coffee
    ###
      @params {JSON object}, 必须包含 userid, 其他字段非必须， 其他属性参考上文 create 函数说明
      @params {function} 同上文创建函数
    ###
    member.update({
        "userid": "huyinghuan"
        "name": "王五"
      }, (error, statuscode, body)->
        (statuscode is 200).should.be.true
        done()
    )
```

#### get

  获取成员信息
  
```coffee
  ###
    @params {string} 成员id 必须
    @params {function} 回调,同上文create，获取的信息包含在body中，body为JSON对象
  ###
  member.get("huyinghuan", (error, statuscode, body)->
        console.log statuscode
        (statuscode is 200).should.be.true
        console.log body
        done()
      )
```

## History

v0.0.3

  增加成员管理