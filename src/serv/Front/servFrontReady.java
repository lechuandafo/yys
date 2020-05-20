package serv.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.BD.voBDPFightGroup;

import dao.BD.daoBDPFightGroup;

public class servFrontReady extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servFrontReady() {
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
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		String[] Shikigami=request.getParameterValues("csNo");//获取式神编号+
		String[] shikigamiNo = new String[5];
		String[] skipNo = new String[5];
		daoBDPFightGroup pfdao = new daoBDPFightGroup();
		String userNo = session.getAttribute("userNo").toString();
		String serviceNo = session.getAttribute("serviceNo").toString();
		ArrayList pflist = pfdao.qrybuyMitamaM(userNo, serviceNo);
		voBDPFightGroup pfvo = (voBDPFightGroup)pflist.get(0);
		String leaderNo = pfvo.getLeaderNo();
		voBDPFightGroup vo = new voBDPFightGroup();
		int i=0;
		while(i<Shikigami.length){
			String[] str = Shikigami[i].split(",");
			shikigamiNo[i]=str[0];
			skipNo[i]=str[1];
			i++;
		}
		vo.setUserNo(userNo);
		vo.setServiceNo(serviceNo);
		vo.setLeaderNo(leaderNo);
		vo.setShikigamiNo1(shikigamiNo[0]);
		vo.setSkipNo1(skipNo[0]);
		vo.setShikigamiNo2(shikigamiNo[1]);
		vo.setSkipNo2(skipNo[1]);
		vo.setShikigamiNo3(shikigamiNo[2]);
		vo.setSkipNo3(skipNo[2]);
		vo.setShikigamiNo4(shikigamiNo[3]);
		vo.setSkipNo4(skipNo[3]);
		vo.setShikigamiNo5(shikigamiNo[4]);
		vo.setSkipNo5(skipNo[4]);
		boolean flag = pfdao.uptPFightGroup(vo);
		if (flag==true){
			response.sendRedirect("../../Fight.jsp");
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
