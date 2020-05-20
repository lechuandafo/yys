<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- <% --%>
<%-- String path = request.getContextPath(); --%>
<%-- String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; --%>
<%-- %> --%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BD.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>召唤</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- css -->
<link  href="css/drawCard/base.css" rel="stylesheet">
<link  href="css/drawCard/style.css" rel="stylesheet">
<link  href="css/drawCard/fuzhou.css" rel="stylesheet">

<script type="text/javascript" src="js/drawCard/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
function func() {
	setTimeout("document.getElementById('x').style.visibility='visible'", 5200);//5.2秒后显示符咒
}

$(document).ready(function(){	
	/*点击符咒召唤  */
	$("#f").click(function(){
		//将tag=1传给servlet
		var tag1="1";//符咒标识
		var userNo="<%=session.getAttribute("userNo")%>"; //用户号
		var serviceNo="<%=session.getAttribute("serviceNo")%>";//区号
		var x1=document.getElementById("f_sum").innerHTML;
		//alert(userNo+"+"+serviceNo);
		if(x1>0){
			x1=parseInt(x1)-1;//符咒数减少1	
			document.getElementById("f_sum").innerHTML=x1;//显示符咒数			
			$.ajax({  
			    type:"POST", 
			    url: "serv/Front/servFrontChouKa?tag="+tag1+"&userNo="+userNo+"&serviceNo="+serviceNo,
			    cache: false, 			     
			    success: function(data) {    		
			     	 	/* 符咒动画 */
			     	 	//alert(data);//显示图片url
			     	 	$("#img_id").attr("src",data);	
						$(".red").addClass("shake");
						setTimeout(function(){
							$(".red").removeClass("shake");
							$(".windows").fadeIn();
							$(".opacity").fadeIn();
						},2000); 							     
			    }, 
			    error: function(XMLHttpRequest, textStatus, errorThrown) { 
			     	alert("获取数据异常"); 
			    } 
		 	});
		}					
	});
	/*点击勾玉召唤  */
	$("#g").click(function(){
		//将tag=0传给servlet
		var tag0="0";//符咒标识
		var userNo="<%=session.getAttribute("userNo")%>"; //用户号
		var serviceNo="<%=session.getAttribute("serviceNo")%>";//区号		
		var x2=document.getElementById("g_sum").innerHTML;
		if(x2>0){
			x2=parseInt(x2)-100;//勾玉数减少100	
			document.getElementById("g_sum").innerHTML=x2;//显示符咒数			
			$.ajax({ 
			    type: "POST", 
			    url: "serv/Front/servFrontChouKa?tag="+tag0+"&userNo="+userNo+"&serviceNo="+serviceNo,
			    cache: false, 			     
			    success: function(data) {  			     		
			     	 	/* 符咒动画 */
			     	 	//alert(data);//显示图片url
			     	 	$("#img_id").attr("src",data);	
						$(".red").addClass("shake");
						setTimeout(function(){
							$(".red").removeClass("shake");
							$(".windows").fadeIn();
							$(".opacity").fadeIn();
						},2000); 							     
			    }, 
			    error: function(XMLHttpRequest, textStatus, errorThrown) { 
			     	alert("获取数据异常"); 
			    } 
		 	});
		}					
	});
	$(".close").click(function(){
		$(this).parent().fadeOut();
		$(".opacity").fadeOut();
	});
});
</script>
<link rel="stylesheet" href="css/drawCard/style.css" type="text/css"></link>
<!-- 背景音乐 -->
	<audio autoplay="" loop="-1"><source src="music/drawcard.mp3"></audio>
</head>
<body>
  <%
	request.setCharacterEncoding("UTF-8");
    String userNo = session.getAttribute("userNo").toString();
    String serviceNo = session.getAttribute("serviceNo").toString();
    String gamerName =session.getAttribute("gamerName").toString();    	
 	%>  
<!--头部导航条  -->
<div class="dx"></div>
<div class="header">
   <div class="wrap head">
       <div class="fl"><a href="Game.jsp?gamerName=<%=gamerName %>"><img src="images/drawCard_UI1.png"></a></div>
       <div class="fl"><img src="images/drawCard_UI2.jpg"></div>
       <div class="fr">           
           <a href=""><img src="images/drawCard_UI3.png"></a>
            <!--数据库读取玩家符咒数 -->      
           <a class="txt" id="f_sum">
				 <%
					daoBDStoreHouse dao = new daoBDStoreHouse();
					int fuZhouNum = dao.qryFuzhou(userNo,serviceNo);
			     %>
			     <%=fuZhouNum%> 
           </a>          
           <a ><img src="images/drawCard_UI4.png"></a>           
     		<!--数据库读取玩家勾玉数 -->
     	   <a class="txt" id="g_sum">
				<%
				int gouYuNum = dao.qryGouyu(userNo,serviceNo);
				    %>  
				<%=gouYuNum%>
           </a>
           <a href=""><img src="images/drawCard_UI10.png"></a>
           <a class="txt"> 邮件 </a>
           <a href=""><img src="images/drawCard_UI9.png"></a>
           <a class="txt"> 消息 </a>           
       </div>
   </div>
</div>
<!--召唤按钮  -->	
<div class="content">
     <div class="idx">     	
         <div class="wrap">
                     <div  class="idx-a" >                    	                   							  			                    		
                             <ul>
                                 <li>
                                 	<img id="f" src="images/drawCard_UI7.jpg">
                                    <div class="op-inside">符咒召唤</div>
                                 </li>
                                 <li><img id="g" src="images/drawCard_UI8.jpg">
                                    <div class="op-inside">勾玉召唤</div>
                                 </li>
                             </ul>
                             <div class="clearfix"></div>
                    </div>  
          </div>   
     </div>
</div>
<!-- 抽卡界面 -->
<div class="opacity"></div>
<div class="red">	
		<img  id="x" src="images/drawCard_UI5.jpg" onLoad="func() "  style="visibility:hidden">	
</div>
<div class="windows">
<!-- 显示抽取的式神图片 -->
	<img id="img_id"/>
	<div class="close"><img src="images/drawCard_UI6.png"/></div>	
</div>

<script src="js/drawCard/jquery-1.11.1.min.js"></script>
<script>
   $(".dx").animate({height:"0px"},5000)
</script>
<script>
   $(".idx-a li").hover(function(){
	  $(this).find(".op-inside").stop(false,true).fadeIn(300)
	 },function(){
	  $(this).find(".op-inside").stop(false,true).fadeOut(300)
	 }
	 )
</script>
</body>
</html>

