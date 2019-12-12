/**
 * Created by zchuanzhao on 2017/6/18.
 */
$(document).ready(function () {
    $(".timeago").timeago();
});
!function (t) {
    function e(e) {
        var n = t.extend(o.settings, e)
            , s = t.proxy(r, this);
        s(),
        n.refreshMillis > 0 && setInterval(s, n.refreshMillis)
    }
    function r() {
        var e = n(this)
            , r = e.datetime;
        return isNaN(r) || t(this).text(o.inWords(r)),
            this
    }
    function n(e) {
        return e = t(e),
        e.data("timeago") || e.data("timeago", {
            datetime: o.datetime(e)
        }),
            e.data("timeago")
    }
    function s(t) {
        return (new Date).getTime() - t.getTime()
    }
    function i(t) {
        var e = new Date;
        return e.getMonth() > t.getMonth() || e.getDate() > t.getDate()
    }
    function a(t) {
        return (new Date).getFullYear() > t.getFullYear()
    }
    Date.prototype.format = function (t) {
        var e = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            S: this.getMilliseconds()
        };
        /(y+)/.test(t) && (t = t.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length)));
        for (var r in e)
            new RegExp("(" + r + ")").test(t) && (t = t.replace(RegExp.$1, 1 == RegExp.$1.length ? e[r] : ("00" + e[r]).substr(("" + e[r]).length)));
        return t
    }
    ;
    var o = {
        settings: {
            refreshMillis: 6e4,
            relative: !0,
            strings: {
                suffixAgo: "前",
                seconds: "刚刚",
                minute: "1分钟",
                minutes: "%d分钟",
                hour: "1小时",
                hours: "%d小时",
                days: "%d天",
                months: "%d月",
                years: "%d年",
                numbers: []
            },
            yearsAgoFormat: "yyyy-MM-dd",
            daysAgoFormat: "MM-dd hh:mm"
        },
        inWords: function (e) {
            function r(e, r) {
                var n = t.isFunction(e) ? e(r, u) : e
                    , s = g.numbers && g.numbers[r] || r;
                return n.replace(/%d/i, s)
            }
            var n = o.settings.relative;
            if (!n && a(e))
                return e.format(this.settings.yearsAgoFormat);
            if (!n && i(e))
                return e.format(this.settings.daysAgoFormat);
            var u = s(e)
                , g = this.settings.strings
                , h = g.suffixAgo
                , d = Math.abs(u) / 1e3
                , l = d / 60
                , f = l / 60
                , m = f / 24
                , c = m / 30
                , M = m / 365;
            return words = 60 > d ? r(g.seconds, Math.floor(d)) : 60 > l ? r(g.minutes, Math.floor(l)) : 24 > f ? r(g.hours, Math.floor(f)) : 30 > m ? r(g.days, Math.floor(m)) : 365 > m ? r(g.months, Math.floor(c)) : r(g.years, Math.floor(M)),
                "刚刚" == words ? words : words + h
        },
        parse: function (e) {
            var r = t.trim(e);
            return r = r.replace(/\.\d+/, ""),
                r = r.replace(/-/, "/").replace(/-/, "/"),
                r = r.replace(/T/, " ").replace(/Z/, " UTC"),
                r = r.replace(/([\+\-]\d\d)\:?(\d\d)/, " $1$2"),
                new Date(r)
        },
        datetime: function (e) {
            var r = t(e).attr(o.isTime(e) ? "datetime" : "datetime");
            console.log()
            return o.parse(r)
        },
        isTime: function (e) {
            return "time" === t(e).get(0).tagName.toLowerCase()
        }
    };
    t.fn.timeago = function (t) {
        return this.each(function () {
            e.call(this, t)
        }),
            this
    }
}(window.jQuery)