<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*"%>
<%@ page import="com.myblog.entity.Article" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/hclam.css">
	<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
</head>
<body>
	<div class="x-body">
		<form class="layui-form x-center" action="/article/showSomeArt.shtml" style="width:800px" method="post">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <label class="layui-form-label">文章标题</label>
                    <div class="layui-input-inline">
                      <input type="text" name="art_title" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">文章分类</label>
                    <div class="layui-input-inline">
                      <input type="text" name="art_type" placeholder="请输入文章类别" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">文章状态</label>
                    <div class="layui-input-inline">
                        <select name="art_permission" style="display: block">
                            <option value="0">所有</option>
                            <option value="1">待审核</option>
                            <option value="2">已通过</option>
                            <option value="3">已删除</option>
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
                            文章标题
                        </th> 
                        <th>
                            作者
                        </th>
                        <th>
                            分类
                        </th>                       
                        <th>
                            发布时间
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
                    if(request.getAttribute("articlelist") != null) {
                        ArrayList<Article> articlelist = (ArrayList<Article>)request.getAttribute("articlelist");
                        for(int i=0;i<articlelist.size();i++) {
                            out.print("<tr><td><input type = 'checkbox' value = '1' name = '' > </td ><td >" + articlelist.get(i).getArt_title());
                            out.print("</td ><td >"+articlelist.get(i).getUser_name() +"</td ><td>");
                            out.print(articlelist.get(i).getArt_type() + "</td><td>");
                            out.print(articlelist.get(i).getArt_time()+"</td ><td class='td-status' >");
                            out.print("<span class='layui-btn layui-btn-normal layui-btn-mini'>");
                            String artMes = "错误信息";
                            if(articlelist.get(i).getArt_permission() == 1) {
                                artMes = "待审核";
                            }else if(articlelist.get(i).getArt_permission() == 2){
                                artMes = "已通过";
                            }else if(articlelist.get(i).getArt_permission() == 3){
                                artMes = "已删除";
                            }
                            out.print(artMes+"</span ></td><td class='td-manage'>");
                            out.print("<a href='//www.baidu.com' style='text-decoration:none'><i class='layui-icon'></i></a>");
                            out.print("<a href='//www.baidu.com' style='text-decoration:none'> <i class='layui-icon'></i></a></td></tr>");
                        }
                    }else{
                        out.print("<p>找不到资源");
                    }
                %>
                </tbody>
            </table>
	</div>
	<div id="demo1" style="margin: 10px 0px 10px 20px;"></div>
	<script src="../layui/layui.js" charset="utf-8"></script>
	
</body>
</html>