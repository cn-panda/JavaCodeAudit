# 【Java 代码审计入门-06】文件包含漏洞原理与实际案例介绍

## 0x00 写在前面

为什么会有这一些列的文章呢？因为我发现网上没有成系列的文章或者教程，基本上是 Java 代码审计中某个点来阐述的，对于新人来说可能不是那么友好，加上本人也在学习 Java 审计，想做个学习历程的记录和总结，因此有了本系列的文章。

本系列的文章面向人群主要是**拥有 Java 基本语法基础的朋友**，系列文章的内容主要包括，审计环境介绍、SQL 漏洞原理与实际案例介绍、XSS 漏洞原理与实际案例介绍、SSRF 漏洞原理与实际案例介绍、RCE 漏洞原理与实际案例介绍、包含漏洞原理与实际案例介绍、序列化漏洞原理与实际案例介绍、S2系列经典漏洞分析、WebLogic 系列经典漏洞分析、fastjson系列经典漏洞分析、jackson系列经典漏洞分析等，可能内容顺序会略有调整，但是总体内容不会改变，最后希望这系列的文章能够给你带来一点收获。

目前已完成内容如下：

【Java 代码审计入门-01】审计前的准备 https://www.cnpanda.net/codeaudit/588.html

【Java 代码审计入门-02】SQL 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/600.html

【Java 代码审计入门-03】XSS 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/605.html

【Java 代码审计入门-04】SSRF 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/678.html

【Java 代码审计入门-05】RCE 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/759.html

## 0x01 前戏

下载 RCE 测试源码：

https://github.com/cn-panda/JavaCodeAudit

导入项目，可以得到以下目录：

![[Pasted image 20211113151342.png]]

![[Pasted image 20211113151348.png]]

项目是一个为了体现文件包含而特地写的一些功能，比如从本地引入文件、从远程引入文件等，此外，还有 Springboot+thymeleaf 的文件包含测试项目。

## 0x02 漏洞原理

文件包含漏洞出现最多的地方是在由 PHP 编写的 Web应用中，我们知道，在 PHP 中，攻击者可以通过 PHP 中的某些包含函数（如：include、require 等），去包含一个含有攻击代码的恶意文件，在包含这个文件后，由于 PHP 包含函数的特性，无论包含的是什么类型的文件，都会将所包含的文件当作 PHP 代码去解析执行。

也就是说，攻击者可能上传一个一句话木马后缀是 txt 或者 jpg 的文件，上传后利用文件包含漏洞去包含这个一句话木马文件就可以成功拿到 Shell 了。

那么Java 中有没有类似的包含漏洞呢？回答这个问题前首先来看看 Java 中原生的包含其他文件的方式。

JSP 的文件包含分为静态包含和动态包含两种。

第一种是静态包含：`<%@include file="test.jsp"%>`

所谓的静态包含就是指包含在其中的参数值， 如上述的`file`参数，不能动态赋值，定义的时候写的是什么，那就是什么，而不能够在项目运行时，动态的赋值给它。因此，通常我们认为，静态包含并不含有文件包含漏洞，当然，不排除和其他漏洞结合而产生的奇妙反应造成包含漏洞产生的可能性，但这里我们不谈。

有静必有动，第二种便是动态包含，动态包含的形式有如下两种：
```
<jsp:include page="<%=file%>"></jsp:include>
<jsp:include page ="<%=file%>"/>
```

```
<c:import url="<%= url%>"></c:import>
```

来看看第一种形式，这种形式相对静态包含来讲, 要复杂一点，因为在静态包含中其只属于一个include指令元素, 并且只有一个file的属性, 只是写上路径就行了, 路径可以是相对路径也可以是绝对路径, 但不能是`<%=...%>`代表的表达式，但在这里，file 属性可以是`<%=...%>`代表的表达式。

第二种形式其实和第一种形式并无本质上的区别，core 库 的`<c:import>`和 `<jsp:include>` 一样，也是一种请求时操作，它的目的就是将其它一些 Web 资源的内容插入到当前的 JSP 页面中，这些 Web 资源就是通过url 属性来指定的，这也是`<c:import>` 的唯一一个必选属性。值得一提的是，这里允许使用相对 URL，并且根据当前页面的 URL 来解析这个相对 URL。

举个例子，如果我们当前页面的 URL 地址是`http://127.0.0.1/admin/index.jsp`，那么如果我们引用的 URL 属性值为`/user/edit.jsp`，那么其实最终解析的 URL 就是`http://127.0.0.1/admin/user/edit.jsp`

所以，如果 url 属性的值以斜杠开始，那么它就被解释成本地 JSP 容器内的绝对 URL。如果没有为 `context` 属性指定值，那么就认为这样的绝对 URL 引用当前 servlet 上下文内的资源。如果通过`context` 属性显式地指定了上下文，那么就根据指定的 servlet 上下文 解析绝对（本地）URL。 

当然，`<c:import>` 操作并不仅仅限于访问本地内容，也可以为具体协议和主机名的完整 URI 。并且实际上，协议甚至不仅局限于 HTTP。 `<c:import>` 的 url 属性值可以使用 [`java.net.URL`](https://docs.oracle.com/javase/7/docs/api/java/net/URL.html) 类所支持的任何协议（也就是`http`, `https`, `ftp`, `file`,`jar`,`mailto`,`netdoc`）。

由于这些特性，导致**动态包含可能会出现文件包含漏洞**， 但这种包含和 PHP 中的包含存在很大的差别，**对于 Java 的本地文件包含来说，造成的危害只有文件读取或下载，`一般情况下`不会造成命令执行或代码执行**。因为一般情况下 Java 中对于文件的包含并不是将非 jsp 文件当成 Java 代码去执行，如果这个 JSP 文件是一个一句话木马文件，我们可以直接去访问利用，并不需要多此一举去包含它来使用了，除非在某些特殊场景下，如某些目录下权限不够可以尝试利用包含来绕过（理论上）。

通常情况下 Java 并不会把非 jsp 文件当成 Java 去解析执行，但是可以利用服务容器本身的一些特性（如将指定目录下的文件全部作为 jsp 文件解析），来实现任意后缀的文件包含，如 Apache Tomcat Ajp（CVE-2020-1938）漏洞，利用 Tomcat 的 AJP（定向包协议）协议实现了任意后缀名文件当成 jsp 文件去解析，从而导致 RCE 漏洞。

除此之外，另外提一点，静态包含和动态包含在`执行时间上`有很大的区别。**静态包含是翻译阶段执行的**，即被包含的文件和被插入到的页面会被 JSP 编译器合成编译，最终编译后的文件实际上只有一个。而**动态包含实际是在请求处理阶段执行的**，JSP程序会将请求转发到（注意不是重定向）被包含页面，并将执行结果输出到浏览器中，然后返回页面继续执行后面的代码，即被包含的文件和被插入到的页面会被JSP编译器单独编译。

好了，说了那么多，来看看我们写的例子吧。

首先是本地文件包含：

```java
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
 String file = request.getParameter("file");
%>

<jsp:include page="<%=file%>"></jsp:include>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <title>JSP 文件包含测试（本地）</title>
</head>
<body>
File Include Test Page. <br>
</body>
</html>
```

当我们令`file`的参数值为`data.txt`时，可以得到该文件的内容，如下图所示：

![[Pasted image 20211108194803.png]]

但是这里有个问题，就是这里包含的路径实际上只能是该 web 路径下的文件，并且该文件的类型只能是文本类型，如`jsp`、`txt`等，不支持图片等类型的文件。

当尝试访问一个图片资源的时候，就会报错：

![[Pasted image 20211108211234.png]]

并且不支持解析.java 文件（原理上面已说过）：

![[Pasted image 20211108211604.png]]

其次再来看看远程包含：

```java  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head> 
 <title>远程文件包含测试</title>
 <%  String url = request.getParameter("url"); %>
 <c:import url="<%=url%>"></c:import>  
 
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">
</head>
<body>
This is my JSP page. <br>
</body>
</html>
```

远程包含不但可以包含远程文件，同时可以包含本地文件，如下：

![[Pasted image 20211108221206.png]]

![[Pasted image 20211108221136.png]]

包括图片资源（不解析图片，但是有图片的数据）：

![[Pasted image 20211108221254.png]]

解析远程文件：

![[Pasted image 20211108221718.png]]

![[Pasted image 20211108221740.png]]

深入利用，首先在 XSS 平台生成一个利用的 xss  payload，然后在远程创建一个 html 页面，这个 html 里面镶嵌了这个 xss js，然后利用包含漏洞远程访问：

![[Pasted image 20211108222323.png]]

成功获取到了 cookie

![[Pasted image 20211108222148.png]]

除此之外，还可以利用 file、netdoc 协议来实现任意文件读取的目的：

![[Pasted image 20211109142811.png]]

![[Pasted image 20211109143837.png]]

那么 java 文件包含漏洞做到的仅仅如此而已吗？

答案是否定的，在前文中我提到 `<c:import>` 的 url 属性值可以使用 `java.net.URL`类所支持的任何协议，因此 jar 协议也自然在其中，对 jar 协议的利用，通常是在 XXE 漏洞中，实际上在 java 的文件包含漏洞中也可以利用。

利用方式和`K0rz3n`师傅提到的[利用 jar 上传文件](https://xz.aliyun.com/t/3357)大差不差，同样是利用临时文件，然后报错获取临时文件的路径，由于时间关系，我这里只是做了个简单的测试：

![[Pasted image 20211109150146.png]]

![[Pasted image 20211109150131.png]]

可以看到临时文件确实存在于目录下，只不过由于是临时的，所以很快自动删除了，只要使用某种技巧（`K0rz3n`师傅提到），就能够使得文件长时间存在于目标服务器中，但是如何利用上传的文件，也是一个问题，这里我也没深入思考其利用方式，有兴趣的朋友可以思考一番

除了原生的 java 文件包含，实际上还有框架层面的文件包含漏洞，这里就简单举个例子来说明一下。

我们理解的  JSP  文件包含是可控`<jsp:include`、`<c:import`中的资源引用属性，同样，我们理解的 PHP 文件包含是将任意文件当成 PHP 文件去解析，那么如果延伸一下这种原理，实际上在某种意义上spring boot Thymeleaf 模板注入也是一种类型的文件包含漏洞。看一个比较经典的例子：

```java
@GetMapping("/admin")  
public String path(@RequestParam String language) {  
    return "language/" + language + "/admin";  
}
```

这是 SpringBoot 项目中某个控制器的部分代码片段，thymeleaf 的目录如下：

![[Pasted image 20211110112827.png]]

因此从代码逻辑中基本上可以判断，这实际上是一个语言界面选择的功能，如果是中文阅读习惯者，那么会令`language`参数为`cn`，如果是英文阅读习惯者，那么会令`language`参数为`en`，代码逻辑本身实际上是没有什么问题的，但是这里采用的是 thymeleaf 模板，就出现了问题。

在springboot + thymeleaf 中，如果视图名可控，就会导致漏洞的产生。其主要原因就是在控制器中执行 return 后，Spring 会自动调度 Thymeleaf 引擎寻找并渲染模板，在寻找的过程中，会将传入的参数当成SpEL表达式执行，从而导致了远程代码执行漏洞。这里不主要分析 Thymeleaf 模板注入漏洞的原理，所以简单说下其渲染的流程：

- createView()   根据视图名创建对应的View

![[Pasted image 20211110170330.png]]

- renderFragment()   根据视图名解析模板名称  

![[Pasted image 20211110170416.png]]

所以可以跟进`renderFragment()`来看看如何解析模板名称的：

```java
    protected void renderFragment(Set<String> markupSelectorsToRender, Map<String, ?> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String templateName;
        Set<String> markupSelectors, processMarkupSelectors;
        ServletContext servletContext = getServletContext();
        String viewTemplateName = getTemplateName();
        ISpringTemplateEngine viewTemplateEngine = getTemplateEngine();
        
      ...
            
            try {
                fragmentExpression = (FragmentExpression)parser.parseExpression((IExpressionContext)context, "~{" + viewTemplateName + "}");
            } catch (TemplateProcessingException e) {
                throw new IllegalArgumentException("Invalid template name specification: '" + viewTemplateName + "'");
            } 
            
            FragmentExpression.ExecutedFragmentExpression fragment = FragmentExpression.createExecutedFragmentExpression((IExpressionContext)context, fragmentExpression);
            
            templateName = FragmentExpression.resolveTemplateName(fragment);
            markupSelectors = FragmentExpression.resolveFragments(fragment);
            Map<String, Object> nameFragmentParameters = fragment.getFragmentParameters();
            
            if (nameFragmentParameters != null) {
                
                if (fragment.hasSyntheticParameters())
                {
                    
                    throw new IllegalArgumentException("Parameters in a view specification must be named (non-synthetic): '" + viewTemplateName + "'");
                }

                context.setVariables(nameFragmentParameters);
            } 
        } 
        
       ...
	 }
```

可以发现，这里将模板名称(`viewTemplateName`) 进行拼接 `"~{" + viewTemplateName + "}"`，然后使用`parseExpression`进行解析，继续跟进`parseExpression`就可以发现会对传入的参数进行预处理，最终使用SpEL执行表达式。

所以我们直接令`language`参数的值为一个我们指定的SpEL表达式，就可以实现 RCE：

![[Pasted image 20211110211919.png]]

那么如果我们假设存在一个可以上传非 jsp 类型文件的漏洞，并且上传的位置可控，控制器的逻辑如下：

```java
@GetMapping("/test")  
public String test(@RequestParam String path) {  
    return "/" + path;  
}
```

因此就可能发生以下情况：

将`test.html`上传到模板文件夹`template`根目录下：
`test.html`内容如下：
```html
<!DOCTYPE html>  
<html lang="en" xmlns="http://www.w3.org/1999/xhtml"  
 xmlns:th="http://www.thymeleaf.org">  
<head>  
    <title>Hello World!</title>  
</head>  
<body>  
<h1 th:inline="text">Hello</h1>  
<p th:text="@{__${new java.util.Scanner(T(java.lang.Runtime).getRuntime().exec('whoami').getInputStream()).next()}__}"></p>  
</body>  
</html>
```

访问即可达到PHP 中的文件包含效果：

![[Pasted image 20211110214111.png]]

这种情况，在实际情况下我遇到过，只不过非 jsp文件 类型的任意位置的文件上传漏洞比较少见，可能遇到这种情况的人比较少，所以也不具有代表性。

此外，我们知道Thymeleaf模板的语法有以下几种常用的表达式：

> ${…}: 变量表达式
> *{…}: 选择表达式
  #{…}: 消息表达式
  @{…}: 链接表达式
  ~{…}: 片段表达式

所以在这里，如果存在一个模板文件中的参数可控，即：

![[Pasted image 20211110222035.png]]

并且控制器中的逻辑为：

```java
@GetMapping("/page")  
public String path(@RequestParam String exp, Model model) {  
    model.addAttribute("exp", exp);  
    return "exp";  
}
```

同样可以实现 RCE 效果：

![[Pasted image 20211110222014.png]]

这里介绍的仅仅是原理是类似于文件包含的 thymeleaf 漏洞，实际上这类的漏洞有专门的名称——SSTI（模板注入漏洞）

不过之所以在这里把这个漏洞归于文件包含，是因为见过这种漏洞式实例，所以只是简单提一下，大家可以举一反三，思考其他框架出现这种漏洞的可能性。

那么，这类的漏洞应该如何修复或者如何避免呢？

## 0x03 修复方案

对于 JSP 文件包含来说，其所造成的影响有限，出现的频率基本上可以忽略不计（基本上没人这样写代码，import 引用的资源一般都是写死的）

但对于thymeleaf等模板框架来说，出现这种情况的漏洞还是极有可能的，所以这里简单说说thymeleaf修复方式，其他模板也是同理，根据模板的特性来修复即可。

在上文中我们提到，`createView()`方法的作用是根据视图名创建对应的`View`，实际上  在该方法中，Thymeleaf 对`redirect:`和`forward:`有特殊处理：

![[Pasted image 20211110171737.png]]

跟进RedirectView这个重定向类，然后可以发现：

![[Pasted image 20211110171640.png]]

简单来说这里的逻辑会根据填写的返回值来判断是重定向（`redirect:`）还是请求转发（`forward:`），然后调用原生的Servlet的重定向或者请求转发方法，从而就不会进入执行SpEL表达式的流程，也就不会产生所谓的漏洞了。

因此在视图名称可控的情况下，使用了如下几种方式的代码不受影响：
- 使用`@ResponseBody`注解

- `rerturn` 时的内容 由`redirect:`或`forward:`开头

- 参数中有`HttpServletResponse`，response已经被处理

- Thymeleaf 使用最新版，新版已经修复了这两个问题（视图名称可控、模板预处理变量可控）

jsp 的文件包含实际上不好找，我在 CVE 官网上找到的基本上都是任意文件读取漏洞，之前遇到的实例也不好发出来，因此也就不在这里举实际例子了

## 0x05 总结
这篇文章实际上拖了很久，实质性的内容也不是很多，顶多是一个思维发散的理解，希望对新入门的童鞋有所收获

## 0x06 参考
https://vulncat.fortify.com/zh-cn/detail?id=desc.dataflow.dotnet.dangerous_file_inclusion
https://xz.aliyun.com/t/3357
http://x2y.pw/2020/11/15/Thymeleaf-模板漏洞分析/
https://waylau.gitbooks.io/thymeleaf-tutorial/content/docs/standard-expression-syntax.html