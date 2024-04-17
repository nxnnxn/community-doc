Feature: 初始化
  Scenario: 初始化
    Given 访问 "http://localhost:5000/init"
    When 发送 GET 请求
    Then 状态码为 200
    And 响应结果为
      """
      {"code":0,"msg":"success","data":{"user":{"id":1,"name":"admin","password":"admin","role":1,"create_time":"2020-01-01 00:00:00","update_time":"2020-01-01 00:00:00"},"role":{"id":1,"name":"admin","create_time":"2020

