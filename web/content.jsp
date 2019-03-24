<%@ page language="java" pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<%@ page import="com.myblog.entity.User" %>
<%@ page import="com.myblog.entity.Article" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>hcl个人博客</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="<%=path %>/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path %>/editormd/css/editormd.css" />
    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/editormd/lib/marked.min.js"></script>
    <script src="<%=path %>/editormd/lib/prettify.min.js"></script>
    <script src="<%=path %>/editormd/lib/raphael.min.js"></script>
    <script src="<%=path %>/editormd/lib/underscore.min.js"></script>
    <script src="<%=path %>/editormd/lib/sequence-diagram.min.js"></script>
    <script src="<%=path %>/editormd/lib/flowchart.min.js"></script>
    <script src="<%=path %>/editormd/editormd.min.js"></script>
</head>
<body>
 
<header>
<ul class="layui-nav">
  <li class="layui-nav-item" style="margin-left:20%"><a href="../index.jsp">首页</a></li>
    <li class="layui-nav-item" style="float:right; margin-right:20%" >
        <%
            if(session.getAttribute("user")!=null){
                User user = (User)session.getAttribute("user");
                out.print("<a href='javascript:;'><img src='//t.cn/RCzsdCq' class='layui-nav-img'>" + user.getUser_name() + "</a><dl class='layui-nav-child'><dd><a>个人中心</a></dd><dd><a href='/logout.shtml?art_id=" + ((Article)request.getAttribute("article")).getArt_id() + "' >注销</a></dd></dl>");
            }else{
                out.print("<div class='site-demo-button' id='layerDemo' style='margin-bottom: 0;'><button data-method='notice' class='layui-btn'>登录/注册</button></div>");
            }
        %>
    </li>
</ul>
</header>

<div style="background-color: #f5f5f5">
<div class="layui-row"  style="width: 80%;margin: 0 auto;padding: 2em 0 2em; ">
    <div class="layui-col-xs12 layui-col-md8" style="margin-right: 4%;">
      <div class="grid-demo grid-demo-bg1">
          <%
            if(request.getAttribute("article") != null){
                Article article = (Article)request.getAttribute("article");
                out.print("<div id='my-editormd' >");
                out.print("<textarea>" + article.getContent() + "</textarea>");
                out.print("</div><div style='background: #ffffff; margin-right: -40px'><span>阅读量："+article.getArt_viewers()+"</span>");

                out.print("<span style='float: right; padding-right: 20px'>作者：" + article.getUser_name() + "</span></div>");
            }else{
                out.print("<h2>null</h2>");
            }
          %>
      </div>
        <div class="layui-row" style="width: 80%;margin: 0 auto;padding: 2em 0 2em; ">
            <div class="layui-col-xs12 layui-col-md8" style="margin-right: 4%;">
                <div class="grid-demo grid-demo-bg1">
                    <form class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">文本域</label>
                            <div class="layui-input-block">
                                <textarea id="com_info" placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" id="btn" lay-submit="" lay-filter="demo1">发表评论</button>
                        </div>
                    </form>
                    <div>
                        <ul id="comment-list">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-col-xs12 layui-col-md3">
      <div class="grid-demo grid-demo-bg1" style="text-align: center;">
        <div style="height: 400px; background-color: #fff; box-shadow: 0 1px 2px rgba(0,0,0,.1); margin: 10px 0 10px 10px; ">
          分类
          <hr>
        </div>
        <div style="height: 350px; background-color: #fff; box-shadow: 0 1px 2px rgba(0,0,0,.1); margin: 10px 0 10px 10px;">
          近期文章
          <hr>
        </div>
      </div>
    </div>
</div>
</div>



<script src="<%=path %>/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("my-editormd", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true,
        });});
</script>
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
        ,content: '<div style="text-align:center; font-size:20px; margin: 10px 0">登录</div><hr><form class="layui-form" action="/login.shtml" method="post" style="margin-top:30px"><div class="layui-form-item"><label class="layui-form-label">用户名</label><div class="layui-input-inline"><input type="text" name="art_id" hidden="true" value="' + <%=((Article)request.getAttribute("article")).getArt_id()%> + '"><input type="text" name="user_name" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input"></div></div><div class="layui-form-item"><label class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" name="password" lay-verify="required" placeholder="请输入密码6-12位" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><div class="layui-input-block"><button class="layui-btn" lay-submit="" lay-filter="demo1">立即登录</button></div></div><hr style="margin:20px 0 10px 0;">'
        ,success: function(layero){
          var btn = layero.find('.layui-layer-btn');
          btn.find('.layui-layer-btn0').attr({
            href: '<%=path %>/register.jsp'
            ,target: '_self'
          });
          btn.find('.layui-layer-btn1').attr({
            href: '<%=path %>/pages/admin.jsp'
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

<script src="<%=request.getContextPath()%>/js/jquery.js" charset="utf-8"></script>
<script>
    $(document).ready(function () {
        getComment();
        $("#btn").click(function () {
            alert($("#com_info").val());
                $.ajax({
                    type: 'POST',
                    url: '/comment/insertComment.shtml',
                    data: {
                        com_info: $("#com_info").val(),
                        user_id: <%
                                if(session.getAttribute("user")!=null){
                                    out.print(((User)session.getAttribute("user")).getUser_id());
                                }else{
                                    out.print("2");
                                }
                        %>,
                        art_id: <%=((Article)request.getAttribute("article")).getArt_id() %>,
                        com_fa_id: 0
                    },
                    datatype: 'json',
                    success: function (data) {
                        console.log(data);
                        console.log(data.msg);
                        getComment();
                    }
                })

        })
    });

    function getComment() {
        $.ajax({
            type: 'POST',
            url: "/comment/showComment.shtml",
            async: false,
            data: {
                art_id: <%=((Article)request.getAttribute("article")).getArt_id() %>
            },
            dataType: 'json',
            success: function (data) {
                console.log(data);
                showList(data.commentlist);
            }
        });
    };

    function showList(data) {
        var row = "";
        for(var i=0;i<data.length;i++){
            if(data[i]['com_fa_id'] == 0){
                row = row + "<h2>" + data[i]['user_name'] + "</h2>" + "<p>" + data[i]['com_info'] + "</p>"+"<p>" + data[i]['com_time'] + "</p>";
                for(var j=i;j<data.length;j++){
                    if(data[j]['com_fa_id'] == data[i]['com_id']){
                        row = row + "<div style='margin-left:20px'><h2>" + data[j]['user_name'] + "</h2>" + "<p>" + data[j]['com_info'] + "</p>"+"<p>" + data[j]['com_time'] + "</p></div>";
                    }
                }
            }
        }
        $("#comment-list").html(row);
    }
</script>

</body>
</html>