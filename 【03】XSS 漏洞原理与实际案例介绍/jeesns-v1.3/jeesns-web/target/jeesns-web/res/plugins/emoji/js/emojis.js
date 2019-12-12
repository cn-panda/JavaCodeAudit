(function($) {
    var basePath;
    var jsonData;
    var emojiPath;

    var defaults = {
        category: ['EmojiCategory-People', 'EmojiCategory-Nature', 'EmojiCategory-Objects', 'EmojiCategory-Places','EmojiCategory-Symbols'],
        showbar: true,
        trigger: 'click',
        insertAfter: function() {}
    };

    var render_nav = function(obj, options) {
        $(obj).append('<div class="emoji-inner"><ul class="emoji-nav"></ul><div class="emoji-content"></div></div>');
        if (!options.showbar) {
            $(obj).addClass('no-bar');
            return
        }
        var navs = _.reduce(options.category,
            function(items, item) {
                var citem = _.find(jsonData,
                    function(da) {
                        return da.typ == item
                    });
                return items + '<li data-name="' + item + '">' + citem.nm + '</li>'
            },
            '');
        $(obj).find('.emoji-nav').empty().append(navs)
    }

    var render_emoji = function(obj, options, typ) {
        var list = _.find(jsonData,
            function(item) {
                return item.typ == typ
            });
        if (!list) {
            list = jsonData[0]
        }
        var imgs = _.reduce(list.items,
            function(items, item) {
                if (item) {
                    return items + '<img title="' + item.name + '" src="' + basePath + emojiPath + item.src + '" data-name="' + item.name + '" data-src="' + emojiPath + item.src + '">';
                } else {
                    return items
                }
            },
            '');
        $(obj).find('.emoji-content').empty().append(imgs);
        $(obj).find('.emoji-nav li[data-name=' + list.typ + ']').addClass('on').siblings().removeClass("on")
    }

    var switchitem = function(obj, options) {
        $(obj).on(options.trigger, '.emoji-nav > li',
            function() {
                render_emoji(obj, options, $(this).attr('data-name'));
                return false;
            });
        $(obj).on('click', '.emoji-content > img',
            function() {
                options.insertAfter({
                    name: $(this).attr('data-name'),
                    src: $(this).attr('data-src')
                })
            })
    }

    var togglew = function(obj, option) {
        $(obj).on('click', '.emoji-tbtn',
            function() {
                $(obj).find('.emoji-inner').toggle();
                return false;
            });
        $(document).click(function() {
            $(obj).find('.emoji-inner').hide()
        })
    }

    var getDataJson = function(opt,_this) {
        if(jsonData == null || jsonData == undefined || jsonData == ""){
            $.ajax({
                url: basePath + '/emoji/emojiJsonData.json',
                type: 'get',
                dataType: 'json',
                cache:true,
                success: function(data) {
                    var dataJson = eval('(' + data + ')');
                    jsonData = dataJson.data;
                    emojiPath = dataJson.path;
                    var options = $.extend({}, defaults, opt || {});
                    _this.hide = function() {
                        $(_this).find('.emoji-inner').hide()
                    }

                    _this.show = function() {
                        $(_this).find('.emoji-inner').show()
                    }

                    render_nav(_this, options);
                    render_emoji(_this, options);
                    switchitem(_this, options);
                    togglew(_this, options)
                }
            });
        }else {
            var options = $.extend({}, defaults, opt || {});
            _this.hide = function() {
                $(_this).find('.emoji-inner').hide()
            }

            _this.show = function() {
                $(_this).find('.emoji-inner').show()
            }

            render_nav(_this, options);
            render_emoji(_this, options);
            switchitem(_this, options);
            togglew(_this, options)
        }

    }

    $.fn.emoji = function(opt, base) {
        basePath = base;
        getDataJson(opt,this);
        return "";

    }
})(jQuery)