<%--
  Created by IntelliJ IDEA.
  User: koy
  Date: 2019/1/17
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<%@ page import="com.myblog.entity.User" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>hcl个人博客</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body>

<header>
  <ul class="layui-nav">
    <li class="layui-nav-item" style="margin-left:20%"><a href="">首页</a></li>
    <li class="layui-nav-item"><a href="">技术分享</a></li>
    <li class="layui-nav-item"><a href="">日记</a></li>
    <li class="layui-nav-item"><a href="">文件下载</a></li>
    <li class="layui-nav-item" style="float:right; margin-right:20%" >
      <%
        if(session.getAttribute("user")!=null){
            User user = (User)session.getAttribute("user");
          out.print("<a href='javascript:;'><img src='//t.cn/RCzsdCq' class='layui-nav-img'>" + user.getUser_name() + "</a><dl class='layui-nav-child'><dd><a>个人中心</a></dd><dd><a href='/logout.shtml'>注销</a></dd></dl>");
        }else{
          out.print("<div class='site-demo-button' id='layerDemo' style='margin-bottom: 0;'><button data-method='notice' class='layui-btn'>登录/注册</button></div>");
        }
      %>
    </li>
  </ul>

  <div style="height: 300px; background-image: url(images/nav.jpg);background-size: cover;
    background-position: center center;"></div>
</header>

<div style="background-color: #f5f5f5">
  <div class="layui-row"  style="width: 60%;margin: 0 auto;padding: 2em 0 2em; ">
    <div class="layui-col-xs12 layui-col-md8" >
      <div class="grid-demo grid-demo-bg1">
        <div style="height: 250px; background-color: white;margin: 10px 10px; box-shadow: 0 1px 2px rgba(0,0,0,.1);">
          <div class="layui-col-md3" style="width: 35%;height: 190px;margin: 10px 5px">
            <div class="grid-demo grid-demo-bg1">图片</div>
          </div>
          <div class="layui-col-md9" style="width: 60%;height: 190px;margin: 10px 5px 10px 0">
            <div class="grid-demo grid-demo-bg2">
              <header>
                <h2>标题</h2>
              </header>
              <div>
                <p>简介
              </div>
            </div>
          </div>
          <hr>
          <div class="layui-col-md12" style="height: 30px">
            <div class="grid-demo grid-demo-bg3" style="margin-left: 5px; ">
                   	<span>
                   		<a style="margin: 0 2px">2019年1月9日</a>
                   		<a style="margin: 0 2px">0条评论</a>
                   		<a style="margin: 0 2px">217次阅读</a>
                   		<a style="margin: 0 2px">45人点赞</a>
                   	</span>
              <span style="float: right;">
                   		<a style="margin-right:15px">阅读全文</a>
                   	</span>
            </div>
          </div>
        </div>
        <div style="height: 250px; background-color: white;margin: 10px 10px; box-shadow: 0 1px 2px rgba(0,0,0,.1);">
          <div class="layui-col-md3" style="width: 35%;height: 190px;margin: 10px 5px">
            <div class="grid-demo grid-demo-bg1">图片</div>
          </div>
          <div class="layui-col-md9" style="width: 60%;height: 190px;margin: 10px 5px 10px 0">
            <div class="grid-demo grid-demo-bg2">
              <header>
                <h2>标题</h2>
              </header>
              <div>
                <p>简介
              </div>
            </div>
          </div>
          <hr>
          <div class="layui-col-md12" style="height: 30px">
            <div class="grid-demo grid-demo-bg3" style="margin-left: 5px; ">
                   	<span>
                   		<a style="margin: 0 2px">2019年1月9日</a>
                   		<a style="margin: 0 2px">0条评论</a>
                   		<a style="margin: 0 2px">217次阅读</a>
                   		<a style="margin: 0 2px">45人点赞</a>
                   	</span>
              <span style="float: right;">
                   		<a style="margin-right:15px">阅读全文</a>
                   	</span>
            </div>
          </div>
        </div>
      </div>
      <div id="demo1" style="margin: 10px 0px 10px 20px;"></div>
    </div>
    <div class="layui-col-xs12 layui-col-md4">
      <div class="grid-demo grid-demo-bg1" style="text-align: center;">
        <div style="height: 400px; background-color: #fff; box-shadow: 0 1px 2px rgba(0,0,0,.1); margin: 10px 0px 10px 10px; ">
          分类
          <hr>
        </div>
        <div style="height: 350px; background-color: #fff; box-shadow: 0 1px 2px rgba(0,0,0,.1); margin: 10px 0px 10px 10px;">
          热文
          <hr>
        </div>
      </div>
    </div>
  </div>
</div>



<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
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
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: true
                    ,area: '400px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['注册', '忘记密码']
                    ,btnAlign: 'c'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: '<div style="text-align:center; font-size:20px; margin: 10px 0">登录</div><hr><form class="layui-form" action="/login.shtml" method="post" style="margin-top:30px"><div class="layui-form-item"><label class="layui-form-label">用户名</label><div class="layui-input-inline"><input type="text" name="user_name" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" name="password" lay-verify="required" placeholder="请输入密码6-12位" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><div class="layui-input-block"><input class="layui-btn" lay-filter="demo1" type="submit" value="登录"></div></div><hr style="margin:20px 0 10px 0;">'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'register.jsp'
                            ,target: '_self'
                        });
                        btn.find('.layui-layer-btn1').attr({
                            href: 'pages/admin.jsp'
                            ,target: '_self'
                        });
                    }
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