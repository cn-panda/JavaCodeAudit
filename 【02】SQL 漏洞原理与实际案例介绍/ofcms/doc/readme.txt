项目介绍
java 版CMS系统、基于java技术研发的内容管理系统、功能：栏目模板自定义、内容模型自定义、多个站点管理、在线模板页面编辑等功能、代码完全开源、MIT授权协议。
技术选型：jfinal mybatis mysql freemarker redis spring 等 layui zTree bootstrap 。
特点：支持多站点、可以根据需求添加手机站、pc站。
项目地址：https://gitee.com/oufu/ofcms
QQ 群: ①185948055 OFCMS技术交流 欢迎喜欢开源的朋友一起加入，共同学习、群里有相关文档。

### 使用说明
配置文件 resource/conf/admin.properties
weixin.properties 微信配置文件
shior 文件 resource/shior.ini
缓存 resource/ehcache.xml 后台账号 admin 密码 123456
目前功能未全部完成，后续进行版本升级补充。

###  项目依赖
ofcms-core 核心
ofcms-model  数据源
ofcms-front  模板
管理台
ofcms-admin  -> ofcms-core
ofcms-admin  -> ofcms-model
ofcms-admin  -> ofcms-front
###  部署说明
建议采用 idea 工具开发
mysql 5.6+
jdk 1.8
tomcat 8