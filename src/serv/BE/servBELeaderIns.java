package serv.BE;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.BE.voBELeader;
import dao.BE.daoBELeader;

public class servBELeaderIns extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servBELeaderIns() {
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
		
		String leaderNo = request.getParameter("ID").trim();
		String leaderName = request.getParameter("name").trim();
		String leaderURL = request.getParameter("URL").trim();
		int leaderCreateAttack = Integer.valueOf(request.getParameter("attack").trim());
		int leaderDevelopAttack = Integer.valueOf(request.getParameter("attack_percent").trim());
		int leaderCreateLife = Integer.valueOf(request.getParameter("life").trim());
		int leaderDevelopLife = Integer.valueOf(request.getParameter("life_percent").trim());
		int leaderCreateDefence = Integer.valueOf(request.getParameter("defense").trim());
		int leaderDevelopDefence = Integer.valueOf(request.getParameter("defense_percent").trim());
		int leaderCreateSpeed = Integer.valueOf(request.getParameter("speed").trim());
		double leaderCreateCrit = Double.valueOf(request.getParameter("critical_attack").trim());
		double leaderCreateCriticalDamage = Double.valueOf(request.getParameter("critical_damage").trim());
		String biography = request.getParameter("biography").trim();

		
		voBELeader voLeader = new voBELeader();
		daoBELeader daoLeader = new daoBELeader();
		voLeader.setLeaderNo(leaderNo);
		voLeader.setLeaderName(leaderName);
		voLeader.setLeaderURL(leaderURL);
		voLeader.setLeaderCreateAttack(leaderCreateAttack);
		voLeader.setLeaderDevelopAttack(leaderDevelopAttack);
		voLeader.setLeaderCreateLife(leaderCreateLife);
		voLeader.setLeaderDevelopLife(leaderDevelopLife);
		voLeader.setLeaderCreateDefence(leaderCreateDefence);
		voLeader.setLeaderDevelopDefence(leaderDevelopDefence);
		voLeader.setLeaderCreateSpeed(leaderCreateSpeed);
		voLeader.setLeaderCreateCrit(leaderCreateCrit);
		voLeader.setLeaderCreateCriticalDamage(leaderCreateCriticalDamage);
		voLeader.setBiography(biography);
		boolean flag = daoLeader.insLeader(voLeader);
		if (flag==false){
			out.print("<script>location.href='../../Manage/leader.jsp';" +
			"alert('insert fail!');</script>");
		}else{
			out.print("<script>location.href='../../Manage/leader.jsp';</script>");
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
