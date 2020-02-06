# 【Java 代码审计入门-04】SSRF 漏洞原理与实际案例介绍

## 0x00 写在前面

为什么会有这一些列的文章呢？因为我发现网上没有成系列的文章或者教程，基本上是 Java 代码审计中某个点来阐述的，对于新人来说可能不是那么友好，加上本人也在学习 Java 审计，想做个学习历程的记录和总结，因此有了本系列的文章。

本系列的文章面向人群主要是**拥有 Java 基本语法基础的朋友**，系列文章的内容主要包括，审计环境介绍、SQL 漏洞原理与实际案例介绍、XSS 漏洞原理与实际案例介绍、SSRF 漏洞原理与实际案例介绍、RCE 漏洞原理与实际案例介绍、包含漏洞原理与实际案例介绍、序列化漏洞原理与实际案例介绍、S2系列经典漏洞分析、WebLogic 系列经典漏洞分析、fastjson系列经典漏洞分析、jackson系列经典漏洞分析等，可能内容顺序会略有调整，但是总体内容不会改变，最后希望这系列的文章能够给你带来一点收获。

目前已完成内容如下：

【Java 代码审计入门-01】审计前的准备 https://www.cnpanda.net/codeaudit/588.html

【Java 代码审计入门-02】SQL 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/600.html

【Java 代码审计入门-03】XSS 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/605.html

## 0x01 前戏

下载 SSRF 测试源码：https://github.com/cn-panda/JavaCodeAudit

导入项目，可以得到以下目录：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/1.png?raw=true)

项目是一个简单模拟HTTP请求的实现。

## 0x02 漏洞原理

服务端请求伪造（Server-Side Request Forge）简称 SSRF，是OWASP TOP之一，它是由攻击者构造的payload传给服务端，服务端执行后造成了漏洞，一般用于在外网探测或攻击内网服务。Java网络请求支持的协议很多，包括：http，https，file，ftp，mailto，jar，netdoc。如下图所示：

![2.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/2.png?raw=true)

但是和 PHP 相比，java 中的SSRF的利用是有局限性的，实际场景中，一般利用http/https协议来探测端口、暴力穷举等，还可以利用file协议读取/下载任意文件等。

本文针对端口探测和任意文件下载/读取进行了实例说明。

### 1、端口探测

```java
			String url = request.getParameter("url");
			String htmlContent;
			try {
				URL u = new URL(url);
				URLConnection urlConnection = u.openConnection();
				HttpURLConnection httpUrl = (HttpURLConnection) urlConnection;
				BufferedReader base = new BufferedReader(new InputStreamReader(httpUrl.getInputStream(), "UTF-8"));
				StringBuffer html = new StringBuffer();
				while ((htmlContent = base.readLine()) != null) {
					html.append(htmlContent);
				}
				base.close();
				print.println("<b>端口探测</b></br>");
				print.println("<b>url:" + url + "</b></br>");
				print.println(html.toString());
				print.flush();
			} catch (Exception e) {
				e.printStackTrace();
				print.println("ERROR!");
				print.flush();
			}
```

以上代码大致意义如下：

* URL对象用`openconnection()`打开连接，获得URLConnection类对象。

* 用`InputStream()`获取字节流
* 然后`InputStreamReader()`将字节流转化成字符流
* `BufferedReader()`将字符流以缓存形式输出的方式来快速获取网络数据流
* 最终一行一行的输入到 html 变量中，输出到浏览器

代码的主要功能即是模拟一个 http 请求，如果没有对请求地址进行限制和过滤，即可以利用来进行 SSRF 攻击。

本机环境如下：

地址：127.0.0.1

环境： java+tomcat

虚拟机环境如下：

地址：192.168.159.134

环境：php+apache

假设外网可以访问本机地址，但不能访问虚拟机地址。

以上，因为本机地址存在 SSRF 漏洞，那么久可以利用该漏洞去探测虚拟机开放的端口，如下图所示：

![3.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/3.png?raw=true)

如果该端口没有开放 http/https 协议，那么返回：

![4.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/4.png?raw=true)

根据不同的返回结果，就可以判断开放的 http/https 端口

### 2、任意文件读取/下载

我们将上述代码删除一行，如下：

```java
String url = request.getParameter("url");
		String htmlContent;

		try {
			URL u = new URL(url);
			URLConnection urlConnection = u.openConnection();
			BufferedReader base = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			StringBuffer html = new StringBuffer();
			while ((htmlContent = base.readLine()) != null) {
				html.append(htmlContent);
			}
			base.close();
			print.println(html.toString());
			print.flush();

		} catch (Exception e) {
			e.printStackTrace();
			print.println("ERROR!");
			print.flush();
		}
```

`HttpURLconnection()`是基于http协议的，而我们要用的是 `file` 协议，删除后即可利用`file`协议去读取任意文件 ，如下图所示：

![5.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/5.png?raw=true)

如果我们知道了网站的路径，可以直接读取其数据库连接的相关信息：

![6.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/6.png?raw=true)

任意文件下载同理，只不过是将数据流写入到了文件中，如下代码：

```java
		String downLoadImgFileName = "SsrfFileDownTest.txt";
		InputStream inputStream = null;
		OutputStream outputStream = null;
		String url = req.getParameter("url");
		try {
			resp.setHeader("content-disposition", "attachment;fileName=" + downLoadImgFileName);
			URL file = new URL(url);
			byte[] bytes = new byte[1024];
			inputStream = file.openStream();
			outputStream = resp.getOutputStream();
			while ((length = inputStream.read(bytes)) > 0) {
				outputStream.write(bytes, 0, length);
			}
		} 
```

将获取的内容写入到`SsrfFileDownTest.txt`文件中，测试如下：

![7.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/7.png?raw=true)

## 0x03 修复方案

实际场景中可能出现 SSRF 的功能点有很多,比如获取远程 URL 图片、webmail收取其他邮箱邮件、从远程服务器请求资源等等，针对这些问题，可以进行过滤判断，设置白名单等，相关策略如下：

* 统一错误信息，避免用户可以根据错误信息来判断远端服务器的端口状态。
* 限制请求的端口为http常用的端口，比如，80,443,8080,8090等。
* 禁用不需要的协议，仅仅允许http和https请求。

* 根据业务需求，判定所需的域名是否是常用的几个，若是，将这几个特定的域名加入到白名单，拒绝白名单域名之外的请求，。
* 根据请求来源，判定请求地址是否是固定请求来源，若是，将这几个特定的域名/IP加入到白名单，拒绝白名单域名/IP之外的请求。
* 若业务需求和请求来源并非固定，那么可以自己写一个 ssrfCheck 函数，如：https://github.com/JoyChou93/java-sec-code/blob/master/src/main/java/org/joychou/security/SSRFChecker.java

## 0x04 实际案例（CVE-2019-9827）分析

### 1、案例介绍

CVE 地址：https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9827

Hawtio是用于管理Java应用程序的轻型模块化Web控制台。Hawt Hawtio小于2.5.0版本都容易受到SSRF的攻击，远程攻击者可以通过 /proxy/地址发送特定的字符串，可以影响服务器到任意主机的HTTP请求。

### 2、案例搭建

首先进入搭建好的 tomcat 首页，输入账号密码进入manage app 管理界面（需要提前设置账号密码，具体可以百度，此处不再赘述）：

![8.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/8.png?raw=true)

然后选择`WAR file to deply`栏目，点击选择`hawtio-default-2.5.0.war`上传，最后deplay即可：

![9.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/9.png?raw=true)

布置以后，上方会出现布置好的应用，点击应用进入即可。

![10.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/10.png?raw=true)



![11.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/11.png?raw=true)

### 3、案例漏洞分析

可以通过反编译获取本程序的源码，或者通过 github 的 tree 分支来获取源码。

通过反编译`hawtio-system-2.5.0.jar`包找到相关文件：`hawtio-system/src/main/java/io/hawt/web/proxy/ProxyServlet.java`

进入`service`函数

```java
protected void service(HttpServletRequest servletRequest, HttpServletResponse servletResponse)
        throws ServletException, IOException {
        // Make the Request
        //note: we won't transfer the protocol version because I'm not sure it would truly be compatible
        ProxyAddress proxyAddress = parseProxyAddress(servletRequest);
        if (proxyAddress == null || proxyAddress.getFullProxyUrl() == null) {
            servletResponse.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        // TODO Implement whitelist protection for Kubernetes services as well
        if (proxyAddress instanceof ProxyDetails) {
            ProxyDetails details = (ProxyDetails) proxyAddress;
            if (!whitelist.isAllowed(details)) {
                LOG.debug("Rejecting {}", proxyAddress);
                ServletHelpers.doForbidden(servletResponse, ForbiddenReason.HOST_NOT_ALLOWED);
                return;
            }
        }
```

通过`parseProxyAddress`函数获取 URL 地址,然后判断其是否为空,如果不为空,通过`whitelist.isAllowed()`判断该 URL 是否在白名单里，跟进 `whitelist`：

```java
public ProxyWhitelist(String whitelistStr, boolean probeLocal) {
        if (Strings.isBlank(whitelistStr)) {
            whitelist = new CopyOnWriteArraySet<>();
            regexWhitelist = Collections.emptyList();
        } else {
            whitelist = new CopyOnWriteArraySet<>(filterRegex(Strings.split(whitelistStr, ",")));
            regexWhitelist = buildRegexWhitelist(Strings.split(whitelistStr, ","));
        }

        if (probeLocal) {
            LOG.info("Probing local addresses ...");
            initialiseWhitelist();
        } else {
            LOG.info("Probing local addresses disabled");
            whitelist.add("localhost");
            whitelist.add("127.0.0.1");
        }
        LOG.info("Initial proxy whitelist: {}", whitelist);

        mBeanServer = ManagementFactory.getPlatformMBeanServer();
        try {
            fabricMBean = new ObjectName(FABRIC_MBEAN);
        } catch (MalformedObjectNameException e) {
            throw new RuntimeException(e);
        }
    }

...
  
   public boolean isAllowed(ProxyDetails details) {
        if (details.isAllowed(whitelist)) {
            return true;
        }

        // Update whitelist and check again
        LOG.debug("Updating proxy whitelist: {}, {}", whitelist, details);
        if (update() && details.isAllowed(whitelist)) {
            return true;
        }

        // test against the regex as last resort
        if (details.isAllowed(regexWhitelist)) {
            return true;
        } else {
            return false;
        }

    }

 public boolean update() {
        if (!mBeanServer.isRegistered(fabricMBean)) {
            LOG.debug("Whitelist MBean not available");
            return false;
        }

        Set<String> newWhitelist = invokeMBean();
        int previousSize = whitelist.size();
        whitelist.addAll(newWhitelist);
        if (whitelist.size() == previousSize) {
            LOG.debug("No new proxy whitelist to update");
            return false;
        } else {
            LOG.info("Updated proxy whitelist: {}", whitelist);
            return true;
        }
    }

```

判断 URL 是否为 localhost、127.0.0.1或者用户自己更新的白名单列表，如果不是返回 false。

返回到 `service()`，向下走：

```java
  if (servletRequest.getHeader(HttpHeaders.CONTENT_LENGTH) != null ||
            servletRequest.getHeader(HttpHeaders.TRANSFER_ENCODING) != null) {
            HttpEntityEnclosingRequest eProxyRequest = new BasicHttpEntityEnclosingRequest(method, proxyRequestUri);
            // Add the input entity (streamed)
            //  note: we don't bother ensuring we close the servletInputStream since the container handles it
            eProxyRequest.setEntity(new InputStreamEntity(servletRequest.getInputStream(), servletRequest.getContentLength()));
            proxyRequest = eProxyRequest;
        } else {
            proxyRequest = new BasicHttpRequest(method, proxyRequestUri);
        }

        copyRequestHeaders(servletRequest, proxyRequest, targetUriObj);

```

`BasicHttpEntityEnclosingRequest()`拥有`RequestLine`、`HttpEntity`以及`Header`，这里用的是 entity，HttpEntity即为消息体，包含了三种类型：数据流方式、自我包含方式以及封装模式（包含上述两种方式），这里就是一个基于HttpEntity的， HttpRequest接口实现，类似于上文中的urlConnection。

所以这个 `service()`的主要作用就是获取请求，然后`HttpService`把`HttpClient`传来的请求通过向下转型成`BasicHttpEntityEnclosingRequest `，再调用`HttpEntity`，最终得到请求流内容。

这里虽然对传入的 URL 进行了限制，但是没有对端口、协议进行相应的限制，从而导致了 SSRF 漏洞。

证明如下：

![12.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/12.png?raw=true)

### 4、修复方案

通过比对最新版的源码，发现该漏洞的修复方式为加了页面访问权限，如下图：

![13.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/13.png?raw=true)

未经验证的用户禁止访问该页面，测试如下：

![14.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9004%E3%80%91SSRF%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/14.png?raw=true)

## 0x05 总结

本文主要讨论了 Java 中的 SSRF 漏洞，包括其原理、简单的 Java 代码示例、修复方案以及 CVE 实例，希望对初入Java代码审计的朋友有所帮助。另外对于 SSRF 的审计可以从 http 请求函数入手，这里提供一些审计函数，如下：

* HttpClient.execute 

* HttpClient.executeMethod 

* HttpURLConnection.connect 

* HttpURLConnection.getInputStream 

* URL.openStream 

* HttpServletRequest

* getParameter

* URL

* HttpClient

* Request (对HttpClient封装后的类) 

* HttpURLConnection 

* URLConnection

* okhttp

* BasicHttpEntityEnclosingRequest

* DefaultBHttpClientConnection

* BasicHttpRequest
* URI

## 0x06 参考

https://github.com/frohoff/jdk8u-jdk/tree/master/src/share/classes/sun/net/www/protocol

https://github.com/ring04h/papers/blob/master/build_your_ssrf_exp_autowork--20160711.pdf

https://www.cnblogs.com/RunForLove/p/5531905.html

https://github.com/JoyChou93/java-sec-code/

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9827

https://github.com/hawtio/hawtio/tree/hawtio-2.5.0/

https://blog.csdn.net/undergrowth/article/details/77203668

https://github.com/hawtio/hawtio/compare/hawtio-2.5.0...hawtio-2.9.1