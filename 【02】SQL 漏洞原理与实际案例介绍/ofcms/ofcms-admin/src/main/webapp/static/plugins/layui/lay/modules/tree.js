;
layui.define("jquery", function(e) {
    "use strict";
    var o = layui.jquery,
        a = layui.hint(),
        f = layui.form,
        r = "layui-tree-enter",
        i = function(e) {
            this.options = e
        },
        t = {
            arrow: ["&#xe623;", "&#xe625;"],
            checkbox: ["&#xe626;", "&#xe627;"],
            radio: ["&#xe62b;", "&#xe62a;"],
            branch: ["&#xe622;", "&#xe624;"],
            leaf: "&#xe621;"
        },
        index = 1,
        tt = {},
        TreeTable = function() {
            this.mapping = {};
        },
        TreeNode = function(item) {
            this.item = item;
            this.nodes = [];
        };
        i.prototype.expand = function(treeNode, isOpened, e) {
            var o = this;
            var subTreeNodes = treeNode.nodes;
            if (subTreeNodes && subTreeNodes.length > 0) {
                for (var ind = 0; ind < subTreeNodes.length; ind++) {
                    var subTreeNode = subTreeNodes[ind];
                    var subTrNode = document.getElementById(subTreeNode.id);
                    if (subTrNode) {
                        !isOpened ? (e.data("spread", null), subTrNode.setAttribute('class', 'layui-hide')) : (e.data("spread", !0), subTrNode.setAttribute('class', ''))
                    }
                    if (isOpened && !subTreeNode.isOpened) {
                        continue;
                    }
                    o.expand(subTreeNode, isOpened, e);
                }
            }
        },
        i.prototype.traverseModel = function(treeTable, parentNode, item, childrenAttrs) {
            var o = this;
            if (item) {
                var treeNode = new TreeNode(item);
                if (parentNode) {
                    treeNode.parentId = parentNode.id;
                    treeNode.id = item.id;
                    treeNode.level = parentNode.level + 1;
                    parentNode.nodes[parentNode.nodes.length] = treeNode;
                    treeNode.parent = parentNode;
                } else {
                    treeNode.id = item.id;
                    treeNode.level = 0;
                }
                treeNode.isOpened = false;
                treeTable.mapping[treeNode.id] = treeNode;
                var children = item[childrenAttrs];
                if (children && children.constructor == Array) {
                    for (var i = 0; i < children.length; i++) {
                        o.traverseModel(treeTable, treeNode, children[i], childrenAttrs);
                    }
                }
            }
        }, i.prototype.init = function(e) {
            var o = this;
            e.addClass("layui-box layui-tree"), o.options.skin && e.addClass("layui-tree-skin-" + o.options.skin), o.tree(e), o.on(e)
        }, i.prototype.initGird = function(e) {
            var ob = this, i = ob.options;
            var tableHeaderStr = '<thead><tr>';
            tableHeaderStr += (i.checkbox == false ? '<th style="width:10px"></th>' : '<th style="width:10px"><input type="checkbox" name="treeGirdCheckbox" lay-skin="primary" lay-filter="allChoose"></th>');
            for (var ind = 0; ind < i.layout.length; ind++) {
                var headerClass = i.layout[ind].headerClass ? ' class="' + i.layout[ind].headerClass + '"' : '';
                tableHeaderStr += '<th' + headerClass + '>' + i.layout[ind].name + '</th>';
            }
            tableHeaderStr += '</tr></thead>';
            tableHeaderStr = o(tableHeaderStr);

            f.on('checkbox(allChoose)', function(data){
                var child = o(data.elem).parents('table').find('tbody input[type="checkbox"]');  
                child.each(function(index, item){  
                    item.checked = data.elem.checked;  
                });  
            
                f.render('checkbox');  
            });

            f.on('checkbox(*)',function(data){
                
                var sib = o(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
                var total = o(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
                if(sib == total){
                    o(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",true);
                    f.render();
                }else{
                    o(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",false);
                    f.render();
                }
            }); 

            tt = new TreeTable();
            var root = {
                id: 'root',
                children: i.nodes
            }
            ob.traverseModel(tt, null, root, ['children']);
            e.addClass("layui-tree"),
                i.skin && e.addClass("layui-tree-skin-" + i.skin),
                ob.treeGird(e),
                e.wrapInner('<tbody></tbody'),
                e.prepend(tableHeaderStr),
                e.wrapInner('<table class="layui-table"></table>'),
                e.wrapInner('<div class="layui-form"></div>'),
                ob.on(e);
            return e;
        }, i.prototype.tree = function(e, a) {
            var r = this,
                i = r.options,
                n = a || i.nodes;
            layui.each(n, function(a, n) {
                if (n.children) {
                    layui.each(n.children, function(index, item) {
                        item.pid = n.id;
                    });
                }
                var l = n.children && n.children.length > 0,
                    c = o('<ul class="' + (n.spread ? "layui-show" : "") + '"></ul>'),
                    s = o(["<li " + (n.spread ? 'data-spread="' + n.spread + '"' : "") + ">", function() {
                        return l ? '<i class="layui-icon layui-tree-spread">' + (n.spread ? t.arrow[1] : t.arrow[0]) + "</i>" : "";
                    }(), function() {
                        return i.check && i.check == "checkbox" ? '<input type="checkbox" name="' + i.checkboxName + '" ' + ((n.checked && n.checked == true) ? 'checked="checked"' : "") + (n.checkboxValue ? ('value="' + n.checkboxValue + '"') : "") + 'data-parent-id="' + n.pid + '"' + 'id="' + n.id + '"' + (i.checkboxStyle ? ('style="' + i.checkboxStyle + '"') : "") + ' />' : "";
                    }(), function() {
                        return '<a href="' + (n.href || "javascript:;") + '" ' + (i.target && n.href ? 'target="' + i.target + '"' : "") + ">" + ('<i class="layui-icon layui-tree-' + (l ? "branch" : "leaf") + '">' + (l ? n.spread ? t.branch[1] : t.branch[0] : t.leaf) + "</i>") + ("<cite>" + (n.name || "未命名") + "</cite></a>")
                    }(), "</li>"].join(""));
                l && (s.append(c), r.tree(c, n.children)), e.append(s), "function" == typeof i.click && r.click(s, n), r.spread(s, n), i.drag && r.drag(s, n)
                r.changed(s, n)
            })
        }, i.prototype.treeGird = function(e, a) {
            var r = this,
                i = r.options,
                n = a || i.nodes;
            layui.each(n, function(a, n) {
                if (n.children) {
                    layui.each(n.children, function(index, item) {
                        item.pid = n.id;
                    });
                }
                var treeNode = tt.mapping[n.id];
                var indent = "";
                if (treeNode.level > 1) {
                    for (var ind = 1; ind < treeNode.level; ind++) {
                        indent += '<span style="display: inline-block;width: 20px;"></span>';
                    }
                }
                var p;
                if (i.spreadable) {
                    n.spread = true, p = false, treeNode.isOpened = true;
                } else {
                    p = treeNode.parentId == 'root' ? null : treeNode.parentId;
                }
                var l = n.children && n.children.length > 0,
                    str = o(['<tr class="' + (p ? "layui-hide" : "") + '" id="' + n.id + '">', 
                        function() {
                            if (i.checkbox){
                                return '<td><input type="checkbox" name="treeGirdCheckbox" lay-skin="primary" lay-filter="*" value="' + n.id + '"></td>';
                            }else{
                                return '<td>' + index + '</td>';
                            }
                        }(), 
                        function() {
                            var ret = ""
                            for (var ind = 0; ind < i.layout.length; ind++) {
                                if (i.layout[ind].treeNodes) {
                                    ret += '<td class="' + i.layout[ind].colClass + '" style="' + i.layout[ind].style + '"><li ' + (n.spread ? 'data-spread="' + n.spread + '"' : "") + '>' + (indent + (l ? '<i class="layui-icon layui-tree-spread">' + (n.spread ? t.arrow[1] : t.arrow[0]) + "</i>" : "")) + '<a href="' + (n.href || "javascript:;") + '" ' + (i.target && n.href ? 'target="' + i.target + '"' : "") + ">" + ('<i class="layui-icon layui-tree-' + (l ? "branch" : "leaf") + '">' + (l ? n.spread ? t.branch[1] : t.branch[0] : t.leaf) + "</i>") + ("<cite>" + (n.name || "未命名") + "</cite></a></li></td>");
                                } else if (i.layout[ind].render) {
                                    ret += '<td class="' + i.layout[ind].colClass + '" style="' + i.layout[ind].style + '">' + i.layout[ind].render(n) + '</td>'
                                } else {
                                    ret += '<td class="' + i.layout[ind].colClass + '" style="' + i.layout[ind].style + '">' + n[i.layout[ind].field] + '</td>';
                                }
                            }
                            return ret;
                        }(), "</tr>"].join(""));
                e.append(str), index++, l && (r.treeGird(e, n.children)), r.spreadGird(str, n), i.drag && r.drag(str, n)
                r.changed(str, n)
            })
        }, i.prototype.changed = function(e, o) {
            var r = this;
            if (o.pid == undefined || o.pid == null) {
                e.children("input").on("change", function() {
                    var childUl = e.children("ul"),
                        checked = this.checked;
                    childUl.find("input").prop("checked", checked);
                })
            } else {
                e.children("input").on("change", function() {
                    var that = this;
                    if (!this.checked) {
                        if (o.children && o.children.length > 0) {
                            var childUl = e.children("ul"),
                                checked = this.checked;
                            childUl.find("input").prop("checked", checked);
                        }
                        r.cancelParentsCheckboxCheck(that);
                    } else {
                        r.parentsChecked(this, this.checked);
                        if (o.children && o.children.length > 0) {
                            var childUl = e.children("ul"),
                                checked = this.checked;
                            childUl.find("input").prop("checked", checked);
                        }
                    }
                });
            }
        }, i.prototype.cancelParentsCheckboxCheck = function(ele) {
            if (!ele) {
                return;
            }
            var r = this,
                siblingInputs = r.siblingInputs(ele),
                parentId = ele.getAttribute("data-parent-id"),
                parentInput = null,
                bool = true,
                childrendInputs = null,
                hasOneChildrenInputCheck = false;
            if (parentId != 'undefined') {
                parentInput = document.getElementById(parentId);
                childrendInputs = r.currentChildrenInputs(parentInput);
            }
            for (var i = 0, len = siblingInputs.length; i < len; i++) {
                if (siblingInputs[i].checked) {
                    bool = false;
                    break;
                }
            }
            if (!childrendInputs || childrendInputs.length == 0) {
                hasOneChildrenInputCheck = false;
            } else {
                for (var j = 0, len2 = childrendInputs.length; j < len2; j++) {
                    if (childrendInputs[j].getAttribute("data-parent-id") != "undefined") {
                        if (childrendInputs[j].checked) {
                            console.log(1158)
                            hasOneChildrenInputCheck = true;
                            break;
                        }
                    }
                }
            }
            if (bool && !hasOneChildrenInputCheck) {
                r.inputChecked(parentInput, false);
            }
            this.cancelParentsCheckboxCheck(parentInput);
        }, i.prototype.siblingInputs = function(ele) {
            var that = this;
            if (ele) {
                var parent = ele.parentElement,
                    parents = parent.parentElement,
                    childrens = parents.children,
                    siblingInputs = [];
            } else {
                return null;
            }
            for (var i = 0, len = childrens.length; i < len; i++) {
                if (childrens[i] != parent) {
                    if (childrens[i].children[0].nodeName == "INPUT") {
                        siblingInputs.push(childrens[i].children[0]);
                    }
                    if (childrens[i].children[1].nodeName == "INPUT") {
                        siblingInputs.push(childrens[i].children[1]);
                    }
                }
            }
            parent = null;
            parents = null;
            childrens = null;
            return siblingInputs;
        }, i.prototype.currentChildrenInputs = function(ele) {
            var parent = ele.parentElement,
                childrenInputs = [];
            if (parent.getElementsByTagName("ul").length > 0) {
                var uls = parent.getElementsByTagName("ul");
                for (var i = 0, len = uls.length; i < len; i++) {
                    var inputs = uls[i].getElementsByTagName("input");
                    for (var j = 0, len2 = inputs.length; j < len2; j++) {
                        childrenInputs.push(inputs[j]);
                    }
                }
            }
            return childrenInputs;
        }, i.prototype.inputChecked = function(ele, checked) {
            ele.checked = checked;
        }, i.prototype.parentsChecked = function(e, checked) {
            var r = this,
                i = r.options,
                selector = i.elem,
                currentInput = e;
            if (currentInput && (currentInput.nodeName == "INPUT")) {
                var parentId = currentInput.getAttribute("data-parent-id"),
                    parentInput = null;
                setTimeout(function() {
                    r.check(currentInput, checked);
                    if (parentId) {
                        r.parentsChecked(document.getElementById(parentId), checked);
                    }
                }, 50);
            }
        }, i.prototype.findParents = function(ele, selector) {
            var parent = ele.parentElement,
                that = this;
            if (selector.substr(0, 1) == "#") {
                if (parent) {
                    if (parent.id != selector.substr(1)) {
                        that.findParents(parent, selector);
                    } else {
                        return parent;
                    }
                }
            } else if (selector.substr(0, 1) == ".") {
                if (parent) {
                    var classnameArr = parent.className.split(" "),
                        len = classnameArr.length,
                        selectt = selector.substr(1),
                        hasSelector = false;
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            if (classnameArr[i] == selectt) {
                                hasSelector = true;
                                break;
                            }
                        }
                    }
                    if (!hasSelector) {
                        that.findParents(parent, selector);
                    } else if (hasSelector) {
                        return parent;
                    }
                }
            }
        }, i.prototype.num = 1, i.prototype.uuid = function() {
            var that = this,
                randomStr = ['l', 'a', 'y', 'e', 'r', 'n', 'i'],
                randomNum = Math.floor(Math.random() * 6);
            return function() {
                var str = "";
                for (var i = 0; i <= randomNum; i++) {
                    str += randomStr[Math.floor(Math.random() * 6)];
                }
                return "layer_" + new Date().getTime() + "_" + (that.num++) + "_" + (++that.num) + "_" + str;
            }();
        }, i.prototype.check = function(input, bool) {
            if (bool) {
                input.checked = true;
            } else {
                input.checked = false;
            }
        }, i.prototype.click = function(e, o) {
            var a = this,
                r = a.options;
            e.children("a").on("click", function(e) {
                layui.stope(e), r.click(o)
            })
        }, i.prototype.spread = function(e, o) {
            var a = this,
                r = (a.options, e.children(".layui-tree-spread")),
                i = e.children("ul"),
                n = e.children("a"),
                l = function() {
                    e.data("spread") ? (e.data("spread", null), i.removeClass("layui-show"), r.html(t.arrow[0]), n.find(".layui-icon").html(t.branch[0])) : (e.data("spread", !0), i.addClass("layui-show"), r.html(t.arrow[1]), n.find(".layui-icon").html(t.branch[1]))
                };
            i[0] && (r.on("click", l), n.on("dblclick", l))
        }, i.prototype.spreadGird = function(e, o) {
            var a = this,
                r = (a.options, e.find(".layui-tree-spread")),
                nodeId = e[0].id,
                ri = e.find(".layui-tree-branch"),
                l = function() {
                    var treeNode = tt.mapping[nodeId];
                    var isOpened = treeNode.isOpened;
                    a.expand(treeNode, !isOpened, e);
                    isOpened ? (e.data("spread", null), r.html(t.arrow[0]), ri.html(t.branch[0])) : (e.data("spread", !0), r.html(t.arrow[1]), ri.html(t.branch[1]))
                    treeNode.isOpened = !isOpened;
                };
            (r.on("click", l), r.on("dblclick", l))
        }, i.prototype.on = function(e) {
            var a = this,
                i = a.options,
                t = "layui-tree-drag";
            e.find("i").on("selectstart", function(e) {
                return !1
            }), i.drag && o(document).on("mousemove", function(e) {
                var r = a.move;
                if (r.from) {
                    var i = (r.to, o('<div class="layui-box ' + t + '"></div>'));
                    e.preventDefault(), o("." + t)[0] || o("body").append(i);
                    var n = o("." + t)[0] ? o("." + t) : i;
                    n.addClass("layui-show").html(r.from.elem.children("a").html()), n.css({
                        left: e.pageX + 10,
                        top: e.pageY + 10
                    })
                }
            }).on("mouseup", function() {
                var e = a.move;
                e.from && (e.from.elem.children("a").removeClass(r), e.to && e.to.elem.children("a").removeClass(r), a.move = {}, o("." + t).remove())
            })
        }, i.prototype.move = {}, i.prototype.drag = function(e, a) {
            var i = this,
                t = (i.options, e.children("a")),
                n = function() {
                    var t = o(this),
                        n = i.move;
                    n.from && (n.to = {
                        item: a,
                        elem: e
                    }, t.addClass(r))
                };
            t.on("mousedown", function() {
                var o = i.move;
                o.from = {
                    item: a,
                    elem: e
                }
            }), t.on("mouseenter", n).on("mousemove", n).on("mouseleave", function() {
                var e = o(this),
                    a = i.move;
                a.from && (delete a.to, e.removeClass(r))
            })
        },  e("tree", function(e) {
            var r = new i(e = e || {}),
                t = o(e.elem);
            return t[0] ? void r.init(t) : a.error("layui.tree 没有找到" + e.elem + "元素");
        }), e("treeGird", function(e) {
            var r = new i(e = e || {}),
                t = o(e.elem);
            var v = r.initGird(t);
            return t[0] ? v : a.error("layui.tree 没有找到" + e.elem + "元素");
        }), e("expand", function(el) {
            var a = this,
                oi = new i(el = el || {});
            for (var key in tt.mapping) {
                var treeNode = tt.mapping[key];
                if (treeNode.id == 'root') {
                    return;
                }
                var isOpened = treeNode.isOpened;
                if (isOpened) {
                    continue;
                }
                var e = o('#' + treeNode.id),
                    r = (a.options, e.find(".layui-tree-spread")),
                    ri = e.find(".layui-tree-branch");
                oi.expand(treeNode, !isOpened, e);
                isOpened ? (e.data("spread", null), r.html(t.arrow[0]), ri.html(t.branch[0])) : (e.data("spread", !0), r.html(t.arrow[1]), ri.html(t.branch[1]))
                treeNode.isOpened = !isOpened;
            }
        }), e("collapse", function(el) {
            var a = this,
                oi = new i(el = el || {});
            for (var key in tt.mapping) {
                var treeNode = tt.mapping[key];
                if (treeNode.id == 'root') {
                    return;
                }
                var isOpened = treeNode.isOpened;
                if (!isOpened) {
                    continue;
                }
                var e = o('#' + treeNode.id),
                    r = (a.options, e.find(".layui-tree-spread")),
                    ri = e.find(".layui-tree-branch");
                oi.expand(treeNode, !isOpened, e);
                isOpened ? (e.data("spread", null), r.html(t.arrow[0]), ri.html(t.branch[0])) : (e.data("spread", !0), r.html(t.arrow[1]), ri.html(t.branch[1]))
                treeNode.isOpened = !isOpened;
            }
        }), e("getSelected", function(el){
            var arr = new Array();
            el.find("input[type=checkbox]:checked").each(function(index, el) {
                var treeNode = tt.mapping[el.value];
                if (treeNode && treeNode.item){
                    arr.push(treeNode.item);
                }
            });
            return arr;
        })
});