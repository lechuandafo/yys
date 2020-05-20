<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<html>
	<body>
		
		<%
			String removeLeader=request.getParameter("leaderNo");
			removeLeader=new String(removeLeader.getBytes("iso-8859-1"));
			System.out.println("delLeader.jsp: "+removeLeader);
			daoBELeader dao = new daoBELeader();
			voBELeader vo = new voBELeader();
			vo.setLeaderNo(removeLeader);
			boolean flag = dao.delLeader(vo);
			if (flag==false){
		%>
			<script>
				location.href='../leader.jsp';
				alert('delete fail！');
			</script>
		<% 
			}else{
		%>
			<script>
				location.href='../leader.jsp';
				//alert('delete success！');
			</script>
		<% 	}%>
		
	</body>
</html>