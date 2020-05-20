<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			String removeProduct=request.getParameter("productNo");
			removeProduct=new String(removeProduct.getBytes("iso-8859-1"));
			System.out.println("delProductInfo.jsp: "+removeProduct);
			daoBEProductInfo dao = new daoBEProductInfo();
			voBEProductInfo vo = new voBEProductInfo();
			vo.setProductNo(removeProduct);
			boolean flag = dao.delProductInfo(vo);
			if (flag==false){
		%>
			<script>
				location.href='../product.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../product.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>