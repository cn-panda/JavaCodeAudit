
## 0x00 写在前面

为什么会有这一些列的文章呢？因为我发现网上没有成系列的文章或者教程，基本上是 Java 代码审计中某个点来阐述的，对于新人来说可能不是那么友好，加上本人也在学习 Java 审计，想做个学习历程的记录和总结，因此有了本系列的文章。

本系列的文章面向人群主要是**拥有 Java 基本语法基础的朋友**，系列文章的内容主要包括，审计环境介绍、SQL 漏洞原理与实际案例介绍、XSS 漏洞原理与实际案例介绍、SSRF 漏洞原理与实际案例介绍、RCE 漏洞原理与实际案例介绍、包含漏洞原理与实际案例介绍、序列化漏洞原理与实际案例介绍、S2系列经典漏洞分析、weblogic 系列经典漏洞分析、fastjson系列经典漏洞分析、jackson系列经典漏洞分析等，可能内容顺序会略有调整，但是总体内容不会改变，最后希望这系列的文章能够给你带来一点收获。

## 0x01 审计工具及环境

*   MyEclipse 2017 CI
*   Intellij idea
*   Tomcat 7.0
*   MySQL 8.0.15
*   Java 1.8.0
*   macOS 10.15

这些工具的安装和使用网上基本上都有教程，因此就不详说了。

MyEclipse 2017 CI 的破解教程 ：

*   windows 下

[http://www.3322.cc/soft/39985.html](http://www.3322.cc/soft/39985.html)

*   mac 下

[https://www.cnblogs.com/jiaoxiangjie/p/9555124.html](https://www.cnblogs.com/jiaoxiangjie/p/9555124.html)

Intellij idea创建javaWeb以及Servlet简单实现：

​ [https://www.cnblogs.com/javabg/p/7976977.html](https://www.cnblogs.com/javabg/p/7976977.html)

myeclipse 配置 Tomcat 教程：

​ [https://www.cnblogs.com/xusweeter/p/9393721.html](https://www.cnblogs.com/xusweeter/p/9393721.html)

## 0x02 基础知识

### 1、包的命名规范

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%90Java%20%E4%BB%A3%E7%A0%81%E5%AE%A1%E8%AE%A1%E5%85%A5%E9%97%A8-01%E3%80%91%E5%AE%A1%E8%AE%A1%E5%89%8D%E7%9A%84%E5%87%86%E5%A4%87/1.png?raw=true)

如上图所示，在 Java 中，会有各种各样的包，大致规则如下：

*   indi ：

个体项目，指个人发起，但非自己独自完成的项目，可公开或私有项目，copyright主要属于发起者。

包名为`indi.发起者名.项目名.模块名.……`

*   pers：

个人项目，指个人发起，独自完成，可分享的项目，copyright主要属于个人。

包名为`pers.个人名.项目名.模块名.……`

*   priv：

私有项目，指个人发起，独自完成，非公开的私人使用的项目，copyright属于个人

包名为`priv.个人名.项目名.模块名.……`

*   onem：

与“indi”相同，推荐使用“indi”

*   team：

团队项目，指由团队发起，并由该团队开发的项目，copyright属于该团队所有

包名为`team.团队名.项目名.模块名.……`

*   com：

公司项目，copyright由项目发起的公司所有

包名为`com.公司名.项目名.模块名.……`

持久层：dao、persist、mapper

实体类：entity、model、bean、javabean、pojo

业务逻辑：service、biz

控制器：controller、servlet、action、web

过滤器：filter

异常：exception

监听器：listener

在不同的框架下一般包的命名规则不同，但大概如上，不同功能的 Java 文件放在不同的包中，根据 Java 文件的功能统一安放及命名。

### 2、servlet

##### 为什么要介绍 servlet？

上文中也提到，我会针对于各种漏洞的原理和案例进行介绍，漏洞原理不仅是理论上的介绍，还有实际中存在对应漏洞 Java 代码上的分析，这些代码是我基于 Java servlet 简单写的，所以需要了解 servlet 的一些特性和基础知识。**我更推荐自己写一个存在对应漏洞的 web 项目**，此外，还要懂得如何修复该漏洞，这样可以更好的理解该漏洞。

#### 什么是 servlet？

Java Servlet 是运行在 Web 服务器或应用服务器上的程序，它是作为来自 Web 浏览器或其他 HTTP 客户端的请求和 HTTP 服务器上的数据库或应用程序之间的中间层。

Servlet 执行以下主要任务：

*   读取客户端（浏览器）发送的显式的数据。这包括网页上的 HTML 表单，或者也可以是来自 applet 或自定义的 HTTP 客户端程序的表单。
*   读取客户端（浏览器）发送的隐式的 HTTP 请求数据。这包括 cookies、媒体类型和浏览器能理解的压缩格式等等。
*   处理数据并生成结果。这个过程可能需要访问数据库，执行 RMI 或 CORBA 调用，调用 Web 服务，或者直接计算得出对应的响应。
*   发送显式的数据（即文档）到客户端（浏览器）。该文档的格式可以是多种多样的，包括文本文件（HTML 或 XML）、二进制文件（GIF 图像）、Excel 等。
*   发送隐式的 HTTP 响应到客户端（浏览器）。这包括告诉浏览器或其他客户端被返回的文档类型（例如 HTML），设置 cookies 和缓存参数，以及其他类似的任务。

#### Servlet 生命周期

Servlet 生命周期可被定义为从创建直到毁灭的整个过程。以下是 Servlet 遵循的过程：

*   Servlet 通过调用` init () `方法进行初始化。
*   Servlet 调用 `service() `方法来处理客户端的请求。
*   Servlet 通过调用` destroy() `方法终止（结束）。

最后，Servlet 是由 JVM 的垃圾回收器进行垃圾回收的。

这里主要介绍一下`service() `方法。

`service() `方法是执行实际任务的主要方法，Servlet 容器（即 Web 服务器）调用 `service() `方法来处理来自客户端（浏览器）的请求，并把格式化的响应写回给客户端。每次服务器接收到一个 Servlet 请求时，服务器会产生一个新的线程并调用服务。`service() `方法检查 HTTP 请求类型（GET、POST、PUT、DELETE 等），并在适当的时候调用 doGet、doPost、doPut，doDelete 等方法。

```java
public void service(ServletRequest request, ServletResponse response) 
      throws ServletException, IOException{
      ...
}
```
以上代码，即为一个`service()`方法的特征

## 0x03 总结

以上为基础的知识，了解这些后，基本上可以开始我们的审计之路了

## 0x04 参考

[https://blog.csdn.net/kongjiea/article/details/45365753](https://blog.csdn.net/kongjiea/article/details/45365753)

[https://www.runoob.com/servlet/servlet-intro.html](https://www.runoob.com/servlet/servlet-intro.html)
