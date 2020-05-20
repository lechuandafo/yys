<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.BE.*"%>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BE.*"%>
<%@ page import="vo.BD.*"%>
<%@ page import="vo.OD.*"%>
<%@ page import="dao.OD.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <%
	request.setCharacterEncoding("UTF-8");
    String userNo = "U00000000001";
    String serviceNo = "Q01";
    String gamerName = "yys";
    gamerName = new String(gamerName.getBytes("ISO-8859-1"),"utf-8");
    session.setAttribute("gamerName", gamerName); 
 	%>
  <meta http-equiv="X-UA-Compatible"  content="text/html; charset=utf-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>阴阳师页游</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<!-- 花瓣飘落JS -->
 	<script src="js/snowfall.jquery.js"></script> 
 	<%
		daoBDStoreHouse SHdao = new daoBDStoreHouse();
	%>
 	<script type="text/javascript">	
 		/*鼠标悬停图片变亮*/
      function mouseOut_message()
      {
          document.getElementById("message").src ="images/UI (283).png";
      }		
			function mouseOver_message()
      {
          document.getElementById("message").src ="images/UI (282).png";
      }
      function mouseOut_mail()
      {
          document.getElementById("mail").src ="images/UI (271).png";
      }		
			function mouseOver_mail()
      {
          document.getElementById("mail").src ="images/UI (270).png";
      }
      function mouseOut_add1()
      {
          document.getElementById("add1").src ="images/UI (255).png";
      }		
			function mouseOver_add1()
      {
          document.getElementById("add1").src ="images/UI (254).png";
      }
			function mouseOut_add2()
      {
          document.getElementById("add2").src ="images/UI (255).png";
      }		
			function mouseOver_add2()
      {
          document.getElementById("add2").src ="images/UI (254).png";
      }
			function mouseOut_add3()
      {
          document.getElementById("add3").src ="images/UI (255).png";
      }		
			function mouseOver_add3()
      {
          document.getElementById("add3").src ="images/UI (254).png";
      }
			function mouseOut_set()
      {
          document.getElementById("set").src ="images/UI (277).png";
      }		        
			function mouseOver_set()
      {
          document.getElementById("set").src ="images/UI (276).png";
      }	      
			function mouseOut_h_left()
      {
          document.getElementById("h_left").src ="images/h-left1.png";
      }		        
			function mouseOver_h_left()
      {
          document.getElementById("h_left").src ="images/h-left2.png";
      }
			function mouseOut_h_right()
      {
          document.getElementById("h_right").src ="images/h-right1.png";
      }		        
			function mouseOver_h_right()
      {
          document.getElementById("h_right").src ="images/h-right2.png";
      }
    /*鼠标悬停图片变亮--over*/
    
    /*图鉴轮播改为手动点击按钮，达到翻页功能*/
			 $(document).ready(function(){ 
			 $('#myCarousel').carousel({interval:false});//控制不自动轮播 
			 }); 
		/*图鉴轮播改为手动点击按钮，达到翻页功能--over*/
			 
		/*商店悬停显示商品内容*/
		$(function(){
						$("[data-toggle='popover']").popover({
							html : true
						});
		        $("[rel=drevil]").popover({
		        }).on("mouseenter", function () {
		                    var _this = this;
		                    $(this).popover("show");
		                    $(this).siblings(".popover").on("mouseleave", function () {
		                        $(_this).popover('hide');
		                    });
		                }).on("mouseleave", function () {
		                    var _this = this;
		                    setTimeout(function () {
		                        if (!$(".popover:hover").length) {
		                            $(_this).popover("hide");
		                        }
		                    }, 100);
		                });
			});
			/*商店悬停显示商品内容---over*/
			
	</script>
	<script type="text/javascript">	
	//添加cookie 
	function addCookie(objName, objValue, objHours){
                var str = objName + "=" + escape(objValue); 
                if (objHours > 0) {//为0时不设定过期时间，浏览器关闭时cookie自动消失 
                    var date = new Date(); 
                    var ms = objHours * 3600 * 1000; 
                    date.setTime(date.getTime() + ms); 
                    str += "; expires=" + date.toGMTString(); 
                } 
                document.cookie = str; 
                alert("添加cookie成功"); 
            } 
    //获取指定名称的cookie的值 
	function getCookie(objName){
                var arrStr = document.cookie.split("; "); 
                for (var i = 0; i < arrStr.length; i++) { 
                    var temp = arrStr[i].split("="); 
                    if (temp[0] == objName) 
                        return unescape(temp[1]); 
                } 
            }
     //获取当前体力值
	if(getCookie("tili")){
		var t1=getCookie("tili");
		alert("从cookie读取体力为："+t1);		
	}else{
		var t1="<%=SHdao.qryStoreHouseM(userNo, serviceNo, "P3") %>";
		alert("cookie为空,从数据库读取体力为："+t1);
	}
	</script>
	  
  <style type="text/css">
  	body {
  		filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
		  -moz-background-size:100% 100%;
		  background-size:100% 100%;
  		height:100%;
			background-image: url(images/game_bg.jpg);
			background-repeat:no-repeat;
			margin: 0px auto;
		}
  	html {
  		height:100%;
		}
		.well{
			height:15px;
			background-image:url(images/head_bg.jpg);
			font-family:"楷体";
			font-weight:bold;
			color:white;
			border-color:sienna;
		}
		.goods-bar{
			height:50px;
			font-family:"楷体";
			font-weight:bold;
			color:white;
		}
		.manner{
		    margin: 0px auto;
		    bottom: 5%;
		}
		.center-vertical {       /*垂直居中*/
		    position:relative;
		    top:50%;
		    transform:translateY(-50%);
		}
		.bar-center-vertical{       /*垂直居中*/
    		top:50%;
		}
		
		/* 定义鼠标悬浮动画元素 */
		.yaobai:hover{
		  -webkit-animation: dese .75s linear infinite;
		  -moz-animation: dese .75s linear infinite;
		  -ms-animation: dese .75s linear infinite;
		  -o-animation: dese .75s linear infinite;
		  animation: dese .75s linear infinite;
		}
		
		/* 定义keyframe动画效果：嘚瑟 */
		@keyframes dese{
		    0% { transform: rotate(-12deg); } /* 添加旋转角度，以下类似 */
		    20% { transform: rotate(8deg); }
		    30% { transform: rotate(6deg); }
		    40% { transform: rotate(3deg); }
		    55% { transform: rotate(0deg); }
		    70% { transform: rotate(-4deg); }
		    80% { transform: rotate(7deg); }
		    90% { transform: rotate(-8deg); }
		    90% { transform: rotate(12deg); }
		}
		.carousel > .left, .carousel > .right {
			background-image: none;
		}
		#prev{
			position:fixed;
			top:50%;
			width:100px;
			height:100px;
			opacity:1;
			left:-10px;
		}
		#next{
			position:fixed;
			top:50%;
			width:100px;
			height:100px;
			opacity:1;
			right:-10px;
		}
		.close{
			opacity:1;
			}
		 #myCarousel > .carousel-inner > .item > div > img{
		 	width:90%;
		 }
		 .manner-bar1{
		 	background:url(images/button_bar1.png);
		 	width:890px;
		 	height:660px;
		 	margin: 0px auto;
		}
		 .manner-bar2{
		 	background:url(images/button_bar2.png);
		 	width:758px;
		 	height:616px;
		}		
		 .manner-bar3{
		 	background:url(images/button_bar3.png);
		 	width:609px;
		 	height:620px;
		}
		.goods-button{
			text-align:center;
			border:1px solid #d2a000;
			box-shadow: 0 1px 2px #fedd71 inset,0 -1px 0 #a38b39 inset,0 -2px 3px #fedd71 inset;
			background: -webkit-linear-gradient(top,#fece34,#d8a605);
			background: -moz-linear-gradient(top,#fece34,#d8a605);
			background: linear-gradient(top,#fece34,#d8a605);
		}
		.bar-titlefont{
			font-family:'华文新魏';
			font-size:40px;
			color:black;
			}
		.bar-font{
			font-family:'华文新魏';
			font-size:20px;
			color:black;
			}	
		/*.div-a{ left:0px; top:0px; background:red; width:100%; height:100%} /* DIV背景颜色为红色 */ */ 
 							
	</style>
	<!-- 背景音乐 -->
	<audio autoplay="" loop="-1"><source src="music/game.mp3"></audio>
</head>
  <body>
  <br>
  <div style="width:100%;height：100%">
  <!-- 等待图片 -->
  	<img id="loading"style="position:absolute;width:100%;height:100%;left:0px; top:0px; z-index:10" src="images/loading2.gif" >
  <div class="play_head col-xs-12"> <!--游戏页面头部-->
  	<div class="row">
	  	<div class="col-xs-6">
	  		<%
	  			daoBDGamer gdao = new daoBDGamer();
	  			ArrayList gList = gdao.qryGamerService(userNo,serviceNo);
	  			voBDGamer gvo  = (voBDGamer) gList.get(0);
	  		 %>   
	  		 <%
				daoBDGamerLearder dao = new daoBDGamerLearder();
				ArrayList List = dao.qryGamerLearderM(userNo,serviceNo);
				voODLeaderList lvo =(voODLeaderList)List.get(0);
			%>   
		   	<div class="col-xs-2"> <!--头像与经验值-->
		   		<img src="images/head_1.jpg" class="img-circle img-thumbnail" alt="通用的占位符缩略图"/>
		  	</div>	
		  	<div class="col-xs-4 row">	   
		   		<div class=" well col-xs-12 dropdown">
		   			<p class="col-xs-9 center-vertical"><%=gamerName%></p> 
						<a href="#" class="col-xs-2 center-vertical btn dropdown-toggle" 
						id="dropdownMenu1" data-toggle="dropdown">
	   					<img src="images/UI (277).png" style="width:30px" id="set" 
	   					onmouseover="mouseOver_set()" onmouseout="mouseOut_set()" />
								<ul class="dropdown-menu text-center" role="menu" aria-labelledby="dropdownMenu1" 
style="background:url(images/head_bg.jpg);">
									<li role="presentation">
										<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#askQuestion" style="color:skyblue">问题反馈</a>
									</li>
									<li role="presentation">
										<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#changeHead" style="color:skyblue">更换头像</a>
									</li>
									<li role="presentation">
										<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#changeName" style="color:skyblue">玩家改名</a>
									</li>
									<li role="presentation">
										<a href="Quit.jsp" data-target="#quit" style="color:skyblue" >退出登录</a>
									</li>
								</ul>
   					</a>	
		   		</div>	
		   		<div class="col-xs-12">
			   		<div class="progress progress-striped active">
						  <div class="progress-bar progress-bar-warning" role="progressbar"
						         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						         style="width: 90%;">
						  	<p>EXP:&nbsp <%=lvo.getLeaderEXP()%> &nbsp / &nbsp 10000</p>
						  </div>
						</div>
					</div>		
		  	</div>
   		</div>
   		<div class="col-xs-6"> <!--金钱、勾玉、体力栏-->
   			<div class="well col-xs-12">
   				<div class="row ">
   					
   					<div class="col-xs-1 center-vertical text-center">
   						<img src="images/money.png" style="width:35px">
   					</div>
   					<div class="col-xs-1">
 	   						<p class="center-vertical" style="width:60px"><%=SHdao.qryStoreHouseM(userNo, serviceNo, "P1") %></p> 
 	   						<!--此处style="width:60px"是为了不换行-->
   					</div>				
   					<div class="col-xs-1 center-vertical text-center">
   						<a data-toggle="modal" href="#sdModal">
   							<img src="images/UI (255).png" style="width:50px" id="add1" 
   							onmouseover="mouseOver_add1()" onmouseout="mouseOut_add1()">
   						</a>
   					</div>
   					
   					<div class="col-xs-1 center-vertical">
   						<img src="images/gouyu.png" style="width:35px"> 
   					</div>
   					<div class="col-xs-1 ">
   							  <p class="center-vertical"><%=SHdao.qryStoreHouseM(userNo, serviceNo, "P0") %>
				</p>
   					</div>
   					<div class="col-xs-1 center-vertical text-center">
   						<a data-toggle="modal" href="#sdModal">
   							<img src="images/UI (255).png" style="width:50px" id="add2" 
   							onmouseover="mouseOver_add2()" onmouseout="mouseOut_add2()">
   						</a>
   					</div>
   					<div class="col-xs-1 center-vertical text-right">
   						<img src="images/tili.png" style="width:40px">
   					</div>
   					<div class="col-xs-1">
   						<p class="center-vertical" align="right" id="TL">   							
   							<script type="text/javascript">document.write(t1);</script>
   						</p>				
   					</div>
   					<div class="col-xs-1">
   						<p class="center-vertical" align="left">/100</p>
   					</div>
   					<div class="col-xs-1 center-vertical text-center">
   						<a data-toggle="modal" href="#sdModal"> 
   							<img src="images/UI (255).png" style="width:50px" id="add3" 
   							onmouseover="mouseOver_add3()" onmouseout="mouseOut_add3()">
   						</a>
   					</div>     				
  					<div class="col-xs-1 center-vertical">
   					  <a href="#"><img src="images/UI (283).png" style="width:35px" id="message"
   					  	onmouseover="mouseOver_message()" onmouseout="mouseOut_message()"></a>
   					</div>   					
   					<div class="col-xs-1 center-vertical">
   						<a href="#" ><img src="images/UI (271).png" style="width:35px" id="mail"
   							onmouseover="mouseOver_mail()" onmouseout="mouseOut_mail()"></a>
   					</div>
 		
   				</div>
   			</div>
   		</div>
  	</div>
  </div>
  <!-- 头部结束 -->
 <!-- 三个灯笼-->
  <div class="row col-xs-12" style="top:62px;">
  	<img src="images/QM.png" class="col-xs-6">
  		<div style="text-align:right" class="col-xs-2">
  			<a onClick="setCookie()"> <img src="images/explore.png" style="width:50px" class="yaobai" > </a>
  		</div>
  		<div style="text-align:right" class="col-xs-3">
  			<a href="drawCard.jsp"> <img src="images/summoner.png"style="width:100px" class="yaobai"> </a>  			
  		</div>
  		<div style="text-align:right" class="col-xs-3 col-offset-xs-3">
  			<a href="Event.jsp"> <img src="images/activity.png"style="width:75px" class="yaobai"> </a>
  		</div>	
  		
  </div>
  <!-- 三个灯笼结束-->
  
  <!--花瓣飘落参数配置-->
	<script>
        $(document).snowfall('clear');
        $(document).snowfall({
            image: "images/flower.png",
            flakeCount:32,
            minSize: 5,
            maxSize: 12
        });
  </script>
  <!--花瓣飘落参数配置--over-->
  <!-- 等待图片消失 -->
   <script language="javascript"> 
   $(document).ready(function () {                  
                   document.getElementById('loading').style.display='none';                        
           });
  </script>

	<script charset="utf-8" type="text/javascript">				
	var t=document.getElementById("TL");
	var sa = setInterval(function(){
								//++t.innerHTML;								
								alert(t1);		
								t1++;//体力值加1				
								if(t.innerHTML==215){clearInterval(sa);}
							},1000);
	function setCookie(){
		addCookie("tili", t1, 0);
    	alert(t1);
    	window.location.href="Discovery1.jsp";
    }
	</script>

  </body>
</html>
