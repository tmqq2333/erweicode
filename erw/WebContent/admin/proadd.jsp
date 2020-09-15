<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/comm.css"/>
<!-- 		<script src="../ueditor/ueditor.config.js" type="text/javascript" charset="utf-8"></script>
		<script src="../ueditor/ueditor.all.js" type="text/javascript" charset="utf-8"></script>
		<script src="../ueditor/lang/zh-cn/zh-cn.js" type="text/javascript" charset="utf-8" ></script> -->
	</head>
	<body>
		<form action="../proadd" method="post" >
			<p class="path">当前位置：主页</p>
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr><td class="lable">名称</td><td><input type="text" name="proname"/></td></tr>
				<tr><td class="lable">网址</td><td><input type="text" name="pronum"/></td></tr>
			 <tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="保存" id="btnsave"/></td></tr>
			</table>
		</form>
		 <a href="../prolist" style="border: solid 1px gold;background-color: #00FFFF;border-radius:60px ;margin: auto 0;">查看列表</a>
		<!-- <script src="../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script> -->
		 <script type="text/javascript">
 			
 		</script>
	</body>
</html>