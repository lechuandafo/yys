<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>阴阳师页游登录界面</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
  	body {
  		filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
		  -moz-background-size:100% 100%;
		  background-size:100% 100%;
  			height:100%;
			background-image: url(images/fl.jpg);
			background-repeat:no-repeat;
			margin: 0px auto;
		}
	html {
  		height:100%;
		}
</style>
<script type="text/javascript">
		function first(){
			var gamern=document.getElementById("fl").value;
			$.post("/03yys/serv/Front/servFrontFirstLogin",{gamern:gamern},function(data){
    			//data为返回的数据以json形式
   			 	window.location.href=data.url;
			},"json");
    		}
    		
	</script>
</head>
<body>
  <%
	request.setCharacterEncoding("UTF-8");
    Object userNo = session.getAttribute("userNo").toString();   
    String serviceNo="0";
    try{
	  		serviceNo = request.getParameter("serviceNo");
	}catch(Exception e){
		e.printStackTrace();
	}
	session.setAttribute("serviceNo", serviceNo);    	
 	%>  
<div class="col-xs-offset-4 col-xs-4 text-center" style="top:300px;">
	<form class="form-horizontal" role="form">
		<p style="font-family:'楷体'; font-size:20px;color:white">请输入您的昵称：</p>
		<input id="fl" name="fl" class="col-xs-12  text-center " value="<% out.println(userNo+serviceNo); %>"></input>
		<span class="col-xs-12" style="height:40px;"></span>
		<button  type="button" class="col-xs-4 col-xs-offset-4 btn btn-default" style="font-family:'楷体'; font-size:15px" onclick="first()"> 
			提交
		</button>
	</form>
</div>
</body>