/**
 *  字典配置
 * @author: OF
 * @version 1.0.0
 */
layui.sykDict = {
		//性别
		sex : {
			formatType : "local",
			labelField : "name",
			valueField : "code",
			//静态数据
			data:[{"code":1,"name":"男","style":"color:#F00;","css":"layui-badge layui-bg-green"},
				 {"code":2,"name":"女","css":"layui-badge layui-bg-orange"},
			]
		},
		//角色
		select_role : {
			formatType : "server",
			sqlid:"system.role.query",
			labelField : "role_name",
			valueField : "role_id"
		},
		//微信菜单类型
		weixin_menu_type : {
			formatType : "local",
			labelField : "name",
			valueField : "code",
			data:[{"code":"view","name":"网页"},
			      {"code":"click","name":"点击"},
			      {"code":"miniprogram","name":"小程序"},
			      {"code":"media_id","name":"素材"}
			]
		},
		//状态启用/禁止
		status : {
			formatType : "local",
			labelField : "name",
			valueField : "code",
			data:[{"code":0,"name":"禁止"},
					{"code":1,"name":"启用"}
			]
		},
    //是否启用
    is_start : {
        formatType : "local",
        labelField : "name",
        valueField : "code",
        data:[{"code":2,"name":"禁止","css":"layui-badge layui-bg-orange"},
            {"code":1,"name":"启用","style":"color:#F00;","css":"layui-badge layui-bg-green"}
        ]
    },
    //是否显示
    is_show : {
        formatType : "local",
        labelField : "name",
        valueField : "code",
        data:[{"code":0,"name":"不显 ","css":"layui-badge layui-bg-orange"},
            {"code":1,"name":"显示","style":"color:#F00;","css":"layui-badge layui-bg-green"}
        ]
    },
		//是否
		is_status : {
			formatType : "local",
			labelField : "name",
			valueField : "code",
			data:[{"code":0,"name":"否","css":"layui-badge layui-bg-orange"},
				{"code":1,"name":"是","style":"color:#F00;","css":"layui-badge layui-bg-green"}
			]
		},
		//定时任务1未启动 2、已启动  3已停止      
		job_status : {
			formatType : "local",
			labelField : "name",
			valueField : "code",
			data:[{"code":1,"name":"未启动 "},
			      {"code":2,"name":"已启动"},
			      {"code":3,"name":"已停止"},
			      {"code":4,"name":"已暂停"}
			]
		},
		menu_type : {
			formatType : "local",
			labelField : "name",
			valueField : "code",
			data:[{"code":0,"name":"目录","style":"color:#F00;","css":"layui-badge layui-bg-cyan"},
			      {"code":1,"name":"菜单","css":"layui-badge layui-bg-orange"},
			      {"code":2,"name":"按钮","css":"layui-badge layui-bg-green"},
			      {"code":3,"name":"其他","css":"layui-badge layui-bg-cyan"},
			      ]
		},
		//数据模型
		form_data : {
			formatType : "server",
            sqlid:"cms.form.query",
            labelField : "form_name",
            valueField : "form_id"
		},
	  //专题列表
		topic_id : {
			formatType : "server",
            sqlid:"cms.topic.list",
            labelField : "topic_name",
            valueField : "topic_id"
		},
    //类型
    index : {
        formatType : "local",
        labelField : "name",
        valueField : "code",
        data:[{"code":"index.html","name":"首页1","css":"layui-badge layui-bg-orange"},
            {"code":"index1.html","name":"首页2","css":"layui-badge layui-bg-cyan"}]
    }
		 
};