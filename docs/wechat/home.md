# wechat

## 微信服务号开发 避坑指南-持续更新中

1. 网页授权开发code 生命周期
   
   > 每次用户授权带上的code将不一样，code只能使用一次，5分钟未被使用自动过期。
   
   **方案：**
   
   > 1. 对前端 暴露 获取openId的 API接口（使用code 我们一般的使用场景就是获取OPENID），之后的 请求 直接入参 OPENID
   > 2. 后端缓存 code和 openID的 对应关系，code可加密 或者 也可不加密（看业务设计）
   
2. ip白名单配置

   > 调用 服务号 api 接口的 机器 ip地址必须配置到ip白名单中

3. 服务器配置及网页授权开发 的 配置问题

   >  地址 必须是 **公网可访问**的地址

4. 分享 是原链接的 问题

   > 两种情况 
   >
   > 1. 网页授权处理的 配置地址 公网不可访问
   > 2. 页面 服务端 异常

5. 自定义菜单创建 问题

   > 微信api接口 创建API ，如果多次执行 会直接覆盖原数据；开发过程需要注意

6. 微信消息 AES加解密问题

   > **问题**
   >
   > 给公众号 发送消息，微信提示：“该公众号提供的服务出现故障，请稍后再试”
   > 服务端 报异常：“java.security.InvalidKeyException: Illegal key size”
   >
   > **原因**：微信消息加密 使用 AES256 ；JDK 只支持 128 超出了AES的安全限制
   > **解决方案**：从下边地址找到对应的地址下载 jar，替换%JAVE_HOME%\jre\lib\security、%JAVE_HOME%\lib\security下的“local_policy.jar ”和“US_export_policy.jar”
   > 重启项目即可
   >
   > 
   >
   > jdk5:http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-java-plat-419418.html#jce_policy-1.5.0-oth-JPR
   > jdk6: http://www.oracle.com/technetwork/java/javase/downloads/jce-6-download-429243.html
   > JDK7的下载地址: http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html
   > JDK8的下载地址: http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html