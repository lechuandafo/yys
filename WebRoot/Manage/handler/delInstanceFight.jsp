<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BD.*"%>
<html>
	<body>
		
		<%
			String removeInstanceFight=request.getParameter("InstanceNo");
			removeInstanceFight=new String(removeInstanceFight.getBytes("iso-8859-1"));
			System.out.println("delInstanceFight.jsp: "+removeInstanceFight);
			daoBDInstanceFight dao = new daoBDInstanceFight();
			voBDInstanceFight vo = new voBDInstanceFight();
			vo.setInstanceNo(removeInstanceFight);
			boolean flag = dao.delInstanceFight(vo);
			if (flag==false){
		%>
			<script>
				location.href='../instanceFight.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../instanceFight.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>