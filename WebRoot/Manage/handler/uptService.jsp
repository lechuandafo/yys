<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			
			String removeService=request.getParameter("serviceID");
			//removebook=new String(removebook.getBytes("iso-8859-1"));
			System.out.println(removeService);
			daoBEService dao = new daoBEService();
			voBEService vo = new voBEService();
			vo.setServiceNo(removeService);
			boolean flag = dao.delService(vo);
			if (flag==false){
		%>
			<script>
				location.href='service.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='service.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>