<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Event</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- css -->
<link href="css/Event/bootstrap.min.css" rel="stylesheet" />
<link href="css/Event/font-awesome.css" rel="stylesheet" /> 
<link href="css/Event/flexslider.css" rel="stylesheet" /> 
<link href="css/Event/style.css" rel="stylesheet" />
 
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
    String userNo = session.getAttribute("userNo").toString();
    String serviceNo = session.getAttribute("serviceNo").toString();
    String gamerName =session.getAttribute("gamerName").toString();    	
 	%>
<div id="wrapper" class="home-page">
	<!-- start header -->
	<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" ><img src="images/Event_UI1.png" alt="logo"/></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">活动首页</a></li> 
												<li><a href="">新闻公告</a></li>
                        <li><a href="https://yys.163.com/index.html">进入官网</a></li>
                        <li><a href="">游戏充值</a></li>
                        <li><a href="Game.jsp?gamerName=<%=gamerName %>">返回游戏</a></li>
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->
	<section id="banner">
	 
	<!-- Slider -->
        <div id="main-slider" class="flexslider">
            <ul class="slides">
              <li>
                <img src="images/Event_bg1.jpg" alt="" />
                <div class="flex-caption">
                    <h3>唯美和风</h3>  
					 
                </div>
              </li>
              <li>
                <img src="images/Event_bg2.jpg" alt="" />
                <div class="flex-caption">
                    <h3>匠心巨制</h3>  
					 
                </div>
              </li>
            </ul>
        </div>
	<!-- end slider -->
 
	</section> 
 
	
	<section id="content">
	<div class="container"> 
			<div class="row">
				<div class="skill-home"> 
					<div class="skill-home-solid clearfix"> 
						<div class="col-md-3 col-sm-6 text-center">
							<div class="box-area"><a href=""><h3>节日礼包</h3></a> <img src="images/Event_UI2.png" alt="logo"/></div>
						</div>
						<div class="col-md-3 col-sm-6 text-center"> 
		 					<div class="box-area"><a href=""><h3>感恩回馈</h3></a> <img src="images/Event_UI3.png" alt="logo"/></div>
						</div>
						<div class="col-md-3 col-sm-6 text-center"> 
							<div class="box-area"><a href=""><h3>每日奖励</h3></a> <img src="images/Event_UI4.png" alt="logo"/></div>
						</div>
						<div class="col-md-3 col-sm-6 text-center"> 
							<div class="box-area"><a href=""><h3>我的任务</h3></a> <img src="images/Event_UI5.png" alt="logo"/></div>
						</div>
					</div>
				</div>
			</div> 	  
	</div>
	</section>
	
		<section class="section-padding gray-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center">
						<h2><span class="coloured">最新</span> 活动</h2>					
					</div>
				</div>
			</div>
			<div class="row service-v1 margin-bottom-40">
            <div class="col-sm-4 md-margin-bottom-40 ">
               <a href="#"><img class="img-responsive" src="images/Event_UI10.jpg" ></a>   
                <h3>KFC跨界应援</h3>                
            </div>
            <div class="col-sm-4 md-margin-bottom-40 ">
                <a href="#"><img class="img-responsive" src="images/Event_UI12.jpg" alt=""></a>             
                <h3>贴吧活动：地表最萌表白</h3>               
            </div>
            <div class="col-sm-4 md-margin-bottom-40 ">
              	<a href="#"><img class="img-responsive" src="images/Event_UI11.jpg" alt=""></a>   
                <h3>论坛活动-参与有奖</h3>                
            </div>
			</div>
			<div class="row service-v1 margin-bottom-40">
			    <div class="col-sm-4 md-margin-bottom-40 ">
               <a href="#"><img class="img-responsive" src="images/Event_UI13.png" alt=""></a>    
                <h3>天机谱：有奖攻略互动计划</h3>                
            </div>
            <div class="col-sm-4 md-margin-bottom-40 ">
                <a href="#"><img class="img-responsive" src="images/Event_UI14.jpg" alt=""></a>             
                <h3>大触觉醒第二季！同人插画大赛！</h3>               
            </div>
            <div class="col-sm-4 md-margin-bottom-40 ">
              <a href="#"><img class="img-responsive" src="images/Event_UI15.png" alt=""></a>   
                <h3>绝美启幕，敬请期待！</h3>               
            </div>
        </div>
		</div>
		</section>
		
	<section class="section-padding noTopMrgn">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center">
						<h2><span class="coloured">式神</span> 大全</h2>						
					</div>
				</div>
			</div>
			<div class="row service-v1 margin-bottom-40">
            <div class="col-sm-3 md-margin-bottom-40 text-center">
               <a href="#"><img class="img-responsive" src="images/Event_UI6.png" alt=""></a>   
                <img class="img-responsive" src="images/Event_UI23.png" alt="">                
            </div>
            <div class="col-sm-3 md-margin-bottom-40 text-center">
                <a href="#"><img class="img-responsive" src="images/Event_UI7.png" alt=""></a>         
                <img class="img-responsive" src="images/Event_UI22.png" alt="">             
            </div>
            <div class="col-sm-3 md-margin-bottom-40 text-center">
              <a href="#"><img class="img-responsive" src="images/Event_UI8.png" alt=""></a>   
                <img class="img-responsive" src="images/Event_UI21.png" alt="">
            </div> 
			    <div class="col-sm-3 md-margin-bottom-40 text-center">
              <a href="#"> <img class="img-responsive" src="images/Event_UI9.png" alt=""></a>       
                <img class="img-responsive" src="images/Event_UI20.png" alt="">              
            </div> 
        </div>
		</div>
		</section>
				
					

	<footer>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widgetheading">微博名</h5>
					<ul class="link-list">
						<li><a href="#">阴阳师手游</a></li>
						<li><a href="#"><img  src="images/Event_UI16.jpg" > </a></li>
					</ul>				
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widgetheading">微信公众号</h5>
					<ul class="link-list">
						<li><a href="#">yinyangshi163</a></li>
						<li><a href="#"><img  src="images/Event_UI17.jpg" > </a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widgetheading">客服电话</h5>
					<ul class="link-list">
						<li><a href="#">0571-26201179</a></li>
						<li><a href="#"><img  src="images/Event_UI18.png" ></a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widgetheading">公司简介</h5>
					<ul class="link-list">
						<li><a href="#">商务合作</a></li>
						<li><a href="#">加入我们</a></li>
						<li><a href="#">用户协议</a></li>
						<li><a href="#">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="copyright">
						<p>
							 请您合理控制游戏时间 避免沉溺游戏影响生活 注意自我保护 防范网络陷阱
						</p>
					</div>
				</div>
				<div class="col-sm-6">
					<ul class="social-network">
						<li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</footer>
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/Event/jquery.js"></script>
<script src="js/Event/bootstrap.min.js"></script> 
<script src="js/Event/jquery.flexslider.js"></script>
<!-- Vendor Scripts -->
<script src="js/Event/custom.js"></script> 
<!-- 花瓣 -->
<script type="text/javascript" class="autoinsert" src="js/jquery-1.2.6.min.js"></script> 
<script src="js/Event/snowfall.jquery.js"></script>
<script>
        $(document).snowfall('clear');
        $(document).snowfall({
            image: "images/Event_UI19.png",
            flakeCount:30,
            minSize: 5,
            maxSize: 22
        });
    </script>
</body>
</html>
