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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%
	request.setCharacterEncoding("UTF-8");
    String userNo = session.getAttribute("userNo").toString();
    String serviceNo = session.getAttribute("serviceNo").toString();
    String gamerName = request.getParameter("gamerName");
    gamerName = new String(gamerName.getBytes("ISO-8859-1"),"utf-8");
    session.setAttribute("gamerName", gamerName); 
 	%>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>阴阳师页游</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<!-- 花瓣飘落JS -->
 	<script src="js/snowfall.jquery.js"></script> 
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
		 	
		 	
		 	$("#LMbtn").click(function(){
		 		var LM = document.getElementById("LM").value;//text()
		 		//alert(LM);
		 		
		 		if(LM == "") alert("留言内容不可以为空！");
		 		else{
			 		$.ajax({ 
					    type:"POST", 
					    url: "serv/Front/servFrontLeaveMessageIns?LM="+LM,
					    cache: false, 			     
					    success: function(data) {    		
					     	if(data == "false") alert("留言失败！"); 
					    	else alert("留言成功！");						     
					    }, 
					    error: function(XMLHttpRequest, textStatus, errorThrown) { 
					     	alert("获取数据异常"); 
					    } 
			 		});
			 		//$("#askQuestion").hide();			 		
			 	}
		 	});
		 	
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
	<%
		daoBDStoreHouse SHdao = new daoBDStoreHouse();
	%>
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
                //alert("添加cookie成功"); 
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
	function quit(){//退出登录时传递cookie的值
		var tl=getCookie("tili");
		window.location.href="Quit.jsp?tl="+tili;	
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
										<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#changeHead" style="color:skyblue">更换头像</a>
									</li>
									<li role="presentation">
										<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#changeName" style="color:skyblue">玩家改名</a>
									</li>
									<li role="presentation">
										<a data-target="#quit" style="color:skyblue" onClick="quit">退出登录</a>
									</li>
								</ul>
   					</a>	
		   		</div>	
		   		<div class="col-xs-12">
			   		<div class="progress progress-striped active">
						  <div id="exp_bar" class="progress-bar progress-bar-warning" role="progressbar"
						         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						         style="width: 90%;">
						  	<p id="exp_bar_value" style="color:black;width:30px;"></p>
						  </div>
						</div>
					</div>		
		  	</div>
   		</div>
   		<script>
   			function expReflesh(){
   				$("#exp_bar_value").html("EXP:&nbsp <%=lvo.getLeaderEXP()%> &nbsp / &nbsp"+10000);
   				$("#exp_bar").css("width","<%=lvo.getLeaderEXP()%>"/300*100+"%");
   			}
   			window.setInterval("expReflesh()",1000);
   		</script>
   		<div class="col-xs-6"> <!--金钱、勾玉、体力栏-->
   			<div class="well col-xs-12">
   				<div class="row ">
   					
   					<div class="col-xs-1 center-vertical text-center">
   						<img src="images/money.png" style="width:35px">
   					</div>
   					<div class="col-xs-1">
 	   						<p class="center-vertical" style="width:60px"><%=SHdao.qryStoreHouseM(userNo, serviceNo, "P2") %></p> 
 	   						<!--此处style="width:60px"是为了让“万”字不换行-->
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
   					  <a href="#" data-toggle="modal" data-target="#askQuestion"><img src="images/UI (283).png" style="width:35px" id="message"
   					  	onmouseover="mouseOver_message()" onmouseout="mouseOut_message()"></a>
   					</div>   					
   					<div class="col-xs-1 center-vertical">
   						<a href="#" data-toggle="modal" data-target="#resAnswer"><img src="images/UI (271).png" style="width:35px" id="mail"
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
  		<!--菜单图标-->
		  <div class="manner col-xs-12" style="position:absolute"> 
		  	<div class="row">
		  		<div class="col-xs-2"><!--占位使菜单居中--> </div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#tjModal">
			  			<img src="images/button1.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#zdModal">
			  			<img src="images/button2.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#yylModal">
			  			<img src="images/button3.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#sdModal">
			  			<img src="images/button4.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#rwModal">
			  			<img src="images/button5.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#hyModal">
			  			<img src="images/button6.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a data-toggle="modal" href="#yysModal">
			  			<img src="images/button7.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-1">	
			  		<a href="ssl_search.jsp">
			  			<img src="images/button8.png"style="width:80px"/>
			  		</a>
			  	</div>
			  	<div class="col-xs-2"><!--占位使菜单居中--> </div>
			  </div>
			</div>
			<!--菜单图标结束-->
  </div>
  <!-- 三个灯笼结束-->
  	
	<!-- 图鉴模态框（tjModal） -->
	<div class="modal fade text-center" id="tjModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-body">
			<div id="myCarousel" class="carousel slide">
				<button type="button" class="close" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
				</button>
				<div class="carousel-inner">
					<div class=" item active col-xs-12  text-center " id="tjitem1">
						<div class="col-xs-2">	
							<img src="images/tj01.png" id="tj01"/ > 
						</div>
						<div class="col-xs-2">	
							<img src="images/tj02.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj03.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj04.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj05.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj06.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj07.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj08.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj09.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj10.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj11.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj12.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj13.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj14.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj15.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj16.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj17.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj18.png" / >
						</div>
					</div>
					<div class=" item col-xs-12  text-center">
						<div class="col-xs-2">	
							<img src="images/tj19.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj20.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj21.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj22.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj23.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj24.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj25.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj26.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj27.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj28.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj29.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj30.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj31.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj32.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj33.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj34.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj35.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj36.png" / >
						</div>
					</div>
					<div class=" item col-xs-12  text-center">
						<div class="col-xs-2">	
							<img src="images/tj37.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj38.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj39.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj40.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj41.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj42.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj43.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj44.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj45.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj46.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj47.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj48.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj49.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj50.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj51.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj52.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj53.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj54.png" / >
						</div>
					</div>
					<div class=" item col-xs-12  text-center">
						<div class="col-xs-2">	
							<img src="images/tj55.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj56.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj57.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj58.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj59.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj60.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj61.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj62.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj63.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj64.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj65.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj66.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj67.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj68.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj69.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj70.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj71.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj72.png" / >
						</div>
					</div>
					<div class=" item col-xs-12  text-center">
						<div class="col-xs-2">	
							<img src="images/tj73.png" / >
						</div>
						<div class="col-xs-2">	
							<img src="images/tj74.png" / >
						</div>
					</div>
				</div>
				<a class="carousel-control left"  href="#myCarousel" data-slide="prev" id="prev">
			   <img src="images/h-left1.png"  id="h_left"  style="width:85%;"
			   onmouseover="mouseOver_h_left()" onmouseout="mouseOut_h_left()"/>
				</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next" id="next">
			   <img src="images/h-right1.png" id="h_right" style="width:85%;"
			   onmouseover="mouseOver_h_right()" onmouseout="mouseOut_h_right()"/>
		  	</a>
			</div>	
		</div>
	</div>
	<!-- /.tjmodal -->
	
	<!-- 组队模态框（zdModal） -->
	<div class="modal fade" id="zdModal" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body">
			<button type="button" class="close col-xs-2" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
			</button>
			<div class="col-xs-offset-3  bar-center-vertical manner-bar2">
			</div>
		</div>	
	</div>
	<!-- /.zdmodal -->

	<!-- 阴阳寮模态框（yylModal） -->
	<div class="modal fade" id="yylModal" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body">
			<button type="button" class="close col-xs-3" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
			</button>
			<div class="col-xs-offset-3  bar-center-vertical manner-bar3">
				<span class="col-xs-12" style="height:50px;"></span>
				<div class="table-responsive col-xs-offset-1 col-xs-10">
				  <table class="table  table-hover bar-font">
				    <caption class="text-center bar-titlefont">阴阳寮</caption>
				    <thead>
				      <tr class="text-center">
				        <th class="text-center col-xs-3">名字</th>
				        <th class="text-center col-xs-3">职位</th>
				        <th class="text-center col-xs-3 ">斗技积分</th>
				        <th class="text-center col-xs-3 ">上次登录</th>
				      </tr>
				    </thead>
				    <tbody class="text-center">
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr>
				      <tr>
				        <td>乐川大佛</td>
				        <td>会长</td>
				        <td>3000</td>
				        <td>在线</td>
				      </tr> 
				      <button class="btn btn-danger text-center">退出阴阳寮</button>  				      				      				      				      				      				      				      
				    </tbody>
				  </table>
				  <div class="text-center">
						<ul class="pagination">
						    <li><a href="#">&laquo;</a></li>
						    <li class="active"><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>					
			</div>
		</div>	
	</div>
	<!-- /.yylmodal -->
	
	<!-- 商店模态框（sdModal） -->
	<div class="modal fade" id="sdModal" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body">
			<button type="button" class="close" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1">			
				<div class="col-xs-12 goods-bar"> 
   				<div class="row col-xs-12">	<!--金钱、勾玉、体力栏-->	
   					<div class="col-xs-offset-1 col-xs-3 text-center">
   						<img src="images/money.png" class="col-xs-6" style="height:50px; width:50%">
 	   						<p class="col-xs-6" style="top:15px;">32万</p> 
   					</div>				
   					<div class="col-xs-offset-1 col-xs-3 text-center">
   						<img src="images/gouyu.png" class="col-xs-6" style="height:50px; width:45%"> 
   						<p class="col-xs-6" style="top:15px;">1922</p>
   					</div>
   					<div class="col-xs-offset-1 col-xs-3 text-center">
   						<img src="images/tili.png" class="col-xs-6"  style="height:50px; width:50%">
   							<p class="col-xs-6" style="top:15px;">120/80</p>
   					</div> <!--金钱、勾玉、体力栏 over-->
						<ul id="myTab" class="nav nav-tabs">
							<li class="col-xs-offset-4 active">
								<a href="#yuan" data-toggle="tab">充值专区</a>
							</li>
							<li><a href="#gy" data-toggle="tab">勾玉专区</a></li>
							<li><a href="#lb" data-toggle="tab">礼包专区</a></li>
						</ul>
					  <span class="col-xs-12" style="height:80px"></span> 		
						<div id="myTabContent" class="tab-content">
							
							<!--人民币专区-->
							<div class="tab-pane fade in active " id="yuan">
								<div class="col-xs-offset-1 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*10<br>黑达摩*2<br>勾玉*1000<br>金币*1000000" data-placement="left" >
											<img class="col-xs-12" src="images/goods2.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥648
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*5<br>勾玉*2000<br>金币*100000" data-placement="left" >
											<img class="col-xs-12" src="images/goods4.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥512
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*2<br>勾玉*1000<br>金币*100000" data-placement="left" >
											<img class="col-xs-12" src="images/goods5.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥216
									</button>
								</div>
								<span class="col-xs-12" style="height:120px"></span>
								<hr>
								<div class="col-xs-offset-1 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="勾玉*3000" data-placement="left" >
											<img class="col-xs-12" src="images/goods10.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥128
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="勾玉*1200" data-placement="left" >
											<img class="col-xs-12" src="images/goods9.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥64
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="勾玉*500" data-placement="left" >
											<img class="col-xs-12" src="images/goods11.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥32
									</button>
								</div>								
							</div>
							<!--人民币专区--over-->
							
							<!--勾玉专区-->
							<div class="tab-pane fade  active " id="gy">
								<div class="col-xs-offset-1 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*10" data-placement="left" >
											<img class="col-xs-12" src="images/goods1.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										<img src="images/gouyu.png" style="width:30px;">1000
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="经验UP50% 3天" data-placement="left" >
											<img class="col-xs-12" src="images/goods3.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										<img src="images/gouyu.png" style="width:30px;">500
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="经验UP50% 1天" data-placement="left" >
											<img class="col-xs-12" src="images/goods3.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										<img src="images/gouyu.png" style="width:30px;">200
									</button>
								</div>
								<span class="col-xs-12" style="height:120px"></span>
								<hr>
								<div class="col-xs-offset-1 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="金币*1000000" data-placement="left" >
											<img class="col-xs-12" src="images/goods7.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										<img src="images/gouyu.png" style="width:30px;">500
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="金币*100000" data-placement="left" >
											<img class="col-xs-12" src="images/goods7.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										<img src="images/gouyu.png" style="width:30px;">150
									</button>
								</div>
								<div class="col-xs-offset-2 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="体力*120" data-placement="left" >
											<img class="col-xs-12" src="images/tili.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										<img src="images/gouyu.png" style="width:30px;">100
									</button>
								</div>								
							</div>
							<!--勾玉专区--over-->
							
							<!--礼包专区-->
							<div class="tab-pane fade  active " id="lb">
								<div class="col-xs-offset-3 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*10<br>黑达摩*2<br>勾玉*1000<br>金币*1000000" data-placement="left" >
											<img class="col-xs-12" src="images/goods6.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥648
									</button>
								</div>
								<div class="col-xs-offset-3 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*5<br>勾玉*2000<br>金币*100000" data-placement="left" >
											<img class="col-xs-12" src="images/goods17.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥512
									</button>
								</div>
								<span class="col-xs-12" style="height:120px"></span>
								<div class="col-xs-offset-3 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="符咒*2<br>勾玉*1000<br>金币*100000" data-placement="left" >
											<img class="col-xs-12" src="images/goods18.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥216
									</button>
								</div>
								<hr>
								<div class="col-xs-offset-3 col-xs-2">	
									<p class="popover-options">
										<a href="#" rel="drevil" data-container="body" data-toggle="popover" 
											data-content="勾玉*3000" data-placement="left" >
											<img class="col-xs-12" src="images/goods19.png" >
										</a>
									</p>
									<button type="button" class="col-xs-12 btn btn-primary goods-button">
										￥128
									</button>
								</div>							
							</div>							
							<!--礼包专区--over-->
							
						</div>				
					</div>
				</div>
			</div>	
		</div>
	</div>
	<!-- /.sdmodal -->

	<!-- 任务模态框（rwModal） -->
	<div class="modal fade" id="rwModal" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body">
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
			<%
					daoBDUserTask userTaskdao = new daoBDUserTask();
					ArrayList userTaskList = userTaskdao.qryUserTask();
				 %>
				<span class="col-xs-12" style="height:50px;"></span>
				<div class="table-responsive col-xs-offset-1 col-xs-10">
				  <table class="table  table-hover bar-font">
				    <caption class="text-center bar-titlefont">每日任务</caption>
				    <thead>
				      <tr class="text-center">
				        <th class="text-center col-xs-6">任务名</th>
				        <th class="text-center col-xs-4">奖励</th>
				        <th class="text-center col-xs-2 ">完成状况</th>
				      </tr>
				    </thead>
				    <tbody class="text-center">
				    <%
				    	int userTaski=0;
				    	while(userTaski<userTaskList.size()){
				    		voBDUserTask userTaskvo =(voBDUserTask)userTaskList.get(userTaski);
				    		%>
				      <tr>
				        <td><%=userTaskvo.getTaskName()%></td>
				        <td>
				        	<img src="images/money.png" style="width:30px;"/> <%=userTaskvo.getQuantity()%>
				        	<img src="images/tupo_paper.png" style="width:30px;"/><%=userTaskvo.getQuate()%>
				        </td>
					        <%if(userTaskvo.getQuate() < Integer.parseInt(userTaskvo.getTaskCount()))
					        	{
					        	out.print("<td>未完成</td>");
					        	}
					        	else if(userTaskvo.getQuate() == Integer.parseInt(userTaskvo.getTaskCount()))
					       		{
					        	out.print("<td>已完成</td>");
					        	}%>
				      </tr>	
				      <%
				      	userTaski++;
				    	}	%> 
				    </tbody>
				  </table>
				</div>					
			</div>
		</div>
	</div>	
	<!-- /.rwmodal -->

	<!-- 好友模态框（hyModal） -->
	<div class="modal fade" id="hyModal" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body">
			<button type="button" class="close col-xs-3" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
			</button>
			<div class="col-xs-offset-3  bar-center-vertical manner-bar3">
			<%
					daoBDGamerFriend gamerFrienddao = new daoBDGamerFriend();
					ArrayList gamerFriendList = gamerFrienddao.qryGamerFriend();
				 %>
				<span class="col-xs-12" style="height:50px;"></span>
				<div class="table-responsive col-xs-offset-1 col-xs-10">
				  <table class="table  table-hover bar-font">
				    <caption class="text-center bar-titlefont">我的好友</caption>
				    <thead>
				      <tr class="text-center">
				        <th class="text-center col-xs-3">好友名</th>
				        <th class="text-center col-xs-3">等级</th>
				        <th class="text-center col-xs-3 ">活跃度</th>
				        <th class="text-center col-xs-3 ">上次登录</th>
				      </tr>
				    </thead>
				    <tbody class="text-center">
				     <%
				    	int gamerFriendi=0;
				    	while(gamerFriendi<gamerFriendList.size()){
				    		voBDGamerFriend gamerFriendvo =(voBDGamerFriend)gamerFriendList.get(gamerFriendi);
				    		%>
				      <tr>
				        <td><%=gamerFriendvo.getGamerName()%></td>
				        <td><%=gamerFriendvo.getLeaderLevel()%></td>
				        <td><%=gamerFriendvo.getPvpGrade()%></td>
				        <td><%=gamerFriendvo.getOnline()%></td>
				      </tr>
				      <%
				      	gamerFriendi++;
				    	}	%> 	      				      				      				      				      				      				      			      				      				      				      				      				      				      
				    </tbody>
				  </table>
				  <div class="text-center">
						<ul class="pagination">
						    <li><a href="#">&laquo;</a></li>
						    <li class="active"><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>		
			</div>
		</div>	
	</div>
	<!-- /.hymodal -->
	
	<!-- 阴阳术模态框（yysModal） -->
	
	<div class="modal fade" id="yysModal" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body">
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/esc1.png"/>
			</button>
			<div class="col-xs-offset-2 bar-center-vertical manner-bar1">
				<span class="col-xs-12" style="height:50px;"></span>
				<div class="table-responsive 	 col-xs-12">
				  <table class="table  table-hover bar-font">	    		    
				    <thead>
				    	<tr style="text-algin:center">
				    		<th colspan="4">
				    	<%
				    		daoBDPFightGroup pfdao = new daoBDPFightGroup();
				    		ArrayList pflist = pfdao.qrybuyMitamaM(userNo, serviceNo);
				    		
				    	 %>
				    	<%
				    	int i=0;
				    	int attack=0;
				    	int life=0;
				    	int defence=0;
				    	int speed=0;
				    	int crit=0;
				    	int critical=0;
				    	while(i<List.size()){
				    		voODLeaderList vo =(voODLeaderList)List.get(i);
				    		attack+=vo.getLeaderCreateAttack()+(vo.getLeaderDevelopAttack()*vo.getLeaderLevel());
				    		defence+=vo.getLeaderCreateDefence()+(vo.getLeaderDevelopDefence()*vo.getLeaderLevel());
				    		life+=vo.getLeaderCreateLife()+(vo.getLeaderDevelopLife()*vo.getLeaderLevel());
				    		speed+=vo.getLeaderCreateSpeed();
				    		crit+=vo.getLeaderCreateCrit();
				    		critical+=vo.getLeaderCreateCriticalDamage();
				    		i++;
				    	}
				    	 %>
				    		&nbsp &nbsp &nbsp &nbsp 主角面板——攻击:<%=attack %>生命:<%=life %> 防御:<%=defence %> 速度:<%=speed %> 暴击:<%=crit %> 暴伤:<%=critical %> 
				    		<th>
				    	</tr>
				      <tr >
				        <th class="text-center col-xs-2">  阴阳师  </th>
				        <th class="text-center col-xs-5">   传记   </th>
			        	<th class="text-center col-xs-3"> 装备技能 </th>
			        	<th class="text-center col-xs-2">   出场   </th>				        
				      </tr>
				    </thead>
				    <tbody class="text-center">
				    	<%
				    		i=0;
				    		int pfflag=0;
				    	while(i<List.size()){
				    		voODLeaderList vo =(voODLeaderList)List.get(i);
				    		if(pflist.size()>0){
				    			voBDPFightGroup pfvo = (voBDPFightGroup)pflist.get(0);
				    			if(vo.getLeaderNo().equals(pfvo.getLeaderNo())){
				    				pfflag=1;
				    			}
				    			}
				    		%>
				    	  	
				      <tr>
				        <td style="vertical-align:middle"><img src="<%=vo.getLeaderURL()%>" style="width:100%;"/></td>
				        <td  style="vertical-align:middle"><%=vo.getBiography() %></td>
				        <td  style="vertical-align:middle" class="col-xs-12 row">
				        	<a href="#"><img src="images/skill_<%=i*3+1%>.png" class="col-xs-4"/></a>
									<img src="images/skill_<%=i*3+2%>.png" class="col-xs-4"/>
									<img src="images/skill_<%=i*3+3%>.png" class="col-xs-4"/>
								</td>				        
				        <td  style="vertical-align:middle">
				        	<label><input name="LeaderNo" type="radio" value="L01" <%if(pfflag==1) {%>checked="checked"<%} %>/>Fight!</label></td>
				      </tr>
				      <%
				      	i++;
				    	}	%>  
				           
				    </tbody>
				  </table>
				</div>							
			</div>
		</div>	
	</div>
	<!-- /.yysmodal -->
<!-- 问题反馈模态框（askQuestion）-->
  <div class="modal fade" id="askQuestion" tabindex="-1" role="dialog"  aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" 
							aria-hidden="true">×
					</button>
					<h4 class="modal-title">
						问题反馈
					</h4>
				</div>
				<div class="modal-body col-xs-12">
					<textarea name="aq" id="LM" class="col-xs-12" rows="5"> </textarea>
				</div>
				<div class="modal-footer">
					<button type="button" id="LMbtn" class="btn btn-primary">
						提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div>
  <!-- /.askQuestion -->
<!-- 回复查看模态框（resAnswer）-->
<%
	//ArrayList voRList = (ArrayList) session.getAttribute("voBDReplyList");
	//if(voRList == null){
		ArrayList voRList = new daoBDReply().qryReplyByUserNo(userNo);
		//session.setAttribute("voBDReplyList",voRList);
	//}
	
%>
  <div class="modal fade" id="resAnswer" tabindex="-1" role="dialog"  aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" 
							aria-hidden="true">×
					</button>
					<h4 class="modal-title">
						回复查看
					</h4>
					
					<ul>
					<% for(int ii=0; ii<voRList.size(); ii++){
					 		voBDLmRe voLR = (voBDLmRe)voRList.get(ii);
							out.print("<li>管理员" +voLR.getAdministratorNo() + "回复了您的留言  '" + voLR.getLeaveMessageContent() + "' ："
							+ voLR.getReplyContent() + "</li>");
						}
					%>
						
					 	
					</ul>
					
				</div>
				<div class="modal-body col-xs-12">
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div>
  <!-- /.resAnswer -->  	
<!-- 改头像模态框（changeHead）-->
  <div class="modal fade" id="changeHead" tabindex="-1" role="dialog"  aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content text-center">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" 
							aria-hidden="true">×
					</button>
					<h4 class="modal-title">
						更换头像
					</h4>
				</div>
				<div class="modal-body col-xs-12">
					<label><input name="Fruit" type="radio" value="T01" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
					<label><input name="Fruit" type="radio" value="T02" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
					<label><input name="Fruit" type="radio" value="T03" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label>
					<label><input name="Fruit" type="radio" value="T04" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
					<label><input name="Fruit" type="radio" value="T05" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
					<label><input name="Fruit" type="radio" value="T06" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
					<label><input name="Fruit" type="radio" value="T07" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
					<label><input name="Fruit" type="radio" value="T08" /><img src="images/head_1.jpg" style="width:100px;" class="img-circle img-thumbnail" / ></label> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div>
  <!-- /.changeHead -->
  <!-- 改名字模态框（changeName）-->
  <div class="modal fade" id="changeName" tabindex="-1" role="dialog"  aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" 
							aria-hidden="true">×
					</button>
					<h4 class="modal-title">
						更换昵称
					</h4>
				</div>
				<div class="modal-body col-xs-12">
					<input name="cn" class="col-xs-4 col-xs-offset-4 text-center" value="<% out.println(userNo); %>">
					</input>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div>
  <!-- /.changeName -->
  </div>
  
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
  <!-- 体力自动增加，到100时停止自动增加 -->

	<script charset="utf-8" type="text/javascript">				
	var t=document.getElementById("TL");
	var sa = setInterval(function(){
								//++t.innerHTML;																		
								t1++;//体力值加1				
								if(t.innerHTML==215){clearInterval(sa);}
							},1000);
	//添加体力session，跳转到探索界面						
	function setCookie(){
		addCookie("tili", t1, 0);
    	window.location.href="Discovery.jsp";
    }
	</script>
  </body>
</html>
