<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../css/hclam.css">
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
</head>
<body>
<table id="demo" lay-filter="test"></table>

<script src="../layui/layui.js" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/html" id="barDemo">
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
            , url: '/admin/selectComment.shtml'
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
                {type: "checkbox", fixed: "left", width: 50}
                , {field: 'com_id', title: 'ID', width: 70, sort: true, fixed: 'left'}
                , {field: 'art_title', title: '文章标题', width: 110}
                , {field: 'user_name', title: '用户名', width: 110}
                , {field: 'com_info', title: '评论内容', width: 190}
                , {
                    field: 'com_permission', title: '状态', width: 100, templet: function (d) {
                        if (d.com_permission == "1") {
                            return "待审核";
                        } else if (d.com_permission == "2") {
                            return "已通过";
                        } else if (d.com_permission == "3") {
                            return "已删除";
                        } else {
                            return "发生错误";
                        }
                    }
                }
                , {field: 'com_time', title: '评论时间', width: 180}
                , {field: 'com_fa_id', title: '回复', width: 80}
                , {title: '操作', align: "center", toolbar: '#barDemo', width: 140}
            ]]
        });

        jQuery('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var $ = layui.$, active = {
            reload: function () {
                var username = $('#user_name');
                var permission = $('#permission');
                console.log(permission.val());
                table.reload('testReload', {
                    where: {
                        user_name: username.val(),
                        permission: permission.val()
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
                        url: "/admin/operateComment.shtml",
                        type: "POST",
                        data: {
                            "com_id": data.com_id,
                            "com_permission": 3
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.state == 1) {
                                obj.update({
                                    com_permission: 3
                                });
                                layer.msg("删除成功");
                            } else {
                                layer.msg("删除失败");
                            }
                        }
                    });
                });
            } else if (obj.event == 'commit') {
                $.ajax({
                    url: "/admin/operateComment.shtml",
                    type: "POST",
                    data: {
                        "com_id": data.com_id,
                        "com_permission": 2
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.state == 1) {
                            obj.update({
                                com_permission: 2
                            });
                            layer.msg("审核成功");
                        } else {
                            layer.msg("审核失败");
                        }
                    }
                });
            }
        })
    });
</script>
</body>
</html>