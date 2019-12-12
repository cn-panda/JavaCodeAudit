# JEESNS

开发语言：JAVA

数据库：MYSQL

JAVA开发框架：Spring MVC+Spring+Mybatis

前台前端开发框架：ZUI+JQuery+Bootstrap

前台模板引擎：Freemarker

## 简介
JEESNS是一款基于JAVA企业级平台研发的社交管理系统，依托企业级JAVA的高效、安全、稳定等优势，开创国内JAVA版开源SNS先河。数据库使用MYSQL，全部源代码开放。

交流社区：[http://www.jeesns.cn](http://www.jeesns.cn/)

官方网址：[http://www.lxinet.com](http://www.lxinet.com/)

github：[https://github.com/zchuanzhao/jeesns](https://github.com/zchuanzhao/jeesns/)


## 应用场景
- JEESNS是一个企业级的开源社区系统，是一个可以用来搭建门户、群组、论坛和微博的社区系统。
- JEESNS是将SNS社会化网络元素，人和群组结合在一起的新型的社交系统。
- JEESNS以人为中心，通过用户的需求和行为将最有价值的信息得以不断整合。
- JEESNS是一个稳定、安全、可扩展的社区系统，可以帮您搭建与众不同的交流社区。
- 如果您要需要搭建一个论坛,那么您可以用JEESNS
- 如果您需要一个群组，那么您可以用JEESNS
- 如果您需要因为某个话题来汇聚人群，那么您可以用JEESNS

## 功能模块
- 私信功能
1. 界面模仿PC版微信
2. 可以查看私聊过的联系人
3. 聊天界面自动刷新

- 个人主页
1. 关注会员
2. 私信会员
3. 查看动态
4. 查看粉丝、关注、微博、文章、帖子、群组

- 微博模块
1. 支持图片类型的微博
2. 多图画廊展示
3. 支持添加Emoji标签
4. 点赞功能

- 群组模块
1. 可以关注群组
2. 支持上传群组logo
3. 支持发帖审核开关
4. 授权管理员
5. 帖子喜欢功能
6. 帖子加精、置顶

- 文章模块
1. 文章喜欢功能
2. 文章投稿功能开关
3. 文章审核功能开关
4. 文章评论

- 动态模块
1. 洞悉一切

## 环境要求

- JDK7或更高版本
- Tomcat7.0或更高版本
- MySQL5.1或更高版本

## 部署说明

1. 创建数据库。如使用MySQL，字符集选择为`utf8`或者`utf8mb4`（支持更多特殊字符，推荐）。
2. 执行数据库脚本。数据库脚本在`/src/main/webapp/database`目录下。
3. 在eclipse中导入maven项目。点击eclipse菜单`File` - `Import`，选择`Maven` - `Existing Maven Projects`。
4. 设置项目编码为utf-8，选择jdk1.7版本或以上，不要选择jre。
5. 修改数据库连接。打开`/src/main/resources/jeesns.propertis`文件，根据实际情况修改`jdbc.url`、`jdbc.user`、`jdbc.password`的值，修改后台路径：`managePath`，如：`managePath=manage`
6. 编译项目。在eclipse中，右键点击项目名，选择`Run as` - `Maven build...`，`Goals`填入`clean package`，然后点击`Run`，第一次运行需要下载jar包，请耐心等待。
7. 部署项目。将项目部署到Tomcat7或以上版本，启动Tomcat。
8. 访问系统。前台地址：[http://localhost:8080/](http://localhost:8080/)；用户名：admin，密码：jeesns，登录成功之后，在右上角展开有个'管理'，点击即可进入后台管理。

## 部署详细说明
1. [JDK安装说明](https://my.oschina.net/zchuanzhao/blog/853387)
2. [Maven安装说明](https://my.oschina.net/zchuanzhao/blog/853392)
3. [JEESNS使用Maven打包介绍](https://my.oschina.net/zchuanzhao/blog/853393)
4. [JEESNS导入数据库说明](https://my.oschina.net/zchuanzhao/blog/853394)
5. [Eclipse导入JEESNS项目和部署说明](https://my.oschina.net/zchuanzhao/blog/853397)
6. [IDEA导入JEESNS1.2.0项目和部署教程](https://my.oschina.net/zchuanzhao/blog/1486494)


## 相关网站
官方网站：[http://www.jeesns.cn](http://www.jeesns.cn/)

技术支持：[http://www.lxinet.com](http://www.lxinet.com/)

服务器支持：[http://www.919dns.com](http://www.919dns.com/)
