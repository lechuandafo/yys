package serv.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.BD.*;
import dao.BD.*;
import vo.OD.*;
import dao.OD.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat; 

public class servFrontUserService extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servFrontUserService() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		String userNo=request.getParameter("usn");
		//System.out.println(usrnam);
    	String serviceNo=request.getParameter("sern");
    	session.setAttribute("serviceNo", serviceNo);
    	daoBDGamer dao = new daoBDGamer();
		ArrayList list = dao.qryGamerService(userNo,serviceNo);
		System.out.println(list.size());
		if(list.size()>0){
			voBDGamer vo = (voBDGamer) list.get(0);
			System.out.println(vo.getGamerName()+vo.getUserNo()+vo.getServiceNo()+vo.getImageURL());
			dao.uptGamerup(userNo, serviceNo);
			String json = "{\"url\":\"Game.jsp?gamerName="+vo.getGamerName()+"\"}";
		    out.print(json);
		}
		else{
			String json = "{\"url\":\"firstLogin.jsp?serviceNo="+serviceNo+"\"}";
		    out.print(json);
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
