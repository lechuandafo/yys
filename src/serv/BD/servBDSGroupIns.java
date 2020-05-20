package serv.BD;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.BD.voBDSGroup;
import dao.BD.daoBDSGroup;

public class servBDSGroupIns extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servBDSGroupIns() {
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
		
		String SGroupNo = request.getParameter("SGroupNo").trim();
		String ShikigamiNo1 = request.getParameter("shikigamiNo1").trim();
		int Slevel1 = Integer.valueOf(request.getParameter("slevel1").trim());
		String ShikigamiNo2 = request.getParameter("shikigamiNo2").trim();
		int Slevel2 = Integer.valueOf(request.getParameter("slevel2").trim());
		String ShikigamiNo3 = request.getParameter("shikigamiNo3").trim();
		int Slevel3 = Integer.valueOf(request.getParameter("slevel3").trim());
		
		voBDSGroup voSGroup = new voBDSGroup();
		daoBDSGroup daoSGroup = new daoBDSGroup();
		voSGroup.setSGroupNo(SGroupNo);
		voSGroup.setShikigamiNo1(ShikigamiNo1);
		voSGroup.setSlevel1(Slevel1);
		voSGroup.setShikigamiNo2(ShikigamiNo2);
		voSGroup.setSlevel2(Slevel2);
		voSGroup.setShikigamiNo3(ShikigamiNo3);
		voSGroup.setSlevel3(Slevel3);
		boolean flag = daoSGroup.insSGroup(voSGroup);
		if (flag==false){
			out.print("<script>location.href='../../Manage/sGroup.jsp';" +
			"alert('insert fail!');</script>");
		}else{
			out.print("<script>location.href='../../Manage/sGroup.jsp';</script>");
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
