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
<title>商品日售报表</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
</head>

<body>
<div class="container">
		<%daoODProductSell dao=new daoODProductSell();
		ArrayList<voODProductSell> ProductList=new ArrayList<voODProductSell>();
		ProductList=dao.queryRecords(); %>
	<table  style="width: 500px;" class="table table-striped table-hover table-bordered">
	    <tr align="left">
		 <td><strong>服务区</strong></td>
	     <td><strong>商品编号</strong></td>
	     <td><strong>单价</strong></td>
	     <td><strong>销售数量</strong></td>
	     <td><strong>销售额</strong></td>
		</tr>
	<%
		if(ProductList!=null&&ProductList.size()>0){
			for(int i=0;i<ProductList.size();i++){
				voODProductSell vo=new voODProductSell();
				vo=ProductList.get(i);
				String serviceNo=vo.getServiceNo();
				String commodityNo=vo.getCommodityNo();
				int price=vo.getPrice();
				int ccountSum=vo.getCcountSum();
				int cSum=vo.getcSum();
	%>
		<tr align="left">
		   <td><%= serviceNo%></td>
		   <td><%= commodityNo%></td>
		   <td><%= price%></td>
		   <td><%= ccountSum%></td>
		   <td><%= cSum%></td>
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


