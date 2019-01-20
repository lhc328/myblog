<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*,java.lang.*"%>
<%@ page import="com.myblog.entity.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/hclam.css">
	<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
</head>
<body>
	<div class="x-body">
		<form class="layui-form x-center" action="/admin/showUserByName.shtml" style="width:800px" method="post">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                      <input type="text" name="user_name" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                    	<select name="permission" style="display: block">
                    		<option value="0">所有</option>
				            <option value="1">管理员</option>
				            <option value="2">普通用户</option>
				            <option value="4">已删除</option>
			            </select>
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
                            ID
                        </th>
                        <th>
                            用户名
                        </th> 
                        <th>
                            邮箱
                        </th>                       
                        <th>
                            加入时间
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
                    <%
                        if(request.getAttribute("userlist") != null){
                            ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userlist");
                            for(int i = 0; i < userList.size() ; i++){
                                out.print("<tr><td><input type='checkbox' value='1' name=''></td><td>"+userList.get(i).getUser_id() + "</td>");
                                out.print(" <td>" + userList.get(i).getUser_name() + "</td>");
                                out.print(" <td>" + userList.get(i).getEmail() + "</td>");
                                out.print(" <td>" + userList.get(i).getReg_time() + "</td>");
                                String permission = null;
                                if(userList.get(i).getPermission()==1){
                                    permission = "管理员";
                                }else if(userList.get(i).getPermission()==2){
                                    permission = "普通用户";
                                }else if(userList.get(i).getPermission()==4){
                                    permission = "已删除";
                                }else{
                                    permission = "错误";
                                }
                                out.print("<td class='td-status'> <span class='layui-btn layui-btn-normal layui-btn-mini'>" + permission + "</span></td>");
                                out.print("<td class='td-manage'> <div class='site-demo-button' id='layerDemo' style='margin-bottom: 0;'> <button data-method='notice' data-type='" + userList.get(i).getUser_id() + "' class='layui-btn'> <i class='layui-icon'></i> </button> <button  class='layui-btn'> <a href='//www.baidu.com' style='text-decoration:none'><i class='layui-icon'></i></a></button></div></td></tr>");
                            }
                        }
                    %>
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
	<script>
layui.use('layer', function(){ //独立版的layer无需执行这一句
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
  
  //触发事件
  var active = {
    notice: function(othis){
        var uid = othis.data('type')
      //示范一个公告层
      layer.open({
        type: 1
        ,title: false //不显示标题栏
        ,closeBtn: true
        ,area: '400px;'
        ,shade: 0.8
        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        ,btnAlign: 'c'
        ,moveType: 0 //拖拽模式，0或者1
        ,content: '<div style="text-align:center; font-size:20px; margin: 10px 0">修改信息</div><hr><form class="layui-form" action="/admin/modiUserById.shtml" method="post" style="margin-top:30px"><div class="layui-form-item"><label class="layui-form-label">用户ID</label><div class="layui-input-inline"><input type="text" name="user_id" lay-verify="required" autocomplete="off" placeholder=' + uid + ' class="layui-input" value='+uid+'></div></div><div class="layui-form-item"><label class="layui-form-label">用户名</label><div class="layui-input-inline"><input type="text" name="user_name" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" name="password" lay-verify="required" placeholder="请输入密码6-12位" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">邮箱</label><div class="layui-input-inline"><input type="email" name="email" lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">权限</label><div class="layui-input-inline"><select name="permission" style="display: block"><option value="0">不变</option><option value="1">管理员</option><option value="2">普通用户</option><option value="4">已删除</option></select></div></div><div class="layui-form-item"><div class="layui-input-block"><input class="layui-btn" type="submit" lay-filter="demo1" value="确认修改"></div></div>'
      });
    }
  };
  
  $('#layerDemo .layui-btn').on('click', function(){
    var othis = $(this), method = othis.data('method');
    active[method] ? active[method].call(this, othis) : '';
  });
  
});
</script>
</body>
</html>