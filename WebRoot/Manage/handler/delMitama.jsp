<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			String removeMitama=request.getParameter("mitamaNo");
			removeMitama=new String(removeMitama.getBytes("iso-8859-1"));
			System.out.println("delMitama.jsp: "+removeMitama);
			daoBEMitama dao = new daoBEMitama();
			voBEMitama vo = new voBEMitama();
			vo.setMitamaNo(removeMitama);
			boolean flag = dao.delMitama(vo);
			if (flag==false){
		%>
			<script>
				location.href='../mitama.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../mitama.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>