<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="./css/comm.css"/>
	</head>
<body>
<%
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
String pagestr = (String)request.getAttribute("pagestr");
%>
<p class="path">当前位置:列表</p>

<table border="0" cellspacing="0" cellpadding="0" class="tb tblist">
       <tr>
       	 <td style="width:50px;">ID</td><td style="width:150px;">网址</td><td style="width:200px;">二维码</td><td>产品名称</td><td style="width:80px;">操作</td>   
       </tr>
       <%for (Map<String, Object> m : list) { %>
        <tr>
       		<td><%=m.get("id")%></td>
       		<td><%=m.get("pronum")%></td>
       		<td><img src="./twocode/<%=m.get("procodeurl")%>" style="width:3em;height:3em;padding:5px 0px;" class="imgg"></td>
       		<td><%=m.get("proname")%></td>
       		<td> <a href="prodelete?id=<%=m.get("id")%>">删除</a></td>     		
       </tr>
    	<% } %>
    </table>
    <a href="./admin/proadd.jsp" style="border: solid 1px gold;background-color: #00FFFF;border-radius:60px ;margin: auto 0;">继续添加</a>
    <div class="pager">
       		<%=pagestr%>
    </div>
    
    <script src="./js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
   /*  $(".imgg").each(function(index,item){
		//把每一行的单价和数量取出来进行运算，并且把运算的结果交给小计
		var num= parseFloat($(item).find("input").val());//取出当前行商品的数量，并且将数量转为数字
		var price=parseFloat($(item).parent().prev().find("input").val());//取出商品的单价
		var xiaoji=parseFloat(price*num);
		
		$(item).parent().next().find("span").text(xiaoji.toFixed(2));
		sum=sum+xiaoji;
	}); */
	
	
	$(".imgg").mouseenter(function(){
		$(this).css({"width":"12em","height":"12em"})
	})
	$(".imgg").mouseleave(function(){
		$(this).css({"width":"3em","height":"3em"})
	})
    </script>

</body>
</html>