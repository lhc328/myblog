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
		<form class="layui-form x-center" action="" style="width:800px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <label class="layui-form-label">文章标题</label>
                    <div class="layui-input-inline">
                      <input type="text" name="title" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">文章分类</label>
                    <div class="layui-input-inline">
                      <input type="text" name="classes" placeholder="请输入文章类别" autocomplete="off" class="layui-input">
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
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td>
                            博客开发
                        </td>
                        <td>
                            lhc
                        </td>
                        <td>
                            java
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
                        </td>
                    </tr>
                </tbody>
            </table>
	</div>
	<div id="demo1" style="margin: 10px 0px 10px 20px;"></div>
	<script src="../layui/layui.js" charset="utf-8"></script>
	
</body>
</html>