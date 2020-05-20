package serv.BD;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.BD.voBDInstanceFight;
import dao.BD.daoBDInstanceFight;

public class servBDInstanceFightIns extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servBDInstanceFightIns() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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
		
		String InstanceNo = request.getParameter("instanceNo").trim();
		int RoundTime = Integer.valueOf(request.getParameter("roundTime").trim());
		String SGroupNo = request.getParameter("sGroupNo").trim();
		String MapNo = request.getParameter("mapNo").trim();
		
		voBDInstanceFight voInstanceFight = new voBDInstanceFight();
		daoBDInstanceFight daoInstanceFight = new daoBDInstanceFight();
		voInstanceFight.setInstanceNo(InstanceNo);
		voInstanceFight.setRoundTime(RoundTime);
		voInstanceFight.setSGroupNo(SGroupNo);
		voInstanceFight.setMapNo(MapNo);
		boolean flag = daoInstanceFight.insInstanceFight(voInstanceFight);
		if (flag==false){
			out.print("<script>location.href='../../Manage/instanceFight.jsp';" +
			"alert('insert fail!');</script>");
		}else{
			out.print("<script>location.href='../../Manage/instanceFight.jsp';</script>");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
