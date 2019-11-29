/**
 * 请求公共访求
 * 
 * @author OF
 * @date 2017年11月23日
 */
!function(syk) {
	utile = {};
	/**
	 * 公共请求
	 * 
	 * @param config
	 *            参数
	 * @param callback
	 *            回调
	 */
	 utile.ajaxSubmit = function(config, callback, errorCallback) {
		if (config.url == '' || typeof (config.url) == "undefined") {
			return false;
		}
		if (config.data == '' || typeof (config.data) == "undefined") {
			config.data = {};
		}
		if (typeof (config.layer) == "undefined") {
			config.layer = true;
		}
		if (typeof (config.loading) == "undefined" && config.layer == false) {
			config.loading = false;
		} else {
			config.loading = true;
		}

		if (s.config.envDev) {
			console.log("request data : " + JSON.stringify(config.data));
		}
		var index;
		$.ajax({
			url : config.url,
			cache : false,
			data : JSON.stringify(config.data),
			type : s.config.ajax.type,
			dataType : s.config.ajax.dataType,
			contentType : s.config.ajax.contentType,
			beforeSend : function(xhq) {
				if (config.layer == true || config.loading == true) {
					index = layer.msg(s.config.ajax.beforeSend, {
						icon : 16,
						shade : 0.01,
						offset : '200px',
						time : 0
					});
				}
			},
			error : function(jqXHR) {
				layer.close(index)
				if (config.layer == true) {
					layer.msg(admin.config.ajax.error, {
						icon : 2,
						offset : '200px'
					});
				}
				if (typeof errorCallback === "function") {
					errorCallback(jqXHR);
				}
			},
			success : function(data) {
				layer.close(index)
				if (s.config.envDev) {
					console.log("response data : " + JSON.stringify(data));
				}
				if (data.code != '200') {
					if (config.layer == true) {
						layer.msg(data.msg, {
							icon : 2,
							offset : '200px',
							time : 2000
						});
					}
					if (typeof errorCallback === "function") {
						errorCallback();
					}
				} else {
					if (config.layer == true) {
						layer.msg(data.msg, {
							icon : 1,
							offset : '200px',
							time : 1000
						});
					}
					if (typeof callback === "function") {
						callback(data);
					}
				}
			},
		});
	}
	return admin.utile = utile;
}(admin);