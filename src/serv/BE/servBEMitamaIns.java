package serv.BE;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.BE.voBEMitama;
import dao.BE.daoBEMitama;

public class servBEMitamaIns extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servBEMitamaIns() {
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
		
		String mitamaNo = request.getParameter("ID").trim();
		String mitamaName = request.getParameter("name").trim();
		String mitamaURL = request.getParameter("URL").trim();
		int createAttack = Integer.valueOf(request.getParameter("attack").trim());
		double developAttack = Double.valueOf(request.getParameter("attack_percent").trim());
		int createLife = Integer.valueOf(request.getParameter("life").trim());
		double developLife = Double.valueOf(request.getParameter("life_percent").trim());
		int createDefence = Integer.valueOf(request.getParameter("defense").trim());
		double developDefence = Double.valueOf(request.getParameter("defense_percent").trim());
		int createSpeed = Integer.valueOf(request.getParameter("speed").trim());
		double developSpeed = Double.valueOf(request.getParameter("speed_percent").trim());
		double createCrit = Double.valueOf(request.getParameter("critical_attack").trim());
		double developCrit = Double.valueOf(request.getParameter("critical_attack_percent").trim());
		double createCriticalDamage = Double.valueOf(request.getParameter("critical_damage").trim());
		double developCriticalDamage = Double.valueOf(request.getParameter("critical_damage_percent").trim());
		double createBlocking = Double.valueOf(request.getParameter("blocking").trim());
		double developBlocking = Double.valueOf(request.getParameter("blocking_percent").trim());
		double createResistance = Double.valueOf(request.getParameter("resistance").trim());
		double developResistance = Double.valueOf(request.getParameter("resistance_percent").trim());
		String suitNature = request.getParameter("suitnature").trim();

		
		voBEMitama vomitama = new voBEMitama();
		daoBEMitama daomitama = new daoBEMitama();
		vomitama.setMitamaNo(mitamaNo);
		vomitama.setMitamaName(mitamaName);
		vomitama.setMitamaURL(mitamaURL);
		vomitama.setCreateAttack(createAttack);
		vomitama.setDevelopAttack(developAttack);
		vomitama.setCreateLife(createLife);
		vomitama.setDevelopLife(developLife);
		vomitama.setCreateDefence(createDefence);
		vomitama.setDevelopDefence(developDefence);
		vomitama.setCreateSpeed(createSpeed);
		vomitama.setDevelopSpeed(developSpeed);
		vomitama.setCreateCrit(createCrit);
		vomitama.setDevelopCrit(developCrit);
		vomitama.setCreateCriticalDamage(createCriticalDamage);
		vomitama.setDevelopCriticalDamage(developCriticalDamage);
		vomitama.setCreateBlocking(createBlocking);
		vomitama.setDevelopBlocking(developBlocking);
		vomitama.setCreateResistance(createResistance);
		vomitama.setDevelopResistance(developResistance);
		vomitama.setSuitNature(suitNature);
		boolean flag = daomitama.insMitama(vomitama);
		if (flag==false){
			out.print("<script>location.href='../../Manage/mitama.jsp';" +
			"alert('insert fail!');</script>");
		}else{
			out.print("<script>location.href='../../Manage/mitama.jsp';" +
			"alert('insert success!');</script>");
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
