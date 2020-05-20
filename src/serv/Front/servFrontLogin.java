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
import vo.BE.*;
import dao.BD.*;
import dao.BE.*;
import vo.OD.*;
import dao.OD.*;
public class servFrontLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servFrontLogin() {
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
		String usrnam=request.getParameter("usrnam");
		//System.out.println(usrnam);
    	String psw=request.getParameter("psw");
    	HttpSession session = request.getSession();
    	daoODUserInfo daoUI = new daoODUserInfo();
    	ArrayList UI = null;
    	try{
    		UI = daoUI.qryUser(usrnam);
		}catch(Exception e){
			e.printStackTrace();
		}
    	if(UI.size()<=0) {
    		String flag = "2";
    		request.setAttribute("flag",flag);
    		response.sendRedirect("../../index.jsp?flag="+flag);
    		return ;
    	}
    	voODUserInfo vo = (voODUserInfo) UI.get(0);
    	if(psw.equals(vo.getPassword())){
    		
    		session.setAttribute("userNo", vo.getUserNo());  
    	    session.setMaxInactiveInterval(86400); 
    		response.sendRedirect("../../logined.jsp?userNo="+vo.getUserNo());
    	}
    	else{
    		String flag = "1";
    		request.setAttribute("flag",flag);
    		response.sendRedirect("../../index.jsp?flag="+flag);
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
