/**
 * Name:tab.js
 * Author:Van
 * E-mail:zheng_jinfan@126.com
 * Website:http://kit.zhengjinfan.cn/
 * LICENSE:MIT
 */
layui.define(['jquery', 'element', 'nprogress', 'utils'], function(exports) {
    var $ = layui.jquery,
        _modName = 'tab',
        element = layui.element,
        utils = layui.utils,
        _doc = $(document),
        _win = $(window),
        renderType = {
            page: 'page',
            iframe: 'iframe'
        };
    var Tab = function() {
        this.config = {
            elem: undefined,
            mainUrl: 'main.html',
            renderType: 'iframe',
            openWait: false
        };
        this.v = '1.0.5';
    };
    Tab.fn = Tab.prototype;
    Tab.fn.set = function(options) {
        var that = this;
        $.extend(true, that.config, options);
        return that;
    };
    /**
     * 渲染选项卡
     */
    Tab.fn.render = function() {
        var that = this,
            _config = that.config;
        if (_config.elem === undefined) {
            layui.hint().error('Tab error:请配置选择卡容器.')
            return that;
        }
        _tab._config = _config;
        _tab.createTabDom();
        return that;
    };
    /**
     * 添加一个选项卡
     */
    Tab.fn.tabAdd = function(params) {
        _tab.tabAdd(params);
    };
    /**
     * 关闭一个选项卡
     */
    Tab.fn.close = function(layId) {
        _tab.tabDelete(layId);
    };
    Tab.fn.getId = function() {
        return _tab.getCurrLayId();
    };
    //私用对象
    var _tab = {
        _config: {},
        _filter: 'kitTab', //过滤器名
        _title: undefined,
        _content: undefined,
        _parentElem: undefined, //要存放的容器
        //检查选项卡DOM是否存在
        tabDomExists: function() {
            var that = this;
            if (_doc.find('div.kit-tab').length > 0) {
                that._title = $('.kit-tab ul.layui-tab-title');
                that._content = $('.kit-tab div.layui-tab-content');
                return true;
            }
            return false;
        },
        /**
         * 创建选项卡DOM
         */
        createTabDom: function() {
            var that = this,
                _config = that._config;
            that._parentElem = _config.elem;
            if (that.tabDomExists())
                return;
            //模板
            var tpl = [
                    '<div class="layui-tab layui-tab-card kit-tab" lay-filter="' + that._filter + '">',
                    '<ul class="layui-tab-title">',
                    '<li class="layui-this" lay-id="-1" data-url="' + _config.mainUrl + '"><i class="layui-icon">&#xe68e;</i> 控制面板</li>',
                    '</ul>',
                    '<div class="kit-tab-tool">操作&nbsp;<i class="fa fa-caret-down"></i></div>',
                    '<div class="kit-tab-tool-body layui-anim layui-anim-upbit">',
                    '<ul>',
                    '<li class="kit-item" data-target="refresh">刷新当前选项卡</li>',
                    '<li class="kit-line"></li>',
                    '<li class="kit-item" data-target="closeCurrent">关闭当前选项卡</li>',
                    '<li class="kit-item" data-target="closeOther">关闭其他选项卡</li>',
                    '<li class="kit-line"></li>',
                    '<li class="kit-item" data-target="closeAll">关闭所有选项卡</li>',
                    '</ul>',
                    '</div>',
                    '<div class="layui-tab-content">',
                    '<div class="layui-tab-item layui-show" lay-item-id="-1">{{content}}</div>',
                    '</div>',
                    '</div>'
                ],
                _htm = tpl.join('');
            switch (_config.renderType) {
                case renderType.page:
                    _htm = _htm.replace('{{content}}', that.getBodyContent(_config.mainUrl + '?v=' + new Date().getTime()));
                    break;
                case renderType.iframe:
                    _htm = _htm.replace('{{content}}', '<iframe src="' + _config.mainUrl + '"></iframe>');
                    break;
            }
            //渲染
            $(_config.elem).html(_htm);
            that._title = $('.kit-tab ul.layui-tab-title');
            that._content = $('.kit-tab div.layui-tab-content');
            var _tool = $('.kit-tab-tool'),
                _toolBody = $('.kit-tab-tool-body');
            //监听操作点击事件
            _tool.on('click', function() {
                _toolBody.toggle();
            });
            //监听操作项点击事件
            _toolBody.find('li.kit-item').each(function() {
                var $that = $(this);
                var target = $that.data('target');
                $that.off('click').on('click', function() {
                    var layId = that._title.children('li[class=layui-this]').attr('lay-id');
                    switch (target) {
                        case 'refresh': //刷新
                            switch (_config.renderType) {
                                case renderType.page:
                                    var loadIndex = that.load();
                                    var url = that._title.children('li[lay-id=' + layId + ']').data('url');
                                    that._content.children('div[lay-item-id=' + layId + ']')
                                        .html(that.getBodyContent(url + '?v=' + new Date().getTime(), function() {
                                            that.closeLoad(loadIndex);
                                        }));
                                    break;
                                case renderType.iframe:
                                    var item = that._content.children('div[lay-item-id=' + layId + ']').children('iframe');
                                    item.attr('src', item.attr('src'));
                                    break;
                            }
                            break;
                        case 'closeCurrent': //关闭当前
                            if (layId != -1)
                                that.tabDelete(layId);
                            break;
                        case 'closeOther': //关闭其他
                            that._title.children('li[lay-id]').each(function() {
                                var curId = $(this).attr('lay-id');
                                if (curId != layId && curId != -1)
                                    that.tabDelete(curId);
                            });
                            break;
                        case 'closeAll': //关闭所有
                            that._title.children('li[lay-id]').each(function() {
                                var curId = $(this).attr('lay-id');
                                if (curId != -1)
                                    that.tabDelete(curId);
                            });
                            that.tabChange(-1);
                            break;
                    }
                    _tool.click();
                });
            });
            //监听浏览器窗口改变事件
            that.winResize();
        },
        load: function() {
            return layer.load(0, { shade: [0.3, '#333'] });
        },
        closeLoad: function(index) {
            setTimeout(function() {
                index && layer.close(index);
            }, 500);
        },
        getBodyContent: function(url, callback) {
            return utils.getBodyContent(utils.loadHtml(url, callback));
        },
        /**
         * 监听浏览器窗口改变事件
         */
        winResize: function() {
            var that = this,
                _config = that._config;
            _win.on('resize', function() {
                var currBoxHeight = $(that._parentElem).height(); //获取当前容器的高度
                switch (_config.renderType) {
                    case renderType.page:
                        $('.kit-tab .layui-tab-content').height(currBoxHeight - 43);
                        break;
                    case renderType.iframe:
                        $('.kit-tab .layui-tab-content iframe').height(currBoxHeight - 47);
                        break;
                }
            }).resize();
        },
        /**
         * 检查选项卡是否存在
         */
        tabExists: function(layId) {
            var that = this;
            return that._title.find('li[lay-id=' + layId + ']').length > 0;
        },
        /**
         * 删除选项卡
         */
        tabDelete: function(layId) {
            element.tabDelete(this._filter, layId);
        },
        /**
         * 设置选中选项卡
         */
        tabChange: function(layId) {
            element.tabChange(this._filter, layId);
        },
        /**
         * 获取选项卡对象
         */
        getTab: function(layId) {
            return this._title.find('li[lay-id=' + layId + ']');
        },
        /**
         * 添加一个选项卡，已存在则获取焦点
         */
        tabAdd: function(options) {
            var that = this,
                _config = that._config,
                loadIndex = undefined;
            options = options || {
                id: new Date().getTime(),
                title: '新标签页',
                icon: 'fa-file',
                url: '404.html'
            };
            var title = options.title,
                icon = options.icon,
                url = options.url,
                id = options.id;
            if (that.tabExists(id)) {
                that.tabChange(id);
                return;
            }
            NProgress.start();
            if (_config.openWait)
                loadIndex = that.load();
            var titleHtm = ['<li class="layui-this" lay-id="' + id + '" data-url="' + url + '">'];
            if (icon) {
                if (icon.indexOf('fa-') !== -1) {
                    titleHtm.push('<i class="fa ' + icon + '" aria-hidden="true"></i>');
                } else {
                    titleHtm.push('<i class="layui-icon">' + icon + '</i>');
                }
            }
            titleHtm.push('&nbsp;' + title);
            titleHtm.push('<i class="layui-icon layui-unselect layui-tab-close">&#x1006;</i>');
            titleHtm.push('</li>');
            var contentHtm = '<div class="layui-tab-item layui-show" lay-item-id="' + id + '">{{content}}</div>';
            switch (_config.renderType) {
                case renderType.page:
                    contentHtm = contentHtm.replace('{{content}}', that.getBodyContent(url + '?v=' + new Date().getTime(), function() {
                        setTimeout(function() {
                            NProgress.done();
                            _config.openWait && loadIndex && that.closeLoad(loadIndex);
                        }, 500);
                    }));
                    break;
                case renderType.iframe:
                    contentHtm = contentHtm.replace('{{content}}', '<iframe src="' + url + '"></iframe>');
                    break;
            }
            //追加htm
            that._title.append(titleHtm.join(''));
            that._content.append(contentHtm);
            if (_config.renderType === renderType.iframe) {
                that._content.find('div[lay-item-id=' + id + ']').find('iframe').on('load', function() {
                    NProgress.done();
                    _config.openWait && loadIndex && that.closeLoad(loadIndex);
                });
            }
            //监听选项卡关闭事件
            that.getTab(id).find('i.layui-tab-close').off('click').on('click', function() {
                //关闭之前
                if (_config.closeBefore) {
                    if (_config.closeBefore(options)) {
                        that.tabDelete(id);
                    }
                } else {
                    that.tabDelete(id);
                }
            });
            that.tabChange(id);
            that.winResize();
            if (_config.onSwitch) {
                element.on('tab(' + that._filter + ')', function(data) {
                    _config.onSwitch({
                        index: data.index,
                        elem: data.elem,
                        layId: that._title.children('li').eq(data.index).attr('lay-id')
                    });
                });
            }
        },
        /**
         * 获取当前选项卡的id
         */
        getCurrLayId: function() {
            return this._title.find('li.layui-this').attr('lay-id');
        }
    };

    var t = new Tab();

    exports('tab', t);
});