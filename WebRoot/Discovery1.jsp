<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BD.*"%>
<%@ page import="vo.OD.*"%>
<%@ page import="dao.OD.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>探索</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- css -->
<link href="css/Discovery/style.css" rel="stylesheet" />
<!-- js -->
<script src="js/Discovery/menu.js"></script>
<script type="text/javascript" src="http://jt.875.cn/js/jquery.js"></script> 

<!-- bootstrap -->
<link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 探索章节模态框css-->
<style type="text/css">
		 .manner-bar1{
		 	background:url(images/Discovery_bg4.png);/*模态框背景*/
		 	width:630px;
		 	height:450px;
		}	
		.manner-bar2{
		 	background:url(images/Discovery_bg5.png);/*模态框背景*/
		 	width:695px;
		 	height:485px;
		}
		.modal-body{
			margin:30px 200px;
			width:860px;			
		}
		.modal-body2{
			margin:30px 190px 30px  190px;
			width:950px;
		}
		.bar-titlefont{
			font-family:'华文隶书';
			font-size:30px;
			color:#A0522D;
			}
		.bar-font{
			font-family:'华文隶书';
			font-size:20px;
			color:#F5F5DC;
			}
		.bar-font2{
			font-family:'楷体';
			text-align:center;
			font-size:22px;
			color:#800000;
			}
		.ts_bg1{
				background:url(images/Discovery_bg3.png);
				background-repeat:no-repeat;
			}
		.close{
			opacity:1;
		}
</style>
<!-- 背景音乐 -->
	<audio autoplay="" loop="-1"><source src="music/game.mp3"></audio>
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
     // 为了删除指定名称的cookie,可以将其过期时间设定为一个过去的时间
     function delCookie(objName) {
       var date = new Date();
       date.setTime(date.getTime() - 10000);
       document.cookie = objName + "=a; expires=" + date.toGMTString();
     }
	var t=getCookie("tili");//读取cookie值
	alert("读取cookie值"+t);
	function upCookie(){
			var t1=getCookie("tili");
			t1=t1-10;
			alert(t1);
			delCookie("tili");//清空cookie
			addCookie("tili",t1,0);//将新的体力值存在cookie中
			document.form.submit();
		}
	</script>
</head>
<body>
  <%
	request.setCharacterEncoding("UTF-8");
    String userNo = "U00000000001";
    String serviceNo = "Q01";
    String gamerName = "yys";
    daoBDStoreHouse SHdao = new daoBDStoreHouse();    	
 	%>  
	 <!--头部开始 -->
<div class="head ">
  <div class="cont">
    <div class="head-left"><a href="Game.jsp?gamerName=<%=gamerName %>"><img src="images/Discovery_UI1.png" alt="" /></a></div>
    <div class="nav"> 
      <!--导航条-->
      <ul class="nav-main">   
      	<li>
      		<img src="images/Discovery_UI5.png" alt="" />
      		<script type="text/javascript">	document.write(t);</script>/100
      		<a href="#"><img src="images/Discovery_UI6.png" alt="" style="position:absolute;top:28%"/></a>
      	</li>    
        <li><a href="#"><img src="images/Discovery_UI4.png" alt="" /></a>邮件</li>
        <li><a href="#"><img src="images/Discovery_UI3.png" alt="" /></a>消息</li>        
      </ul>     
    </div>
  </div>
</div>
<!--头部结束 --> 

<!-- 妖怪发现下拉列表-->
<div class="region_scroll">
		<div style="display:inline-block;_display:inline;padding:1px;overflow:hidden;_zoom:1;">
			<br>
			<center><img src="images/Discovery_UI16.png" alt="" /></center>
			<center><img src="images/Discovery_UI7.jpg" alt="" /></center>
			<div id="wgt_scrollBox2">
				<div id="contentBox2">
					<div class="content">
						<ul>
							<li>
								<a href="#" id="unit1"><img src="images/Discovery_UI8.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit2"><img src="images/Discovery_UI9.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit3"><img src="images/Discovery_UI10.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit4"><img src="images/Discovery_UI11.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit5"><img src="images/Discovery_UI12.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit6"><img src="images/Discovery_UI13.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit7"><img src="images/Discovery_UI14.jpg" class="img-rounded" alt="" /></a>
							</li>
							<li>
								<a href="#" id="unit8"><img src="images/Discovery_UI15.jpg" class="img-rounded" alt="" /></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var _scroll2 = new addScroll();
				_scroll2.init({id:'#wgt_scrollBox2',cid:'#contentBox2',height:300,width:250,srType:true,thick:8,fixed:false});
			</script>
		</div>
		</div>
<!-- 妖怪发现结束-->
<!-- 界面菜单-->
<div class="container" style="position:fixed; bottom:20px;">
	<div class="row" style="background:url(images/Discovery_UI22.png)no-repeat center left;">
			<div class="col-md-1">
        <a href="#" data-toggle="modal" data-target="#Modal_jx"><img src="images/Discovery_UI18.jpg"  class="img-circle" alt="" /></a>   
      </div>
      <div class="col-md-1">
        <a href="#" data-toggle="modal" data-target="#Modal_yh"><img src="images/Discovery_UI19.jpg"  class="img-circle" alt="" /></a>   
      </div>
		<div class="col-md-1">
        <a href="#" data-toggle="modal" data-target="#Modal_ss"><img src="images/Discovery_UI20.jpg"  class="img-circle" alt="" /></a>   
      </div>
      <div class="col-md-1">
        <a href="#" data-toggle="modal" data-target="#Modal_jj"><img src="images/Discovery_UI21.jpg"  class="img-circle" alt="" /></a>   
      </div>      
	</div>
</div>
<!-- 菜单结束-->
<!--人物移动-->
<div> 
	<div style="margin: 30px 0 30px 0;border:0px solid #000"> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 300px;border:0px solid #000"><b id="a"><img src="images/Discovery_UI30.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 520px;border:0px solid #000"><b id="b">1<img src="images/Discovery_UI29.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 750px;border:0px solid #000"><b id="c">2<img src="images/Discovery_UI25.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 900px;border:0px solid #000"><b id="d">3<img src="images/Discovery_UI24.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 200px;border:0px solid #000"><b id="e">8<img src="images/Discovery_UI28.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 560px;border:0px solid #000"><b id="f">6<img src="images/Discovery_UI32.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 850px;border:0px solid #000"><b id="g">4<img src="images/Discovery_UI31.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 300px;border:0px solid #000"><b id="h">7<img src="images/Discovery_UI26.png"/></b></div> 
		<div style="height:50px;width:80px;margin: 0px 20px 0 700px;border:0px solid #000"><b id="i">5<img src="images/Discovery_UI27.png"/></b></div> 
	</div> 
</div> 
<div id="pep" style="border:0px solid green;height:80px;width:80px;position:absolute;">
		<img src="images/Discovery_UI23-1.gif" alt="" />
</div>
<script src="js/Discovery/move.js"></script>
<!--人物移动结束-->
<!-- 第1章模态框 -->
<div class="modal fade" id="Modal_ts1" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第一章 雀食奇谭</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI35.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI39.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI38.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第1章结束 -->
	<!-- 第2章模态框 -->
<div class="modal fade" id="Modal_ts2" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第二章 幸福的彼岸</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI41.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI40.png" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI42.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第2章结束 -->
	<!-- 第3章模态框 -->
<div class="modal fade" id="Modal_ts3" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第三章 凤凰林的占卜师</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI45.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI43.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI44.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第3章结束 -->
	<!-- 第4章模态框 -->
<div class="modal fade" id="Modal_ts4" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第四章 桥上的雨女</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI47.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI46.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI48.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第4章结束 -->
		<!-- 第5章模态框 -->
<div class="modal fade" id="Modal_ts5" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第五章 黑夜山的食发鬼</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI50.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI49.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI51.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第5章结束 -->
		<!-- 第6章模态框 -->
<div class="modal fade" id="Modal_ts6" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第六章 似梦非梦</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI53.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI52.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI54.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第6章结束 -->
		<!-- 第7章模态框 -->
<div class="modal fade" id="Modal_ts7" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第七章 恋上鲤的美</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI56.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI55.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI57.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第7章结束 -->
		<!-- 第8章模态框 -->
<div class="modal fade" id="Modal_ts8" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">第八章 樱与桃</caption>
				      <tr>
				        <td class="ts_bg1">
				        	妖怪发现
				        </td>
				        <td rowspan="4" background="images/Discovery_bg2.png" width="330px" >
				        	<img src="images/Discovery_UI59.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI58.jpg" class="img-rounded" alt="" />
				        </td>	
				      </tr>		
				      <tr>
				        <td class="ts_bg1">
				        	掉落奖励
				        </td>	
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI36.png" alt="" />
				        	<img src="images/Discovery_UI37.png" alt="" />
				        	<img src="images/Discovery_UI60.png" alt="" />
				        </td>			       
				      </tr>	   				      		      			  
				   
				  </table>
				  	<a href="#" data-toggle="modal" data-target="#Modal_sc"><img src="images/Discovery_UI34.jpg" class="img-rounded" /></a>
				</div>					
			</div>
		</div>
	</div>	
	<!-- 第8章结束 -->
		<!-- 御魂模态框 -->
<div class="modal fade" id="Modal_yh" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				<div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">
				    	御魂  八岐大蛇
				    </caption>
				      <tr>
				        <td class="bar-font2">
				        	<a href="#" data-toggle="modal" data-target="#Modal_sc">壹层</a>
				        </td>
				        <td rowspan="5" width="285px" >
				        	<img src="images/Discovery_UI64.png" alt="" />
				        </td>				        					        
				      </tr>		
				      <tr>
				        <td class="bar-font2">
				        	<a href="#" data-toggle="modal" data-target="#Modal_sc">贰层</a>
				        </td>	
				      </tr>		
				      <tr>
				        <td class="bar-font2"> 
				        	<a href="#" data-toggle="modal" data-target="#Modal_sc">叁层</a>
				        </td>	
				      </tr>	
				      <tr>
				        <td class="ts_bg1">
				        	今日掉落
				        </td>			       
				      </tr>	
				      <tr>
				        <td>
				        	<img src="images/Discovery_UI51.png" alt="" />
				        	<img src="images/Discovery_UI54.png" alt="" />
				        	<img src="images/Discovery_UI57.png" alt="" />
				        	<img src="images/Discovery_UI60.png" alt="" />
				        </td>			       
				      </tr>		   				      		      			 				   
				  </table>				  
				</div>					
			</div>
		</div>
	</div>	
	<!-- 御魂结束 -->
<!-- 觉醒jx模态框 -->
<div class="modal fade" id="Modal_jx" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				 <div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">
				    	玩命制作中，敬请期待！
				    </caption>
					</table>						  
				</div>					
			</div>
		</div>
	</div>	
	<!-- 觉醒模态框结束 -->
	<!-- 式神碎片ss模态框 -->
<div class="modal fade" id="Modal_ss" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				 <div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">
				    	玩命制作中，敬请期待！
				    </caption>
					</table>						  
				</div>					
			</div>
		</div>
	</div>	
	<!-- 式神碎片模态框结束 -->
	<!-- 结界突破jj模态框 -->
<div class="modal fade" id="Modal_jj" tabindex="-1" role="dialog" aria-hidden="true" >		
		<div class="modal-body" >
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2  bar-center-vertical manner-bar1 text-center">
				 <div class="table-responsive col-xs-12">
				  <table class="table  bar-font" >
				    <caption class="text-center bar-titlefont">
				    	玩命制作中，敬请期待！
				    </caption>
					</table>						  
				</div>					
			</div>
		</div>
	</div>	
	<!-- 结界突破模态框结束 -->
	<!-- 式神出战模态框（Modal_sc） -->
	<div class="modal fade" id="Modal_sc" tabindex="-1" role="dialog" aria-hidden="true">		
		<div class="modal-body2">
			<button type="button" class="close col-xs-1" data-dismiss="modal" data-keyboard="true" aria-hidden="true"> 
						<img src="images/Discovery_UI33.png"/>
			</button>
			<div class="col-xs-offset-2 bar-center-vertical manner-bar2">
				<div class="table-responsive  col-xs-12" >
				  <table class="table  table-hover bar-font2" >
				   <caption class="text-center bar-titlefont">
				    	式神出战
				    </caption>	    		    
				    <thead>				   
				      <tr >
				        <th class="text-center col-xs-4 ">  式神  </th>
				        <th class="text-center col-xs-2 ">  稀有度  </th>
				        <th class="text-center col-xs-2 ">  等级  </th>			        	
			        	<th class="text-center col-xs-4 ">  选择   </th>				        
				      </tr>
				    </thead>				  				    
				  </table>
				</div>	
				<form action="serv/Front/servFrontReady" method="post">	
				<div class="table-responsive  col-xs-12"  style="max-height:250px">
				  <table class="table  table-hover bar-font2" >
				   
				    <%
				    	daoODShikigami dao=new daoODShikigami();
				    	ArrayList sk=dao.qryGamerShikigami(userNo,serviceNo);
				    	for(int i=0;i<sk.size();i++){
				    	voODShikigami skvo=(voODShikigami)sk.get(i);
				     %>
				    <tbody class="text-center">			    	
				      <tr>
				        <td style="vertical-align:middle"><%=skvo.getShikigamiName() %></td>	
				        <td style="vertical-align:middle"><%=skvo.getShikigamiXYD() %></td>		
				        <td style="vertical-align:middle"><%=skvo.getShikigamiLevel() %></td>		   				       				        
				        <td style="vertical-align:middle">
				        	<input name="csNo" type="checkbox" value="<%=skvo.getShikigamiNo()+","+skvo.getSkipNo() %>" onClick="doCheck(this)"/>出战
				        </td>
				      </tr>
				      <%} %>				      
				    </tbody>	
				  </table>
				</div>
				<center>
			    	<input type="image" src="images/Discovery_UI61.jpg" class="img-rounded" onclick="upCookie()"/>
			    </center>		    
				</form>		
				<center><input type="image" src="images/Discovery_UI65.png" class="img-rounded" onclick=""/></center>				
				<p class="bar-font2">
			    	请选择五位出战式神
			    </p>			    						
			</div>
		</div>	
	</div>
	<!-- /.yysmodal -->
	<SCRIPT LANGUAGE="JavaScript">
			var iMaxSelected = 5;
			var iNumChecked = 0;
			function doCheck(ctrl) {
				if(ctrl.checked){
					iNumChecked++;
					//window.alert("iNumChecked++" + iNumChecked);
				} else {
					iNumChecked--;
					//window.alert("iNumChecked--" + iNumChecked);
				}
				if (iNumChecked > iMaxSelected) {
					ctrl.checked = false;
					iNumChecked--;
					window.alert('最多选择5个式神');
				}
			}
	</SCRIPT>

</body>
</html>