package serv.BE;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.BE.voBEShikigami;
import dao.BE.daoBEShikigami;

public class servBEShikigamiIns extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servBEShikigamiIns() {
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
		
		String shikigamiNo = request.getParameter("ID").trim();
		String shikigamiName = request.getParameter("name").trim();
		String shikigamiURL = request.getParameter("URL").trim();
		String shikigamiXYD = request.getParameter("XYD").trim();
		int attack = Integer.valueOf(request.getParameter("attack").trim());
		int developAttack = Integer.valueOf(request.getParameter("attack_percent").trim());
		int life = Integer.valueOf(request.getParameter("life").trim());
		int developLife = Integer.valueOf(request.getParameter("life_percent").trim());
		int defence = Integer.valueOf(request.getParameter("defense").trim());
		int developDefence = Integer.valueOf(request.getParameter("defense_percent").trim());
		int speed = Integer.valueOf(request.getParameter("speed").trim());
		double crit = Double.valueOf(request.getParameter("critical_attack").trim());
		double criticalDamage = Double.valueOf(request.getParameter("critical_damage").trim());
		String biography = request.getParameter("biography").trim();

		
		voBEShikigami voshikigami = new voBEShikigami();
		daoBEShikigami daoshikigami = new daoBEShikigami();
		voshikigami.setShikigamiNo(shikigamiNo);
		voshikigami.setShikigamiName(shikigamiName);
		voshikigami.setShikigamiURL(shikigamiURL);
		voshikigami.setShikigamiXYD(shikigamiXYD);
		voshikigami.setAttack(attack);
		voshikigami.setDevelopAttack(developAttack);
		voshikigami.setLife(life);
		voshikigami.setDevelopLife(developLife);
		voshikigami.setDefence(defence);
		voshikigami.setDevelopDefence(developDefence);
		voshikigami.setSpeed(speed);
		voshikigami.setCrit(crit);
		voshikigami.setCriticalDamage(criticalDamage);
		voshikigami.setBiography(biography);
		boolean flag = daoshikigami.insShikigami(voshikigami);
		if (flag==false){
			out.print("<script>location.href='../../Manage/shikigami.jsp';" +
			"alert('insert fail!');</script>");
		}else{
			out.print("<script>location.href='../../Manage/shikigami.jsp';</script>");
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
