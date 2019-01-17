<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/hclam.css">
	<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
</head>
<body>
	<div class="x-body">
		<form class="layui-form x-center" action="" >
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                      <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                     <label class="layui-form-label">文章名</label>
                    <div class="layui-input-inline">
                      <input type="text" name="title" placeholder="请输入文章名" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <input class="layui-btn" lay-filter="demo1" type="submit" value="提交查询">
                    </div>
                  </div>
                </div> 
            </form>
            <xblock><button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button><span class="x-right" style="line-height:40px">共有数据：88 条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" name="" value="">
                        </th>
                        <th>
                            文章标题
                        </th>
                        <th>
                            用户名
                        </th> 
                        <th>
                            评论内容
                        </th>                       
                        <th>
                            评论时间
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td>
                            我的博客
                        </td>
                        <td>
                            小明
                        </td>
                        <td style="width: 500px">
                            本页演示是采用了Layui加载的layer，如果你使用的是独立版的layer，无需通过layui.use('layer')来加载。Layui中的layer与独立版的layer的唯一不同，就是加载方式这一点有所差异，请阅读文档：http://www.layui.com/doc/modules/layer.html#use
                        </td>
                        <td>
                            2017-01-01 11:11:42
                        </td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已启用
                            </span>
                        </td>
                        <td class="td-manage">
                            <a href="//www.baidu.com" style="text-decoration:none">
                                <i class="layui-icon"></i>
                            </a> 
                        	<a href="//www.baidu.com" style="text-decoration:none">
                                    <i class="layui-icon"></i>
                            </a> 
                            <a href="">
                                <i class="layui-icon"></i>
                            </a>
                        </div>
                        </td>
                    </tr>
                </tbody>
            </table>
	</div>
	<div id="demo1" style="margin: 10px 0px 10px 20px;"></div>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  
  
  //总页数大于页码总数
  laypage.render({
    elem: 'demo1'
    ,count: 2 //数据总数
    ,jump: function(obj){
      console.log(obj)
    }
  });
});
</script>
</body>
</html>