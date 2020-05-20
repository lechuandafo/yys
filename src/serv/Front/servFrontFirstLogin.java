package serv.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.BD.voBDGamer;
import vo.BD.voBDGamerLearder;
import vo.BD.voBDPFightGroup;
import vo.BD.voBDStoreHouse;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import dao.BD.daoBDGamer;
import dao.BD.daoBDGamerLearder;
import dao.BD.daoBDPFightGroup;
import dao.BD.daoBDStoreHouse;

public class servFrontFirstLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servFrontFirstLogin() {
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
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String userNo=(String) session.getAttribute("userNo");
		String serviceNo=(String) session.getAttribute("serviceNo");
    	String gamerName = request.getParameter("gamern");
    	/*java.util.Date a = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	java.sql.Date registTime = new java.sql.Date(a.getTime());
    	System.out.println(registTime);*/
    	String imageURL = "images/head_1.jpg";
    	int pvpGrade = 100;
    	int status = 0;
    	voBDGamer vo = new voBDGamer();
    	daoBDGamer dao = new daoBDGamer();
    	vo.setUserNo(userNo);
    	vo.setServiceNo(serviceNo);
    	vo.setGamerName(gamerName);
    	//vo.setRegistTime(registTime);
    	vo.setImageURL(imageURL);
    	vo.setPvpGrade(pvpGrade);
    	vo.setStatus(status);
    	boolean flag = dao.insGamerFirst(vo);
    	
    	if (flag==false){
    		String json = "{\"url\":\"logined.jsp\"}";
    		out.print(json);
		}else{
			String [] leaderNo = new String [] {"L1","L2","L3","L4"};
			String [] skill = new String [] {"S001","S002","S003","S004","S005","S006","S007","S008","S009","S010","S011","S012"};
			int i;
			voBDGamerLearder vof = new voBDGamerLearder();
			daoBDGamerLearder daof = new daoBDGamerLearder();
			
			for(i=0;i<4;i++){
				vof.setUserNo(userNo);
				vof.setServiceNo(serviceNo);
				vof.setLeaderNo(leaderNo[i]);
				vof.setLeaderLevel(0);
				vof.setLeaderEXP(0);
				vof.setSkillNo1(skill[i*3+0]);
				vof.setSkillNo2(skill[i*3+1]);
				vof.setSkillNo3(skill[i*3+2]);
				System.out.println(flag);
				daof.insGamerLearder(vof);
			}
			
			voBDPFightGroup pfvo = new voBDPFightGroup();
			daoBDPFightGroup pfdao = new daoBDPFightGroup();
			pfvo.setUserNo(userNo);
			pfvo.setServiceNo(serviceNo);
			pfvo.setLeaderNo("L1");
			pfdao.insPFightGroup(pfvo);
			dao.uptGamerup(userNo, serviceNo);
			
			//玩家第一次注册该区，送500勾玉1000金币，初始体力为100
			daoBDStoreHouse daoSH = new daoBDStoreHouse();
			voBDStoreHouse voSH = new voBDStoreHouse();
			
			voSH.setUserNo(userNo); voSH.setServiceNo(serviceNo); voSH.setProductNo("P0"); voSH.setNum(500);
			daoSH.insStoreHouse(voSH);
			
			voSH.setProductNo("P1"); voSH.setNum(1000);
			daoSH.insStoreHouse(voSH);
			
			voSH.setProductNo("P3"); voSH.setNum(100);
			daoSH.insStoreHouse(voSH);
			
			
			String json = "{\"url\":\"Game.jsp?gamerName="+gamerName+"\"}";
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
