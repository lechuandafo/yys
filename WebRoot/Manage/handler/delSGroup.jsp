<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BD.*"%>
<html>
	<body>
		
		<%
			String removeSGroup=request.getParameter("SGroupNo");
			removeSGroup=new String(removeSGroup.getBytes("iso-8859-1"));
			System.out.println("delSGroup.jsp: "+removeSGroup);
			daoBDSGroup dao = new daoBDSGroup();
			voBDSGroup vo = new voBDSGroup();
			vo.setSGroupNo(removeSGroup);
			boolean flag = dao.delSGroup(vo);
			if (flag==false){
		%>
			<script>
				location.href='../sGroup.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../sGroup.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>