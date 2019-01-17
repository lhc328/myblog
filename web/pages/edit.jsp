<%@ page language="java" pageEncoding="utf-8" import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
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
</body>
</html>