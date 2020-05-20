package serv.BD;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.BD.voBDReply;
import dao.BD.daoBDReply;

public class servBDReplyIns extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		//String replyNo = request.getParameter("replyNo").trim();
		//String adminNo = request.getParameter("adminNo").trim();
		//String replyDate = request.getParameter("replyDate").trim();
		
		String leaveMessageNo = request.getParameter("leaveMessageNo").trim();
		String replyContent = request.getParameter("replyContent").trim();

//System.out.println("serBDReplyIns.java: replyContent=" + replyContent);
		//实例化vo，通过dao来插入数据
		voBDReply voR = new voBDReply();
		daoBDReply daoR = new daoBDReply();
		
		String replyNo = daoR.getReplyNo();
		voR.setReplyNo(replyNo);
		
		String adminNo = (String)session.getAttribute("AdminNo");
		voR.setAdministratorNo(adminNo);
		voR.setLeaveMessageNo(leaveMessageNo);
		
		//voR.setReplyDate(Date.valueOf(replyDate));
		
		voR.setReplyContent(replyContent);
		
		boolean flag = daoR.insReply(voR);
		if (flag==false){
			out.print("<script>location.href='../../Manage/reply.jsp';" +
			"alert('insert fail!');</script>");
		}else{
			out.print("<script>location.href='../../Manage/reply.jsp';</script>");
		}
	}
	
}
