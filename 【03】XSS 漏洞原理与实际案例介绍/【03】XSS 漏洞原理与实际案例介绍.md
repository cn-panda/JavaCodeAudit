# 【Java 代码审计入门-03】XSS 漏洞原理与实际案例介绍

## 0x00 写在前面

为什么会有这一些列的文章呢？因为我发现网上没有成系列的文章或者教程，基本上是 Java 代码审计中某个点来阐述的，对于新人来说可能不是那么友好，加上本人也在学习 Java 审计，想做个学习历程的记录和总结，因此有了本系列的文章。

本系列的文章面向人群主要是**拥有 Java 基本语法基础的朋友**，系列文章的内容主要包括，审计环境介绍、SQL 漏洞原理与实际案例介绍、XSS 漏洞原理与实际案例介绍、SSRF 漏洞原理与实际案例介绍、RCE 漏洞原理与实际案例介绍、包含漏洞原理与实际案例介绍、序列化漏洞原理与实际案例介绍、S2系列经典漏洞分析、WebLogic 系列经典漏洞分析、fastjson系列经典漏洞分析、jackson系列经典漏洞分析等，可能内容顺序会略有调整，但是总体内容不会改变，最后希望这系列的文章能够给你带来一点收获。

目前已完成内容如下：

【Java 代码审计入门-01】审计前的准备 https://www.cnpanda.net/codeaudit/588.html

【Java 代码审计入门-02】SQL 漏洞原理与实际案例介绍 https://www.cnpanda.net/codeaudit/600.html

## 0x01 前戏

首先创建一个数据库`sec_xss`

`create database sec_xss charset utf8;`

然后创建表`message`和插入数据：

```sql
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (1, 'panda', 'panda@cnpanda.net', '这是一个测试储存型 XSS 的项目');
INSERT INTO `message` VALUES (2, 'test', 'test@test.com', '测试数据 2。测试功能是否正确');
INSERT INTO `message` VALUES (3, 'test_last', 'last@cnpanda.net', '最后一次测试，测试无误，则完成');
INSERT INTO `message` VALUES (4, '熊猫', 'admin@cnpanda.net', '你好！这里有一个新的短消息请注意查收！');
INSERT INTO `message` VALUES (5, 'lalala', 'lalala@qq.com', '啦啦啦啦啦啦啦啦绿绿\r\n啦啦啦啦啦啦啦啦绿绿');
INSERT INTO `message` VALUES (6, 'xss', 'xss@xss.xss', ' \' test');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

```

下载 xss 测试源码：

https://github.com/cn-panda/JavaCodeAudit

导入项目，可以得到以下目录

![image-20191211175109762](/Users/panda/Library/Application Support/typora-user-images/image-20191211175109762.png)

修改连接数据库的账号密码：

`MessageInfoDaoImpl.java 23 行`:

![image-20191211175202986](/Users/panda/Library/Application Support/typora-user-images/image-20191211175202986.png)

`MessageInfoDaoImpl.java 69 行`:

![image-20191211175247716](/Users/panda/Library/Application Support/typora-user-images/image-20191211175247716.png)



项目是一个简单的留言板功能的实现，在 servlet 层接受到请求后，调`MessageInfoServiceImpl`，`UserInfoServiceImpl`在调用`MessageInfoDaoImpl`，`MessageInfoDaoImpl`去操作数据库，进行插入和查询操作，然后封装 `MessageInfo`为数组对象，再把`MessageInfo` 对象返回给`MessageInfoService`，最后 service 层再返回给 servlet 层，最终把查询的内容显示到`show`页面。

## 0x02 漏洞原理

XSS 是通过对网页插入可执行代码且成功地被浏览器 执行，达到攻击的目的，一般来说 XSS 的危害性没有 SQL 大，但是一次有效的 XSS 攻击可以做很多事情，比如获取 Cookies、获取用户的联系人列表、截屏、劫持等等。根据服务端的后端代码不同，XSS 的种类也不相同，一般可以分为反射型、存储型以及和反射型相近的 DOM 型。

### 1、反射型

拿上方下载的代码举例，在`com.sec.servlet`包下的 `InfoServlet.java`文件中，关键代码如下：

```java
public void Message(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String message = req.getParameter("msg");
		
		try {
			resp.getWriter().print(message);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
```

获取 `msg`字段，然后直接打印出来。这里就可以很直白的理解反射型 XSS 了，把你输入的东西给”原封不动“的返回给你，这里的原封不动当然是加引号的，如果在输入的内容中，插入了浏览器可以执行的 js 代码，那么就会导致这种反射型的 XSS。

如下图所示，是上述代码的功能界面：

![image-20191211201657650](/Users/panda/Library/Application Support/typora-user-images/image-20191211201657650.png)

当我们输入正常字符的时候，返回我们刚才输入的字符：

![image-20191211201751498](/Users/panda/Library/Application Support/typora-user-images/image-20191211201751498.png)

但是如果我们输入的内容中含有可执行代码，如：`<script>alert('xss')</script>`

![image-20191211201856050](/Users/panda/Library/Application Support/typora-user-images/image-20191211201856050.png)

浏览器就会执行这段 js代码，所以我们只要控制输入的内容，就可以达到攻击效果。

### 2、储存型

同样拿上方下载的代码举例，在`com.sec.servlet`包下的 `ShowServlet.java`文件中，关键代码如下：

```java
public void ShowMessage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MessageInfoService msginfo = new MessageInfoServiceImpl();
		
		List<MessageInfo> msg = msginfo.MessageInfoShowService();
		if( msg != null){
			req.setAttribute("msg", msg);
			req.getRequestDispatcher("/message.jsp").forward(req, resp);
			return ;
		}
	}
```

其中，`MessageInfoShowService`主要是用于实例化`MessageInfoDaoImpl()`，然后调用`MessageInfoShowDao()`类，该类内容如下：

```java
try {
			....
        
			String sql = "select * from message";
			ps = conns.prepareStatement(sql);
			rs = ps.executeQuery();
			messageinfo = new ArrayList<MessageInfo>();
			while(rs.next()){
				MessageInfo msg = new MessageInfo();
				
				msg.setName(rs.getString("name"));
				msg.setMail(rs.getString("mail"));
				msg.setMessage(rs.getString("message"));
				
				messageinfo.add(msg);
			}
  
		....
      
		return messageinfo;
	}
}
```

主要执行的是从`message`表中查询所有数据，然后将 name、mail、message 的值加到 messageinfo List 中，最后返回给 servlet 层。

这段代码中有地址转发，在`message.jsp`中存在以下内容：

```jsp
<%
	List<MessageInfo> msginfo = (ArrayList<MessageInfo>)request.getAttribute("msg");
	for(MessageInfo m:msginfo){
 %>
<table>

	<tr><td class="klytd"> 留言人：</td>
		<td class ="hvttd">　<%=m.getName() %></td>
	</tr> 
	<tr><td class="klytd"> e-mail：</td><td class ="hvttd">　<%=m.getMail() %></td>
		</tr>
	<tr><td class="klytd"> 内容：</td><td class ="hvttd">　<%=m.getMessage() %></td></tr>

</table> <% } %>
</div>
```

从 messageinfo List 中取出 name、mail、message 的值，并输出在该页面上。

这样一来整个流程就很清楚了，从 message 表中取数据--> 取出的数据输出到页面上

那么这里就存在一个问题，如果储存的数据有问题，存在可执行代码，那么输出到页面上的内容就会引起xss 漏洞。

继续看代码，找可以控制输入点的地方，在`com.sec.servlet`包下的 `StoreServlet.java`文件中，关键代码如下：

```java
public void StoreXss(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		String message = req.getParameter("message");
		if(!name.equals(null) && !mail.equals(null) && !message.equals(null)){
			
			MessageInfoService msginfo = new MessageInfoServiceImpl();
			msginfo.MessageInfoStoreService(name, mail, message);
			
			resp.getWriter().print("<script>alert(\"添加成功\")</script>");
			resp.getWriter().flush();
			resp.getWriter().close();
		}
	}
```

获取 name、mail、message 参数，然后传入到`MessageInfoStoreService()`类中，该类的主要作用是调用`MessageInfoStoreDao()`类，该类的关键内容如下：

```java
try {
  	
  	  boolean result = false;
			....
        
			String sql = "INSERT INTO message (name,mail,message) VALUES (?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, message);
			ps.execute();
			result = true;
			
		....
		
		return result;
	}
```

主要执行的是向数据库中插入数据的功能，数据插入之前虽然进行了预编译，但是没有进行特殊字符过滤处理，这样结合前文中提到的——直接输出从message 表中拿出的数据，导致了储存型 XSS 漏洞。

如下图，我们提交含有可执行代码的数据：

![image-20191211205121835](/Users/panda/Library/Application Support/typora-user-images/image-20191211205121835.png)

然后在输出页面查看：

![image-20191211205207586](/Users/panda/Library/Application Support/typora-user-images/image-20191211205207586.png)

成功执行 XSS，且点击确定后，返回原本页面，再次刷新

![image-20191211205336068](/Users/panda/Library/Application Support/typora-user-images/image-20191211205336068.png)

![image-20191211205354207](/Users/panda/Library/Application Support/typora-user-images/image-20191211205354207.png)

依旧会执行插入数据中的 XSS 可执行代码，这也是和反射型 XSS 最大的区别。



## 0x03 修复方案

对于 XSS 漏洞，导致其产生的根本原因是对于输入和输出功能的过滤不完善，因此可以采用过滤的方法来防御 XSS 漏洞，大致方向有以下几种：

* 保留语意，将输入的特殊字符转译存储到数据库，缺点是可能会对数据库或文件系统产生一些不必要的垃圾信息

* 过滤掉特殊字符，只保留正常数据，缺点是有些时候用户需要输入特殊字符，不能保证数据原始性

* 输入限制，含有特殊字符的数据不能够输入

以上都可以自行进行特殊处理，这里只提供些思路，怎么处理可以根据需求选择

这里提供几个具体的处理方式。

### 1、全局过滤器过滤

说全局过滤器前需要说明一下` web.xml`这个配置文件的作用。` web.xml `是`java web` 项目的一个重要的配置文件，但是`web.xml`文件并不是`Java web`工程必须的，`web.xml`文件的主要作用用来配置：欢迎页、servlet、filter等。但是当web工程中没用到这些时，可以不用`web.xml`文件来配置web工程。

做全局过滤器需要要用到 filter，因此首先要做的是来配置`web.xml`文件，添加内容如下：

```xml
<filter>  
        <filter-name>XssSafe</filter-name>  
        <filter-class>XssFilter</filter-class>  
    </filter>  
    <filter-mapping>  
        <filter-name>XssSafe</filter-name>  
        <url-pattern>/*</url-pattern>  
    </filter-mapping>
```

这里要注意的是，我们的配置是`/*`而不是`/`，`< url-pattern>/</url-pattern> ` 会匹配到`/login`这样的路径型url，不会匹配到模式为`*.jsp`这样的后缀型url，而`< url-pattern>/*</url-pattern> `会匹配所有url：路径型的和后缀型的url(包括`/login`,`*.jsp`,`*.js`和`*.html`等)。

然后编写过滤器的内容就行了，这个网上有写好的，可以直接拿来用，如下：

```java
//XssFilter实现：

public class XssFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest) request), response);
    }
   
}

```

```java
//XssHttpServletRequestWrapper实现

public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

    public XssHttpServletRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    @SuppressWarnings("rawtypes")
    public Map<String,String[]> getParameterMap(){
        Map<String,String[]> request_map = super.getParameterMap();
        Iterator iterator = request_map.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry me = (Map.Entry)iterator.next();
            String[] values = (String[])me.getValue();
            for(int i = 0 ; i < values.length ; i++){
                values[i] = xssClean(values[i]);
            }
        }
        
        return request_map;
    }
     public String[] getParameterValues(String paramString)
      {
        String[] arrayOfString1 = super.getParameterValues(paramString);
        if (arrayOfString1 == null)
          return null;
        int i = arrayOfString1.length;
        String[] arrayOfString2 = new String[i];
        for (int j = 0; j < i; j++){
            arrayOfString2[j] = xssClean(arrayOfString1[j]);
        }
        return arrayOfString2;
      }

      public String getParameter(String paramString)
      {
        String str = super.getParameter(paramString);
        if (str == null)
          return null;
        return xssClean(str);
      }

      public String getHeader(String paramString)
      {
        String str = super.getHeader(paramString);
        if (str == null)
          return null;
        str = str.replaceAll("\r|\n", "");
        return xssClean(str);
      }
      
      
      private String xssClean(String value) {
        //ClassLoaderUtils.getResourceAsStream("classpath:antisamy-slashdot.xml", XssHttpServletRequestWrapper.class)
        if (value != null) {
            // NOTE: It's highly recommended to use the ESAPI library and
            // uncomment the following line to
            // avoid encoded attacks.
            // value = encoder.canonicalize(value);
            value = value.replaceAll("\0", "");
            
            // Avoid anything between script tags
            Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>",
                    Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid anything in a src='...' type of expression
            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                            | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");
            // Avoid anything in a href='...' type of expression
            scriptPattern = Pattern.compile("href[\r\n]*=[\r\n]*\\\"(.*?)\\\"",
                                Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                                        | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");
            

            // Remove any lonesome </script> tag
            scriptPattern = Pattern.compile("</script>",
                    Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Remove any lonesome <script ...> tag
            scriptPattern = Pattern.compile("<script(.*?)>",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                            | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid eval(...) expressions
            scriptPattern = Pattern.compile("eval\\((.*?)\\)",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                            | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid expression(...) expressions
            scriptPattern = Pattern.compile("expression\\((.*?)\\)",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                            | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid javascript:... expressions
            scriptPattern = Pattern.compile("javascript:",
                    Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid vbscript:... expressions
            scriptPattern = Pattern.compile("vbscript:",
                    Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll("");

            // Avoid onload= expressions
            scriptPattern = Pattern.compile("onload(.*?)=",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                            | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");
        }  
          return value; 
          }
}
```

### 2、使用工具类xssProtect

这是谷歌提供的一个用于过滤来自用户输入字段的XSS攻击的Java库

https://code.google.com/archive/p/xssprotect/

项目中需要引入 `xssProtect-0.1.jar`、`antlr-3.0.1.jar`、`antlr-runtime-3.0.1.jar `等3个 jar 包

简单用法如下：

```java
protectedAgainstXSS（String html）{StringReader reader = new StringReader（html）; StringWriter writer = new StringWriter（）;
  try {
      // 从“ html”变量解析传入的字符串
      HTMLParser.process( reader, writer, new XSSFilter(), true );

      // 返回经过解析和处理的字符串
      return writer.toString();
  } catch (HandlingException e) {
  }
}
```

具体的使用方式可以参考：https://www.iteye.com/blog/liuzidong-1744023

下载地址：

https://code.google.com/archive/p/xssprotect/downloads

https://github.com/kennylee26/xssprotect

### 3、commons.lang包

在这个包中有个StringUtils 类，该类主要提供对字符串的操作，对null是安全的，主要提供了字符串查找、替换、分割、去空白、去掉非法字符等等操作。存在三个函数可以供我们过滤使用。

* StringEscapeUtils.escapeHtml(string)
  使用HTML实体，转义字符串中的字符。

如：

会把

`"bread" & "butter"`

变成：

`&quot;bread&quot; &amp; &quot;butter&quot;`

* StringEscapeUtils.escapeJavaScript(string)

使用JavaScript字符串规则转义字符串中的字符。 

如：

会把

`input string: He didn't say, "Stop!"`

变成：
` output string: He didn\'t say, \"Stop!\"`

更多的方法和效果可以参考：

http://commons.apache.org/proper/commons-lang/javadocs/api-2.6/org/apache/commons/lang/StringEscapeUtils.html



## 0x04 实际案例（CVE-2018-19178）分析

### 1、案例介绍

CVE 地址：https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19178

JEESNS是一款基于JAVA企业级平台研发的社交管理系统，在JEESNS 1.3中，`com/lxinet/jeesns/core/utils/XssHttpServletRequestWrapper.java `允许通过html 中的<*embed*> 标签插入XSS攻击代码。

### 2、案例搭建

去官网下载 v1.3版本的 OFCMS，打开 idea，点击`import project`，选择`import project from external model`中的`Maven`，然后一路默认即可（具体过程在系列 文章 02 中有说明，可以查看）。

导入后软件会自动下载需要的 jar 包：

![11](/Users/panda/GitHub/JavaCodeAudit/【03】XSS 漏洞原理与实际案例介绍/img/11.png)

等待几分钟后即可下载完毕。然后在本地创建数据库：

`create database jeesns charset utf8mb4;`

选择数据库后导入SQL 文件：

```
source /Users/panda/Downloads/jeesns-master_v1.3/jeesns-web/database/jeesns.sql
```

然后在`jeesns-web/src/main/resources/jeesns.propertis`文件中修改数据库的账号密码

需要注意的是，由于每个人的数据库版本不同，因此需要修改对应的 msyql connet jar包，否则会出现类似于下面的错误:

```sql
Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is java.sql.SQLException: Connections could not be acquired from the underlying database!
```

![12](/Users/panda/GitHub/JavaCodeAudit/【03】XSS 漏洞原理与实际案例介绍/img/12.png)

需要在`jeesns-web/pom.xml`文件添加以下内容：

```xml
<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>8.0.15</version>
		</dependency>
```

**PS：注意这段代码添加的位置、自己机器上的数据库版本**

如下图所示：

![image-20191212115736981](/Users/panda/Library/Application Support/typora-user-images/image-20191212115736981.png)

修改好保存后，配置 tomcat 服务，点击 run-->edit configurations，配置如下：

server 选项默认即可：

![image-20191212122207859](/Users/panda/Library/Application Support/typora-user-images/image-20191212122207859.png)

Deployment 选项中，导入 war 包，点击+号，选择Artifact...，然后选择第一个 war：

![image-20191212121900022](/Users/panda/Library/Application Support/typora-user-images/image-20191212121900022.png)

点击 OK 后可以修改路径：

![image-20191212122243095](/Users/panda/Library/Application Support/typora-user-images/image-20191212122243095.png)

点击应用后，即可运行本项目，如下图所示：

![image-20191212122401816](/Users/panda/Library/Application Support/typora-user-images/image-20191212122401816.png)



站点地址：http://localhost:8080/jeesns/

后台地址：http://localhost:8080/jeesns/manage/

管理员账号：admin

管理员密码：jeesns

### 3、案例漏洞分析

该漏洞存在的文件位置为：`jeesns-core/src/main/java/com.lxinet.jeesns/core/utils/XssHttpServletRequestWrapper.java `

关键内容如下：

```java
/**
 * XSS攻击处理
 * Created by zchuanzhao on 2017/3/23.
 */

 public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return cleanXSS(value);
    }

    ......

    private String cleanXSS(String value) {
        //first checkpoint
        //(?i)忽略大小写
        value = value.replaceAll("(?i)<style>", "&lt;style&gt;").replaceAll("(?i)</style>", "&lt;&#47;style&gt;");
        value = value.replaceAll("(?i)<script>", "&lt;script&gt;").replaceAll("(?i)</script>", "&lt;&#47;script&gt;");
        value = value.replaceAll("(?i)<script", "&lt;script");
        value = value.replaceAll("(?i)eval\\((.*)\\)", "");
        value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");

        //second checkpoint
        // 需要过滤的脚本事件关键字
        String[] eventKeywords = { "onmouseover", "onmouseout", "onmousedown",
                "onmouseup", "onmousemove", "onclick", "ondblclick",
                "onkeypress", "onkeydown", "onkeyup", "ondragstart",
                "onerrorupdate", "onhelp", "onreadystatechange", "onrowenter",
                "onrowexit", "onselectstart", "onload", "onunload",
                "onbeforeunload", "onblur", "onerror", "onfocus", "onresize",
                "onscroll", "oncontextmenu", "alert" };
        // 滤除脚本事件代码
        for (int i = 0; i < eventKeywords.length; i++) {
            // 添加一个"_", 使事件代码无效
            value = value.replaceAll(eventKeywords[i],"_" + eventKeywords[i]);
        }
        return value;
    }
}

```

同时该过滤也写到了过滤器中：

```java
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest) request), response);
    }
```

在`WeiboController.java`文件中，有以下关键代码：

```java
    @RequestMapping(value="/comment/{weiboId}",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel comment(@PathVariable("weiboId") Integer weiboId, String content, Integer weiboCommentId){
        Member loginMember = MemberUtil.getLoginMember(request);
        ValidUtill.checkLogin(loginMember);
        return new ResultModel(weiboCommentService.save(loginMember,content,weiboId,weiboCommentId));
    }
```

sava 函数关键内容如下：

```java
public boolean save(HttpServletRequest request, Member loginMember, String content, String pictures) {
        if("0".equals(request.getServletContext().getAttribute(ConfigUtil.WEIBO_POST.toUpperCase()))){
            throw new OpeErrorException("微博已关闭");
        }
        ValidUtill.checkIsNull(content, Messages.CONTENT_NOT_EMPTY);
        if(content.length() > Integer.parseInt((String) request.getServletContext().getAttribute(ConfigUtil.WEIBO_POST_MAXCONTENT.toUpperCase()))){
            throw new ParamException("内容不能超过"+request.getServletContext().getAttribute(ConfigUtil.WEIBO_POST_MAXCONTENT.toUpperCase())+"字");
        }
       ....
         
        Weibo weibo = new Weibo();
        weibo.setMemberId(loginMember.getId());
        weibo.setContent(content);
        weibo.setStatus(1);
        
  		 ....
         
        return result == 1;
    }

```

通过request获取到 content 的值后，调用 save 函数保存，而request 使用了`XssHttpServletRequestWrapper`过滤器，通过`cleanXSS `去过滤传入进来的参数，综上，其实最关键的地方就在`XssHttpServletRequestWrapper.java `文件，如果绕过了 `cleanxss`函数，那么就可以进行 XSS 攻击。

下面来仔细看看这个函数。

首先对传入的参数进行相关的字符处理，然后采用标签黑名单的方式过滤关键字，可以看到过滤了我们经常使用的`alert`、`onerror`等函数。这种方式不是绝对安全的方式，很容易绕过，比如：

```url
<object data="data:text/html;base64,PHNjcmlwdD5hbGVydCgiSGVsbG8iKTs8L3NjcmlwdD4=">
```

![image-20191212132148810](/Users/panda/Library/Application Support/typora-user-images/image-20191212132148810.png)

还比如：

```
<svg/onLoad=confirm(1)>

<img src="x" ONERROR=confirm(0)>
```

![image-20191212132523550](/Users/panda/Library/Application Support/typora-user-images/image-20191212132523550.png)

### 4、修复方案

官网更新到了v1.4的版本，但是取消了开源。因此没法看官网怎么修复的，这里给出自己的修复意见。

1、对于黑名单过滤的方式，从长远的角度来看，是不可取的，因为标签太多，可能利用的标签也很多，一旦过滤不全，就导致功夫白费

2、使用上文中提到的修复方式，包括全局过滤器、xssProtect以及相关的 commons.lang包中的过滤函数等。

## 0x05 总结

本文主要讨论了 Java 中的 XSS 漏洞，包括其原理、简单的 Java 代码示例、修复方案以及 CVE 实例，希望对初入Java代码审计的朋友有所帮助。

## 0x06 参考

https://www.cnblogs.com/mumu122GIS/p/10161725.html

https://www.cnblogs.com/shawWey/p/8480452.html

https://www.iteye.com/blog/liuzidong-1744023

https://code.google.com/archive/p/xssprotect/wikis/HowTouse.wiki

https://www.cnblogs.com/soundcode/p/6595760.html

https://commons.apache.org/proper/commons-lang/

http://commons.apache.org/proper/commons-lang/javadocs/api-2.6/org/apache/commons/lang/StringEscapeUtils.html

https://github.com/zchuanzhao/jeesns/tree/master_v1.3

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19178