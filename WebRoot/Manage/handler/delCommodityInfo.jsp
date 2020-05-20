<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			String removeCommodity=request.getParameter("commodityNo");
			removeCommodity=new String(removeCommodity.getBytes("iso-8859-1"));
			System.out.println("delCommodityInfo.jsp: "+removeCommodity);
			daoBECommodityInfo dao = new daoBECommodityInfo();
			voBECommodityInfo vo = new voBECommodityInfo();
			vo.setCommodityNo(removeCommodity);
			boolean flag = dao.delCommodityInfo(vo);
			if (flag==false){
		%>
			<script>
				location.href='../commodity.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../commodity.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>