<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BD.*"%>
<html>
	<body>
		
		<%
			String removeCommodityDetail=request.getParameter("productNo");
			removeCommodityDetail=new String(removeCommodityDetail.getBytes("iso-8859-1"));
			System.out.println("delCommodityDetail.jsp: "+removeCommodityDetail);
			daoBDCommodityDetail dao = new daoBDCommodityDetail();
			voBDCommodityDetail vo = new voBDCommodityDetail();
			vo.setProductNo(removeCommodityDetail);
			boolean flag = dao.delCommodityDetail(vo);
			if (flag==false){
		%>
			<script>
				location.href='../commodityDetail.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../commodityDetail.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>