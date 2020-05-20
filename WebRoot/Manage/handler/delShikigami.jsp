<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			String removeShikigami=request.getParameter("shikigamiNo");
			removeShikigami=new String(removeShikigami.getBytes("iso-8859-1"));
			System.out.println("delShikigami.jsp: "+removeShikigami);
			daoBEShikigami dao = new daoBEShikigami();
			voBEShikigami vo = new voBEShikigami();
			vo.setShikigamiNo(removeShikigami);
			boolean flag = dao.delShikigami(vo);
			if (flag==false){
		%>
			<script>
				location.href='../shikigami.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../shikigami.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>