/**
 * 菜单管理
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.define([ 'element' ], function(exports) {
	var element = layui.element, AdminTab = function() {
		this.config = {
			topMenuFilter : "adminTopMenu",// 头部菜单
			leftMenuFilter : "adminLeftMenu",// 左边菜单
			tabFilter : "adminMainTab"// 导航栏
		}
	};

	AdminTab.prototype.render = function(options) {
		var thisTab = this;
		$.extend(true, thisTab.config, options);

		thisTab.bindTabFilter();

		// 绑定左边菜单点击。
		element.on('nav(' + thisTab.config.leftMenuFilter + ')',
				function(elem) {
					thisTab.add(elem);
					$('body').removeClass('site-mobile');
				});
	};

	/**
	 * 新增tab
	 */
	AdminTab.prototype.add = function(elem) {
		var thisTab = this;
		var layId = $(elem).attr("lay-id");
		if ($.isEmpty(layId)) {
			layId = $.uuid();
		}
		// 判断导航栏是否存在
		if ($('#adminMainTab>li[lay-id="' + layId + '"]').length == 0) {
			$(elem).attr("lay-id", layId);
			var dom = $(elem).find("a");
			var title = $(elem).find("a").html();
			var dataUrl = dom.attr("dataUrl");
			if (!$.isEmpty(dataUrl)) {
				element.tabAdd(thisTab.config.tabFilter, {
					title : title,
					content : '<iframe src="' + dom.attr("dataUrl")
							+ '"></iframe>' // 支持传入html
					,
					id : layId
				});
			}
		} 
		thisTab.tabChange(layId);
	}

	/**
	 * 切换tab
	 */
	AdminTab.prototype.tabChange = function(layId) {
		element.tabChange(this.config.tabFilter, layId);
	}

	/**
	 * 删除
	 */
	AdminTab.prototype.del = function(layId) {
		element.tabDelete(this.config.tabFilter, layId);
	};

	/**
	 * 删除监听
	 */
	AdminTab.prototype.bindDeleteFilter = function() {
		element.on('tabDelete(' + this.config.tabFilter + ')', function(data) {
			var layId = $(this).parentsUntil().attr("lay-id");
			$(
					'#adminLeftMenu .layui-nav-child>dd[lay-id="' + layId
							+ '"],#adminLeftMenu>li[lay-id="' + layId + '"]')
					.removeAttr("lay-id");
		});
	}

	/**
	 * 监听tab切换，处理菜单选中
	 */
	AdminTab.prototype.bindTabFilter = function() {
		var thisTab = this;
		element.on('tab(' + this.config.tabFilter + ')', function(data) {
			var layId = $(this).attr("lay-id");

			thisTab.menuSelectCss(layId);

		});
	}

	/**
	 * 菜单选中样式
	 */
	AdminTab.prototype.menuSelectCss = function(layId) {
		if (!$.isEmpty(layId)) {
			$('#adminLeftMenu .layui-this').removeClass("layui-this");// 清除样式

			var dom = $('#adminLeftMenu .layui-nav-child>dd[lay-id="' + layId
					+ '"],#adminLeftMenu>li[lay-id="' + layId + '"]');
			dom.addClass("layui-this");// 追加样式

			// 处理头部菜单
			if (dom.length == 1) {
				var dataPid = null;
				var tagName = dom.get(0).tagName;
				if (tagName == "LI") {
					dataPid = dom.attr("dataPid");
				} else if (tagName == "DD") {
					dataPid = dom.parentsUntil('li').parent().attr("dataPid");
				}
				if (!$.isEmpty(dataPid)) {
					$('#adminTopMenu li[dataPid="' + dataPid + '"]').click();
				}
			}
		}
	}

	var adminTab = new AdminTab();
	// 绑定按钮
	exports("admin.tab", adminTab);
});