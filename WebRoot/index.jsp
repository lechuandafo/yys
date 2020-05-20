<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>  
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
	<script type="text/javascript">
		$().ready(function () {
	    $('.carousel').carousel({
	        interval: 2000
	    });
	
	    $('.carousel').carousel('cycle');
		});
/*	 function validate_required(field,alerttxt)
		{
		with (field)
  	{
  		if (value==null||value=="")
    	{alert(alerttxt);return false}
  		else {return true}
  	}
	}*/
	$(function() {
    $("ul.wx").on("click", "[data-stopPropagation]", function(e) {
        e.stopPropagation();
    });
	});
	
	function checkLogPsd(){
		var usn=document.getElementById("usrnam").value.trim();
    var psw=document.getElementById("psw").value.trim();
    if(usn==""||psw=="")
    		alert("登录账号密码不能为空！");
    else{
    		log.submit();
    }
}	
	function checkSigPsd(){
			var nusn=document.getElementById("nusrnam").value.trim();
	    var npw=document.getElementById("npw").value.trim();
	    var cnpsw=document.getElementById("cnpsw").value.trim();
	    if(nusn==""||npw==""||cnpsw=="")
	    		alert("注册账号密码不能为空！");
	    else if(npw!=cnpsw)
	    		alert("两次密码输入不一致！");
	    else{
	    		sgp.submit();
			} 
	}
	</script>
</head>

<style type="text/css">
html{
	height: 100%;
	padding:40px;
	}
body {
	height: 100%;
	padding:40px;
	background-image: url(images/index_bg.jpg);
	background-repeat:no-repeat;
}

.form {
	width: 100%;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	

.input-group {
	margin: 0px 0px 30px 0px !important;
	height: 20px;
}
.form-group {
	margin-bottom: 0px !important;
}
.ls-box {
	height:460px;
	background-color: rgba(0, 0, 0, .3);
}
#myTab{
	font-family:"楷体";
	font-size:20px;
	color:black;
	padding: 10px 5px;
	background-color: rgba(0, 0, 0, .3);
	border:10px;
	border-color:white;
}
.login-title h1 {
	margin-top: 10px !important;
}

.center-vertical {       /*垂直居中*/
    position:relative;
    top:50%;
    transform:translateY(-50%);
}	
.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
.nav{
	font-family:"宋体";
	font-size:15px;
	background-color:white;
}
.nav a:link {color: black} /* 未访问的链接 */
.nav a:hover {color: red} /* 鼠标移动到链接上 */
.nav a:visited {color: black} /* 已访问的链接 */
#tb{
	border-radius:20%; 
	position:relative; 
	top:3px;
}
.login-title a:link {color: white} /* 未访问的链接 */
.login-title a:hover {color: red} /* 鼠标移动到链接上 */
.login-title a:visited {color: white} /* 已访问的链接 */
</style>

</head>

<body>
	<ul class="nav nav-tabs navbar-fixed-top">
			<li>
				&nbsp<img id="tb" src="images/pic_1.jpg" />  &nbsp
		  </li>
			<li>
				<img src="images/t1.png" />
			</li>
	    <li>
	        <a href="http://yys.163.com/index.html">官网首页</a></li>
	    <li>
	        <a href="http://yys.163.com/news/index.html">新闻资讯</a></li>
	    <li>
	        <a href="http://yys.163.com/skill/index.html">游戏攻略</a></li>
	    <li>
	        <a href="http://yys.163.com/ts/index.html">游戏特色</a></li>
	    <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">官方渠道
	            <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	            <li>
	                <a href="http://yys.16163.com/">官方论坛</a></li>
							<li>
		            <a class="wx" href="#" data-toggle="collapse" data-target="#demo" data-stopPropagation="true">
								    官方微信
								    <span class="caret"></span> 
								</a>  
								<div id="demo" class="collapse in">
								    <img src="images/wx.jpg" />     
								</div>
							</li>
	            <li>
	                <a href="http://weibo.com/yys163">官方微博</a></li>
	            <li class="divider"></li>
	            <li>
	                <a href="http://tieba.baidu.com/f?ie=utf-8&kw=%E7%BD%91%E6%98%93%E9%98%B4%E9%98%B3%E5%B8%88">百度贴吧</a></li>
	        </ul>
	    </li>
	</ul>
	<div class="container">
		<div class="row">
			<div class="ls-box col-xs-3"> 
			  <ul id="myTab" class="login-title nav nav-tabs col-xs-12">
			    <li class="active col-xs-6" ><a class="text-center" href="#login"  data-toggle="tab">登录</a></li>
			    <li class="col-xs-6"><a class="text-center" href="#signup" data-toggle="tab">注册</a></li>
			  </ul>
			  <BR>
			  <HR style="border:1px solid white;">
				<div id="myTabContent" class="tab-content">  
			    <div class="tab-pane fade in active col-xs-12" id="login">
						<form name="log" class="form" method="post" action="/03yys/serv/Front/servFrontLogin">
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
										<input type="text" id="usrnam" name="usrnam" class="form-control" placeholder="账号">
									</div>
									<div class="input-group">
										<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
										<input type="password" id="psw" name="psw" class="form-control" placeholder="密码">
									</div>
									<%
										request.setCharacterEncoding("UTF-8");
										String flag= "0";
										try{
								    		flag = request.getParameter("flag");
										}catch(Exception e){
											e.printStackTrace();
										}
										if(flag==null) flag="0";
										if(flag.equals("1")){
											out.print("<script type='text/javascript'>alert('账号或密码错误')</script>");
										}
										if(flag.equals("2")){
											out.print("<script type='text/javascript'>alert('账号不存在')</script>");
										}
										
									 %>
									<BR>
									<div class="text-center center-vertical">
										<button type="button"  class="btn btn-sm btn-info" onclick="checkLogPsd()">									
											<span class="glyphicon glyphicon-off"></span> 登录 </button>
									</div>	
								</div>
							</div>				
						</form>				   
			    </div>
			    <div class="tab-pane fade col-xs-12" id="signup">
						<form name="sgp" class="form"  method="post" action="/03yys/serv/Front/servFrontregister" >
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
										<input type="text" id="nusrnam" name="nusrnam" class="form-control" placeholder="注册账号">
									</div>
									<div class="input-group">
										<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
										<input type="password" id="npw" name="npw" class="form-control" placeholder="注册密码">
									</div>
									<div class="input-group">
										<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
										<input type="password" id="cnpsw" name="cnpsw" class="form-control" placeholder="再次确认">
									</div>
									<BR>
									<div class="text-center center-vertical">
										<button type="button"  class="btn btn-sm btn-info" onclick="checkSigPsd()" >
											<span class="glyphicon glyphicon-off"></span> 完成</button>
									</div>	
								</div>
							</div>			
						</form>    
			    </div>			    	
				</div>
			</div>
			<div class="col-xs-9">
				<div id="myCarousel" class="carousel slide ">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			        <li data-target="#myCarousel" data-slide-to="3"></li>
			        <li data-target="#myCarousel" data-slide-to="4"></li>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner">
			      <div class="item active" .carousel('cycle')>
			          <img class="col-sm-12" src="images/p1.jpg" alt="First slide">
			      </div>
			      <div class="item">
			          <img class="col-sm-12" src="images/p2.jpg" alt="Second slide">
			      </div>
			      <div class="item">
			          <img class="col-sm-12" src="images/p3.jpg" alt="Third slide">
			      </div>
			      <div class="item">
			          <img class="col-sm-12" src="images/p4.jpg" alt="Forth slide">
			      </div>
			      <div class="item">
			          <img class="col-sm-12" src="images/p5.jpg" alt="Fifth slide">
			      </div>
			    </div>
			    <!-- 轮播（Carousel）导航 -->
			    <a class="carousel-control left" href="#myCarousel" 
			        data-slide="prev">&lsaquo;
			    </a>
			    <a class="carousel-control right" href="#myCarousel" 
			        data-slide="next">&rsaquo;
			    </a>
				</div>
			</div>
		</div>
	</div>
	<BR>
	<BR>
	<jsp:include page="logo.jsp"/>
</body>
</html>