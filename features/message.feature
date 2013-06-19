# language: zh-CN
功能: 响应微信消息
  为了接入微信公众平台
  作为一个消息接口
  我希望能检验微信的签名并返回发送过来的随机字符串

  场景: 正确的微信GET请求
    假如GET请求中参数signature是 9f3ec44d6b60bde7e7523bb1225f409d81dd4ce3
    而且GET请求中参数timestamp是 param2
    而且GET请求中参数nonce是 param3
    而且GET请求中参数echostr是 param4
    当收到GET请求
    那么页面显示 param4

  场景: 伪造的微信GET请求
    假如GET请求中参数signature是 param1
    而且GET请求中参数timestamp是 param2
    而且GET请求中参数nonce是 param3
    而且GET请求中参数echostr是 param4
    当收到GET请求
    那么页面显示空白
