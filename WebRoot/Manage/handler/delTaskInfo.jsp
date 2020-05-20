<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			String removeTask=request.getParameter("taskNo");
			removeTask=new String(removeTask.getBytes("iso-8859-1"));
			System.out.println("delTaskInfo.jsp: "+removeTask);
			daoBETaskInfo dao = new daoBETaskInfo();
			voBETaskInfo vo = new voBETaskInfo();
			vo.setTaskNo(removeTask);
			boolean flag = dao.delTaskInfo(vo);
			if (flag==false){
		%>
			<script>
				location.href='../task.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../task.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>