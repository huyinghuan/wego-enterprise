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

### Message

  消息发送接口
  
#### 构造函数

```coffee
  ###
    @params {string}  接口访问token
    @params {string}  应用id
    
    @return {Message}
  ###
  
  message = new Message(token, agentid)
```

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

#### setToken

  token失效后 重新设置 token
  
```coffee
  ###
    @params {string} token
    @return {null}
  ###
  message.setToken(token)
```