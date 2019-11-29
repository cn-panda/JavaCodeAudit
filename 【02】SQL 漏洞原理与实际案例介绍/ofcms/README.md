## OFCMS 
#### 项目介绍
java 版CMS系统、基于java技术研发的内容管理系统、功能：栏目模板自定义、内容模型自定义、多个站点管理、在线模板页面编辑等功能、代码完全开源、MIT授权协议。
 
技术选型：jfinal Record mysql  freemarker  redis spring 等 layui zTree bootstrap 。

特点：支持多站点、可以根据需求添加手机站、pc站。

项目地址：https://gitee.com/oufu/ofcms   QQ 群: ①185948055 <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=9c5f0bdc44402195be254668a80a6c5eeebb06f0336e8c5be26878930b88c672"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="OFCMS技术交流" title="OFCMS技术交流"></a> 
欢迎喜欢开源的朋友一起加入，共同学习、群里有相关文档。
#### 目前版本v1.1.2  2018-11-16

- 表单完善，功能增加单选、复选框、开关、选择框
- 文章编辑器更换ueditor
- 500页面修改  
- 整理代码内部sql改到sql文件
- 用户登录禁止功能、
- 栏目刷新问题
- 修改admin默认跳转管理首页
- 未设置的访问地址为默认站点
- 增加文章关键字
- 首页图表显示不正确
- 缓存过期问题、出现查询无空
- 自动安装出现乱码

#### 版本v1.1.1  2018-09-06
前台：

- 1、默认两套网站 ，pc mobile
- 2、丰富模板标签
- 3、详细模板文档
- 4、支持分页，
- 5、单个网页，
- 6、两个站点要共用数据
- 7、漂亮的官网
- 8、自动引导安装、不需要修改配置文件、改数据库连接

后台：

- 1、后台两套首页模板，自由切换、主题切换
- 2、强大的前台控制，与后台分开。
- 3、功能开发简单，只要求配置请求地址即可，不需要处理js。
- 4、采用layui后台界面、效果大气。
- 5、架构设计复杂，使用简单，配置即可。
- 6、界面管理定时任务、不需求重启，自动，手动触发。
- 7、模板在线编辑，在线上传模板文件。
- 8、增加api接口模快，强大的封装。接口编写简单。

#### 项目团队

firechou ([https://gitee.com/firechou](https://gitee.com/firechou))
 
王雪峰 ([https://gitee.com/wangxfsh](https://gitee.com/wangxfsh))

大寶   ([https://gitee.com/zhouzhangl](https://gitee.com/zhouzhangl))
 
姚杰  ([https://gitee.com/yaojiecd](https://gitee.com/yaojiecd))

abpai ([https://gitee.com/abpai](https://gitee.com/abpai))

luoyafeng ([https://gitee.com/ExamSystem](https://gitee.com/ExamSystem))


#### 项目功能

| 用户管理 | 菜单管理 | 角色管理 | 字典管理 | 机构管理 | 操作日志 | 连接池监视  | 定时任务  |
|---|---|---|---|---|---|---|---|
| 基本设置  | 模板编辑 | 栏目管理 | 文章管理 | 主题管理 | 标签管理 | 回收站 | 广告管理 |
| 友情链接 | 评论管理 |  站点公告 | 站点管理 | 留言管理 | 微信管理 | 菜单管理 |自动回复 |
| 默认回复 | 访问统计 |  评论统计 | 内容统计 | 表单管理 | 代码生成 | 通知管理 |单页管理 |
 


#### 使用说明

1. 配置文件 resource/conf/admin.properties
2. 微信配置文件 resource/conf/weixin.properties
3. shior 文件 resource/shior.ini
4. 缓存 resource/ehcache.xml
5. 后台账号 http://localhost:8080/ofcms-admin/admin admin 密码 123456

###  项目依赖

- ofcms-core 核心
- ofcms-model  数据源
- ofcms-front  模板
- ofcms-api  接口
- 管理台
- ofcms-admin  -> ofcms-core
- ofcms-admin  -> ofcms-model
- ofcms-admin  -> ofcms-front
- ofcms-admin  -> ofcms-api

### 项目框架

#### api网关设计

![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/232938_7332bdee_634828.png "api.png")

###  部署说明

1. 建议采用 idea 工具开发
2. mysql 5.6+
3. jdk 1.8
4. tomcat 8  
5.通过war包直接放TOMCAT下面   到附件中下载

#### 前台展示：
首页
![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/230956_11783ab1_634828.png "4.png")
单面
![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/231226_199d8bd2_634828.png "6.png")

分页
![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/231332_bf0f5879_634828.png "7.png")
 
新闻
![输入图片说明](https://images.gitee.com/uploads/images/2018/0715/184524_0b210b8f_634828.png "屏幕截图.png")

#### 后台展示：

首页1
![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/230301_b054c229_634828.png "1.png")
首页2
![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/230317_7b343e32_634828.png "2.png")
数据列表
![输入图片说明](https://images.gitee.com/uploads/images/2018/0715/184544_31b52ef7_634828.png "屏幕截图.png")
主题切换
![输入图片说明](https://images.gitee.com/uploads/images/2018/0906/230634_1d15df25_634828.png "3.png")

![输入图片说明](https://images.gitee.com/uploads/images/2018/0715/184549_502a3d43_634828.png "屏幕截图.png")

![输入图片说明](https://images.gitee.com/uploads/images/2018/0715/184626_9f85d46f_634828.png "屏幕截图.png")
#### 技术交流
官 网: [https://gitee.com/oufu](https://gitee.com/oufu)   QQ 群:  ①185948055 <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=9c5f0bdc44402195be254668a80a6c5eeebb06f0336e8c5be26878930b88c672"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="OFCMS技术交流" title="OFCMS技术交流"></a> 

博 客 [https://blog.csdn.net/oufua](https://blog.csdn.net/oufua)  

#### 相关文档
项目相关手册：[ https://blog.csdn.net/oufua](https://blog.csdn.net/oufua)

加群有相关部署文档、一起学习、交流。
QQ 群: ①185948055 <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=9c5f0bdc44402195be254668a80a6c5eeebb06f0336e8c5be26878930b88c672"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="OFCMS技术交流" title="OFCMS技术交流"></a> 

模板手册：[ https://blog.csdn.net/oufua/article/details/82500673](https://blog.csdn.net/oufua/article/details/82500673)

项目发展离不开你的支持：

![捐赠](https://images.gitee.com/uploads/images/2018/0727/110232_49d5dc17_634828.png "项目成长离不开你的支持")

感谢：

@luoyafeng  100元 ，@luoyafeng 18.88元  @luoyafeng 8.88元 @Alen 18.8