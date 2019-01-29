<%@ page language="java" pageEncoding="UTF-8" import="java.lang.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" media="all">
</head>
<body>
<div class="demoTable">
    <div class="layui-form-item">
        <label class="layui-form-label">文章标题</label>
        <div class="layui-input-inline">
            <input type="text" name="art_title" id="art_title" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">文章分类</label>
        <div class="layui-input-inline">
            <input type="text" name="art_type" id="art_type" placeholder="请输入文章类别" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <select name="art_permission" id="art_permission" style="display: block">
                <option value="0">所有</option>
                <option value="1">待审核</option>
                <option value="2">已通过</option>
                <option value="3">已删除</option>
            </select>
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
</div>
<table id="demo" lay-filter="test">

</table>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="commit">通过</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#demo'
            , height: 512
            , limit: 10
            , url: '/article/showSomeArt.shtml'
            , request: {
                pageName: 'page'
                , limitName: 'limit'
            }
            , parseData: function (res) { //res 即为原始返回的数据
                console.log(res);
            }
            , page: true
            , id: 'testReload'
            , cols: [[
                {field: 'art_id', title: 'ID', width: 60, sort: true, fixed: 'left'}
                , {field: 'art_title', title: '文章标题', width: 130}
                , {field: 'art_info', title: '文章简介', width: 180}
                , {field: 'user_name', title: '作者', width: 70}
                , {field: 'art_type', title: '分类', width: 105}
                , {field: 'art_time', title: '发布时间', width: 170}
                , {
                    field: 'art_permission', title: '状态', width: 78, templet: function (d) {
                        if (d.art_permission == "1") {
                            return "待审核";
                        } else if (d.art_permission == "2") {
                            return "已通过";
                        } else if (d.art_permission == "3") {
                            return "已删除";
                        } else {
                            return "发生错误";
                        }
                    }
                }
                , {title: '操作', align: "center", toolbar: '#barDemo', width: 165}
            ]]
        });

        jQuery('.demoTable .layui-form-item .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var $ = layui.$, active = {
            reload: function () {
                var art_title = $('#art_title');
                var art_type = $('#art_type');
                var art_permission = $('#art_permission');
                console.log(art_permission.val());
                table.reload('testReload', {
                    where: {
                        art_title : art_title.val(),
                        art_type : art_type.val(),
                        art_permission: art_permission.val()
                    }
                });
            }
        };

        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event == 'del') {
                console.log(data);
                layer.confirm('真的删除吗', function (index) {
                    $.ajax({
                        url: "/article//modifyArtPer.shtml",
                        type: "POST",
                        data: {
                            "art_id": data.art_id,
                            "art_permission": 3
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.state == 1) {
                                obj.update({
                                    art_permission: 3
                                });
                                layer.msg("删除成功");
                            } else {
                                layer.msg("删除失败");
                            }
                        }
                    });
                });
            } else if(obj.event == 'commit'){
                layer.confirm('真的同意通过吗', function (index) {
                    $.ajax({
                        url: "/article//modifyArtPer.shtml",
                        type: "POST",
                        data: {
                            "art_id": data.art_id,
                            "art_permission": 2
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.state == 1) {
                                obj.update({
                                    art_permission: 2
                                });
                                layer.msg("审核成功");
                            } else {
                                layer.msg("通过失败");
                            }
                        }
                    });
                });
            }else if (obj.event == 'edit') {
                layer.open({
                    type: 1
                    ,
                    title: false //不显示标题栏
                    ,
                    closeBtn: true
                    ,
                    area: '400px;'
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btnAlign: 'c'
                    ,
                    moveType: 0 //拖拽模式，0或者1
                    ,
                    content: '<div style="text-align:center; font-size:20px; margin: 10px 0">修改信息</div><hr><form class="layui-form" action="/admin/modiUserById.shtml" method="post" style="margin-top:30px"><div class="layui-form-item"><label class="layui-form-label">用户ID</label><div class="layui-input-inline"><input type="text" name="user_id" lay-verify="required" autocomplete="off" placeholder=' + data.user_id + ' class="layui-input" value=' + data.user_id + '></div></div><div class="layui-form-item"><label class="layui-form-label">用户名</label><div class="layui-input-inline"><input type="text" name="user_name" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" name="password" lay-verify="required" placeholder="请输入密码6-12位" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">邮箱</label><div class="layui-input-inline"><input type="email" name="email" lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">权限</label><div class="layui-input-inline"><select name="permission" style="display: block"><option value="0">不变</option><option value="1">管理员</option><option value="2">普通用户</option><option value="4">已删除</option></select></div></div><div class="layui-form-item"><div class="layui-input-block"><input class="layui-btn" type="submit" lay-filter="demo1" value="确认修改"></div></div>'
                });
            }
        })
    });
</script>
</body>
</html>