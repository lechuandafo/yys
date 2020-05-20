package serv.OD;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.BE.voBEAdministrator;
import vo.OD.voODUserInfo;
import dao.BE.daoBEAdministrator;
import dao.OD.daoODUserInfo;

public class servODLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servODLogin() {
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

		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		//System.out.println(usrnam);
    	String psw=request.getParameter("password");
    	HttpSession session = request.getSession();
    	daoBEAdministrator daoUI = new daoBEAdministrator();
    	
    	ArrayList UI = null;
    	try{
    		UI = daoUI.qryAdmin(name);
    		System.out.println(name);
		}catch(Exception e){
			e.printStackTrace();
		}
    	if(UI.size()<=0) {
    		String flag = "2";
    		request.setAttribute("flag",flag);
    		response.sendRedirect("../../Manage/login.jsp?flag="+flag);
    		return ;
    	}
    	voBEAdministrator vo = (voBEAdministrator) UI.get(0);
    	if(psw.equals(vo.getAdministratorPassword())){
    		
    		session.setAttribute("AdminNo", vo.getAdministratorNo());  
    	    session.setMaxInactiveInterval(86400); 
    		response.sendRedirect("../../Manage/index.html");
    	}
    	else{
    		String flag = "1";
    		request.setAttribute("flag",flag);
    		response.sendRedirect("../../Manage/login.jsp?flag="+flag);
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
