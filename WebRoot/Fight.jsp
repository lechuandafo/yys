<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
	$(document).ready(function(){//战斗逻辑
		var speed=[13,3,3,4,5,6,7,8,9,10,11,12];//式神速度，分别为式神1到式神12 从数据库读入存入数组
		var life=[100,100,100,100,100,100,100,100,100,100,0,100];//式神满生命值，从数据库读入存入数组
		var attack = [200,200,200,200,200,200,200,200,200,200,200,200];
		var defend = [110,120,130,140,50,160,170,180,190,125,122,112];
		var maxspeed=speed[0];
		var trackLen = 200;
		var dist = [200,200,200,200,200,200,200,200,200,200,200,200];
		var deadCnt1 = 0; var deadCnt2 = 0;
		var count=1;	
		var hurt = -1;		
		while(deadCnt1<6 && deadCnt2<6){
			//得到当前发动攻击的式神编号
			var min = dist[0] / speed[0];
			//alert(min);
			var attackIdx = 0; 
			var defendIdx = -1;			
			for(var i=1; i<12; i++){
		 		if(min > dist[i]/speed[i]){
		 			min = dist[i]/speed[i];
		 			attackIdx = i;
		 		}
			}
			//更新dist数组
		 	for(var i=0; i<12; i++){
		 		if(i != attackIdx){
		 			dist[i] = dist[i] - min*speed[i];
		 			if(dist[i] == 0) dist[i] = 0;//同时到达跑道终点
		 		}
		 		else dist[i] = trackLen;
		 	}
		 	var ss="ds"+(attackIdx+1);						 //合成当前行动式神id
				var canvas=document.getElementById('myCanvas');
				var ctx=canvas.getContext('2d');				
  			ctx.fillStyle = "white"//设置填充颜色 
				ctx.font="20px 楷体";			 	
		  	if(attackIdx+1>6){//如果当前行动的是敌方式神，则为红色,控制只能选中我方式神，且为绿色
		  		$('#'+ss).css("box-shadow", "inset 10px 10px 30px red");		  		
		  		var randomIdx = Math.round(Math.random() * 5);		  		
		  		while(life[randomIdx] <= 0)//敌方攻击时随机一个血量大于0的我方式神
		  			randomIdx = Math.round(Math.random() * 5);
		  		defendIdx = randomIdx;		  		
		  		randomIdx = randomIdx + 1; 
		  		var ws = "ds" + randomIdx;				
					$("#"+ws).css("box-shadow", "inset 10px 10px 30px green");					
					hurt = attack[attackIdx] - defend[defendIdx];
					if(hurt < 0) hurt = 0;
			  	else if(hurt != -1){
			  		ctx.fillText('第'+count +'回合',110,70);
			  		ctx.fillText('造成' +hurt+ '点伤害',85,90);
			  		count=count+1;
			  		ctx.stroke();				
		  		}		  		
				}
		  	else {//如果是我方式神则为绿色	
		  		$('#'+ss).css("box-shadow", "inset 10px 10px 30px green"); 
				  $("#ds7").click(function(){
					 $("#ds7").css("box-shadow", "inset 10px 10px 30px red");
					 defendIdx = 6;	
					 hurt = attack[attackIdx] - defend[defendIdx];
					 if(hurt < 0) hurt = 0;
			  	 else if(hurt != -1){
			  		ctx.fillText('第'+count +'回合',110,70);
			  		ctx.fillText('造成' +hurt+ '点伤害',85,90);
			  		count=count+1;
			  		ctx.stroke();						
		  		 }					 	
				  });
				  $("#ds8").click(function(){
					 $("#ds8").css("box-shadow", "inset 10px 10px 30px red");
					 defendIdx = 7;
					  hurt = attack[attackIdx] - defend[defendIdx];
					  if(hurt < 0) hurt = 0;
  			  	 else if(hurt != -1){
				  		ctx.fillText('第'+count +'回合',110,70);
				  		ctx.fillText('造成' +hurt+ '点伤害',85,90);				
			  		  count=count+1;
			  		  ctx.stroke();		
			  		 }					  	
				  });	
				  $("#ds9").click(function(){
					 $("#ds9").css("box-shadow", "inset 10px 10px 30px red");
					 defendIdx = 8;
					  hurt = attack[attackIdx] - defend[defendIdx];
					  if(hurt < 0) hurt = 0;	
  			  	 else if(hurt != -1){
				  		ctx.fillText('第'+count +'回合',110,70);
				  		ctx.fillText('造成' +hurt+ '点伤害',85,90);				
			  		 	count=count+1;
			  		 	ctx.stroke();		
			  		 }					  
				  });
				  $("#ds10").click(function(){
					 $("#ds10").css("box-shadow", "inset 10px 10px 30px red");
					 defendIdx = 9;
					  hurt = attack[attackIdx] - defend[defendIdx];
					  if(hurt < 0) hurt = 0;
  			  	 else if(hurt != -1){
				  		ctx.fillText('第'+count +'回合',110,70);
				  		ctx.fillText('造成' +hurt+ '点伤害',85,90);				
			  		 	count=count+1;
			  		 	ctx.stroke();		
			  		 }					  	
				  });
				  $("#ds11").click(function(){
					 $("#ds11").css("box-shadow", "inset 10px 10px 30px red");
					 defendIdx = 10;
					  hurt = attack[attackIdx] - defend[defendIdx];
					  if(hurt < 0) hurt = 0;
  			  	 else if(hurt != -1){
				  		ctx.fillText('第'+count +'回合',110,70);
				  		ctx.fillText('造成' +hurt+ '点伤害',85,90);			
				  	 	count=count+1;
				  	 	ctx.stroke();		
				  	 }		
				  });
				  $("#ds12").click(function(){
					 $("#ds12").css("box-shadow", "inset 10px 10px 30px red");
					 defendIdx = 11;
					 hurt = attack[attackIdx] - defend[defendIdx];
			  	 if(hurt < 0) hurt = 0;
			  	 else if(hurt != -1){
			  		ctx.fillText('第'+count +'回合',110,70);
			  		ctx.fillText('造成' +hurt+ '点伤害',85,90);			  						
			  	  count=count+1;
			  	  ctx.stroke();		
			  	 }					 
				  });
				}
			  life[defendIdx] = life[defendIdx] - hurt;
			  if(life[defendIdx] <= 0){
			  		if(defendIdx>=0 && defendIdx<6) deadCnt1=deadCnt1+1;
			  		else deadCnt2=deadCnt2+1;
			  		$('#ds'+(n+1)).css
		  			(
			  			{
			  				'-webkit-filter': 'grayscale(100%)',
		    				'-moz-filter': 'grayscale(100%)',
		    				'-ms-filter': 'grayscale(100%)',
					    	'-o-filter': 'grayscale(100%)',
					    	'filter': 'grayscale(100%)',
					   		'filter': 'gray'		   	
					   	}
				   	);
			  }
			}
		});
	</script>
  <style type="text/css">
  	body {
  		filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
		  -moz-background-size:100% 100%;
		  background-size:100% 100%;
  		height:100%;
			background-image: url(images/fight-map1.png);
			background-repeat:no-repeat;
			margin: 0px auto;
		}
  	html {
  		height:100%;
		}
		.well{
			background-image:url(images/head_bg.jpg);
			font-family:"楷体";
			font-weight:bold;
			font-size:30px;
			color:white;
			border-color:sienna;
		}
		
		/* 定义鼠标悬浮动画元素 */
		.yaobai:hover{
		  -webkit-animation: dese .75s linear infinite;
		  -moz-animation: dese .75s linear infinite;
		  -ms-animation: dese .75s linear infinite;
		  -o-animation: dese .75s linear infinite;
		  animation: dese .75s linear infinite;
		}
		.shineRed {  
				box-shadow: inset 0px 0px 30px red;
		} 
		.shineGreen {  
				box-shadow: inset 0px 0px 30px green;
		}
		.shineGray {  
			-webkit-filter: grayscale(100%);
    	-moz-filter: grayscale(100%);
    	-ms-filter: grayscale(100%);
    	-o-filter: grayscale(100%);
    	filter: grayscale(100%);
   		filter: gray;
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
	</style>
</head>
  <body>
	<canvas id="myCanvas" class="col-xs-12"></canvas>
  <div class="col-xs-12 row navbar-fixed-top">
  	<div class="col-xs-2 text-center well">
  	敌方阵容
  	</div>
  	<!-- 敌方阴阳师-->
  	<div class="col-xs-8 text-center">
  		<div id="ds12">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-rounded img-thumbnail yaobai" style="height:80px;" / >
	  		</a>
	   		<div class="progress progress-striped active">
				  <div class="progress-bar progress-bar-warning" role="progressbar"
				         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				         style="width: 90%;">
				  		<p>HP:&nbsp 5839 &nbsp / &nbsp 6488</p>
				  </div>
				</div>
			</div>
  	</div>
  	<span class="col-xs-12"></span>
  	<!-- 敌方式神1-->
  	<div class="col-xs-offset-1 col-xs-2 text-center">
  		<div id="ds11">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 敌方式神2-->
  	<div class="col-xs-2 text-center">
  		<div id="ds10">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 敌方式神3-->
  	<div class=" col-xs-2 text-center">
  		<div id="ds9">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 敌方式神4-->
  	<div class="col-xs-2 text-center">
  		<div id="ds8">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 敌方式神5-->
  	<div class="col-xs-2 text-center">
  		<div id="ds7">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  </div>
  <!-- 我方式神1-->
  <div class="col-xs-12 row navbar-fixed-bottom">
  	<div class="col-xs-offset-1 col-xs-2 text-center">
  		<div id="ds6">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 我方式神2-->
  	<div class="col-xs-2 text-center">
  		<div id="ds5">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 式神3-->
  	<div class="col-xs-2 text-center">
  		<div id="ds4">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 式神4-->
  	<div class="col-xs-2 text-center">
  		<div id="ds3">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<!-- 式神5-->
  	<div class="col-xs-2 text-center">
  		<div id="ds2">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-circle img-thumbnail yaobai" style="height:60px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>
  	<div class="col-xs-2 text-center well "style="top:40px">
  		我方阵容
  	</div>    
  	<!-- 我方阴阳师-->	
  	<div class="col-xs-8 text-center">
  		<div id="ds1">
	  		<a href="#" class="">
	  			<img src="images/head_1.jpg" class="img-rounded img-thumbnail yaobai" style="height:80px;" / >
	  		</a>
		   		<div class="progress progress-striped active">
					  <div class="progress-bar progress-bar-warning" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 60%;">
					  		<p>HP:&nbsp 4000 &nbsp / &nbsp 6488</p>
					  </div>
					</div>
			</div>  		
  	</div>	
  </div>
  <!--花瓣飘落参数配置-->
	<script>
        $(document).snowfall('clear');
        $(document).snowfall({
            image: "images/fire.png",
            flakeCount:32,
            minSize: 5,
            maxSize: 12
        });
  </script>
  <!--花瓣飘落参数配置--over-->
  </body>
</html>
