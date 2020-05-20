<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.BE.*"%>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BE.*"%>
<%@ page import="vo.BD.*"%>
<%@ page import="java.util.*"%>
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
		
		function   getRadioBoxValue(radioName) 
		{ 
            var obj = document.getElementsByName(radioName);  //这个是以标签的name来取控件
                 for(i=0; i<obj.length;i++)    {

                  if(obj[i].checked)    { 
                          return   obj[i].value; 
                  } 
              }         
             return "undefined";       
		}
		function getName(){
			var usn="<%=session.getAttribute("userNo")%>"; 
			var sern = getRadioBoxValue("serviceNo");
			
			$.post("/03yys/serv/Front/servFrontUserService",{usn:usn,sern:sern},function(data){
    			//data为返回的数据以json形式
   			 	window.location.href=data.url;
			},"json");
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
<%
			String userNo= "0";
    		try{
    		  	userNo = request.getParameter("userNo");
    		}catch(Exception e){
    			e.printStackTrace();
    		}
 %>
<%
	daoBEService dao = new daoBEService();
	ArrayList List = dao.qryService();
 %>
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
				<div class="well text-center">
					亲爱的<% out.println(userNo); %>，欢迎您
				</div>
			  <HR style="border:1px solid white;">
				<div id="myTabContent" class="tab-content">
					<div class="panel panel-default">
					    <div class="panel-heading">
					        <h3 class="panel-title text-center">
					                                       请选择服务区
					        </h3>
					    </div>
					    <div class="panel-body text-center">
					    	
					      <form name="login" method="post" action="/03yys/serv/Front/servFrontUserService"> 
					        <% 
					        	int i=0;
					        	int j=0;
					        	while(i<List.size()){
					        %>
					        	<div class="btn-group">
					        <%	
					        		while(j<3&&i<List.size()){
					        			voBEService vo =(voBEService)List.get(i);
					        			i++;
					        			j++;
					        %>
					        	<label><input name="serviceNo" type="radio" value="<%=vo.getServiceNo() %>"/><%=vo.getServiceName() %></label>
					        
					        <%		}%>
					        	</div>
					        <%		j=0;
					        	}
					         %>
							<div style="width:100%;height:10px; border-top:1px solid #999; clear:both;"></div>
								<button type="button" class="btn btn-default" onclick="getName()">开始游戏</button>
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