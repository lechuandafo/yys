<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
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
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>跳转中</title>
</head>
  <body>
  <br>
  <div style="width:100%;height：100%">
  <!-- 等待图片 -->
  	<img id="loading"style="position:absolute;width:100%;height:100%;left:0px; top:0px; z-index:10" src="images/loading2.gif" >  		         	
  </div>
  <%
	request.setCharacterEncoding("UTF-8");
    String userNo = session.getAttribute("userNo").toString();
    String serviceNo = session.getAttribute("serviceNo").toString();
    daoBDGamer dao = new daoBDGamer();//修改登录状态
	dao.uptGamerdown(userNo, serviceNo);
	Enumeration em = request.getSession().getAttributeNames();
  while(em.hasMoreElements()){
   request.getSession().removeAttribute(em.nextElement().toString());
  }
	out.print("<script>location.href='index.jsp';</script>");
 	%>
 	<script type="text/javascript">	
     // 为了删除指定名称的cookie,可以将其过期时间设定为一个过去的时间
     function delCookie(objName) {
       var date = new Date();
       date.setTime(date.getTime() - 10000);
       document.cookie = objName + "=a; expires=" + date.toGMTString();
     }    
     <%
     	//将玩家体力写回到数据库
		daoBDStoreHouse daoSH = new daoBDStoreHouse();
		String tili = (String)request.getAttribute("tl");//获取体力值
		if(tili!=null){//如果获取值不为空
			int a = Integer.parseInt(tili);
			daoSH.uptTiLi(userNo, serviceNo, a); //更新体力值
		}
		
     %>
	 delCookie("tili");//清空cookie	
	</script>
  </body>
</html>
