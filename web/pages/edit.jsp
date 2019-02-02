<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <link rel="stylesheet"href="../editormd/css/editormd.css" />
    <script src="../js/jquery.min.js"></script>
    <script src="../editormd/editormd.min.js"></script>
</head>
<body style="background-color: #f3f2ee">

<div style="margin-left: 80px">
    <form action="/article/insertArt.shtml" method="post">
        <div class="editormd" id="my-editormd">
            <textarea class="editormd-markdown-textarea" name="content"></textarea>
            <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
            <textarea class="editormd-html-textarea" name="content2"></textarea>
        </div>
        <input type="text" name="art_title" placeholder="请输入标题" style="font-size:16px; width:500px; height: 38px; padding-left: 10px">
        <input type="text" name="art_info" placeholder="请输入简介" style="font-size:16px; width:500px; height: 38px; padding-left: 10px">
      <input type="text" name="art_type" placeholder="请输入类别" style="font-size:16px; width:150px; height: 38px; padding-left: 10px">
        <div class="layui-upload">
            <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
            <button type="button" class="layui-btn" id="test9">开始上传</button>
        </div>
        <input id="art_url" type="text" name="art_url" hidden="true">
      <input type="submit" value="提交">
    </form>
    <div id="result" style="margin-left: 100px; color: #1f0909; width: 800px"></div>

</div>

<script type="text/javascript">
    $(function() {
        var testEditor;
        testEditor = editormd("my-editormd", {
            placeholder:'本编辑器支持Markdown编辑，左边编写，右边预览',  //默认显示的文字，这里就不解释了
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "<%=request.getContextPath()%>/editormd/lib/",   //你的path路径（原资源文件中lib包在我们项目中所放的位置）
            theme: "gray",//工具栏主题
            previewTheme: "dark",//预览主题
            editorTheme: "pastel-on-dark",

            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/upload/mdfileUpload.shtml",

            saveHTMLToTextarea: true,
            emoji: false,
            taskList: true,
            tocm: true,         // Using [TOCM]
            tex: true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart: true,             // 开启流程图支持，默认关闭
            sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
            // toolbarIcons : function() {  //自定义工具栏，后面有详细介绍
            //     return editormd.toolbarModes['simple']; // full, simple, mini
            // },
        });
    });
    // document.getElementById("content").value = testEditor.getMarkdown();
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
                document.getElementById("art_url").value = res.url
            }
        });



    });
</script>
</body>
</html>