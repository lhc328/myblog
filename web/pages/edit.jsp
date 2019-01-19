<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
	<script type="text/javascript" src="../showdown-master/dist/showdown.min.js"></script>
</head>
<body style="background-color: #f3f2ee">

<div style="margin-left: 80px">
    <textarea id="oriContent" style="height:400px;width:1000px;font-size: 20px; color: #333333" onkeyup="convert()"></textarea>
    <form action="" method="post">
	  <input type="text" name="title" placeholder="请输入标题" style="font-size:16px; width:500px; height: 38px; padding-left: 10px">
      <input id="artile-content" type="text" name="content" hidden="true">
      <input type="text" name="autor" hidden="true" value="lhc">
      <input type="text" name="artile-type" placeholder="请输入类别" style="font-size:16px; width:150px; height: 38px; padding-left: 10px">
        <div class="layui-upload">
            <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
            <button type="button" class="layui-btn" id="test9">开始上传</button>
        </div>
      <input type="submit" value="提交">
    </form>
    <div id="result" style="margin-left: 100px; color: #1f0909; width: 800px"></div>

</div>


<script type="text/javascript">
function convert(){
    var text = document.getElementById("oriContent").value;
    var converter = new showdown.Converter();
    var html = converter.makeHtml(text);
    document.getElementById("result").innerHTML = html;
    document.getElementById("artile-content").value = html;
}
</script>
<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;



        //选完文件后不自动上传
        upload.render({
            elem: '#test8'
            ,url: '/upload/fileUpload.shtml'
            ,auto: false
            ,accept:"images"
            ,acceptMime:"image/*"//规定打开文件选择框时，筛选出的文件类型
            //,multiple: true
            ,bindAction: '#test9'
            ,done: function(res){
                console.log(res.url)
            }
        });



    });
</script>
</body>
</html>