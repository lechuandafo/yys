<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.OD.*"%>
<%@ page import="vo.OD.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>活跃排名报表</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
</head>

<body>
<div class="container">
		<%daoODSkillRank dao=new daoODSkillRank();
		ArrayList<voODSkillRank> rankList=new ArrayList<voODSkillRank>();
		rankList=dao.queryRecords(); %>
	<table style="width: 500px;" class="table table-striped table-hover table-bordered">
	    <tr align="left">
		 <td><strong>服务区</strong></td>
	     <td><strong>服务区名</strong></td>
	     <td><strong>排名</strong></td>
	     <td><strong>玩家名</strong></td>
	     <td><strong>等级</strong></td>
	     <td><strong>活跃度</strong></td>
		</tr>
	<%
		if(rankList!=null&&rankList.size()>0){
			for(int i=0;i<rankList.size();i++){
				voODSkillRank vo=new voODSkillRank();
				vo=rankList.get(i);
				String serviceNo=vo.getServiceNo();
				String serviceName=vo.getServiceName();
				int rank=vo.getRank();
				String gamerName=vo.getGamerName();
				int level=vo.getLevel();
				int fightSkillPoint=vo.getFightSkillPoint();
	%>
		<tr align="left">
		   <td><%= serviceNo%></td>
		   <td><%= serviceName%></td>
		   <td><%= rank%></td>
		   <td><%= gamerName%></td>
		   <td><%= level%></td>
		   <td><%= fightSkillPoint%></td>
		   </tr>
	<%
		  }
		}
	%>
	</table>
	<p>制表人：陈振宇&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	编制日期：<% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); %>
	</p>
</div>
</body>
</html>


