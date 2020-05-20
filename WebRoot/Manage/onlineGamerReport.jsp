<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.OD.*"%>
<%@ page import="vo.OD.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html> <!--  lang="zh-cn" -->
<head>
<meta charset="utf-8">
<title>在线人数报表</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
</head>

<body>
<div class="container">
		<%daoODGamerOnline dao=new daoODGamerOnline();
		ArrayList<voODGamerOnline> theList=new ArrayList<voODGamerOnline>();
		theList=dao.queryRecords(); %>
	<table  style="width: 500px;" class="table table-striped table-hover table-bordered">
	    <tr align="left">
		 <td><strong>服务区</strong></td>
	     <td><strong>在线人数</strong></td>
	     <td><strong>总人数</strong></td>
		</tr>
	<%
		if(theList!=null&&theList.size()>0){
			for(int i=0;i<theList.size();i++){
				voODGamerOnline vo=new voODGamerOnline();
				vo=theList.get(i);
				String serviceNo=vo.getServiceNo();
				int inpep=vo.getInpep();
				int sumpep=vo.getSumpep();
	%>
		<tr align="left">
		   <td><%= serviceNo%></td>
		   <td><%= inpep%></td>
		   <td><%= sumpep%></td>
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
