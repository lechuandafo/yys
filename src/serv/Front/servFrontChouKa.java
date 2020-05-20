package serv.Front;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;


import vo.BD.*;
import dao.BD.*;
import vo.BE.*;
import dao.BE.*;


public class servFrontChouKa extends HttpServlet {

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
		
			this.doPost(request, response);
			
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

		String tagStr = request.getParameter("tag").trim();
		String userNo = request.getParameter("userNo").trim();
		String serviceNo = request.getParameter("serviceNo").trim();
		
		voBDStoreHouse voSH = new voBDStoreHouse();
		voSH.setUserNo(userNo);
		voSH.setServiceNo(serviceNo);
		daoBDStoreHouse daoSH = new daoBDStoreHouse(); 
		
		int tag = Integer.parseInt(tagStr);
		boolean flag;//消费是否成功
		System.out.println(123);
		if(tag == 1) //用符咒抽卡
			flag = daoSH.consumeFuzhou(voSH);
			
		else //用勾玉抽卡
			flag = daoSH.consumeGouyu(voSH, 100);
	
		/**********刷新的问题***********/
		if(flag==false)
		{
			out.print("<script>location.href='../../drawCard.jsp';" +
			"alert('消费失败！');</script>");
		}
		else
		{//可以进行抽卡

			//生成抽卡随机式神编号
			Random random = new Random();
	
			//先查询当前式神总集中一共有多少式神
			daoBEShikigami daoShikigaimi = new daoBEShikigami(); 
			int Max = daoShikigaimi.qryShikigamiTotalNum();
			
			int id = random.nextInt(Max);//[0,Max)随机数,式神从0开始编号，最大编号为Max-1
			String idStr = String.valueOf(id);
			int len = idStr.length();
			for(int i=0; i<4-len; i++)
				idStr = "0" + idStr;
			idStr = "K" + idStr;//得到随机的式神ID
			//System.out.println("servFrontChouKa: idStr="+idStr);
			
			//插入此式神到玩家的式神录中
			voBDGamerShikigami voGS = new voBDGamerShikigami();
			voGS.setUserNo(userNo);
			voGS.setServiceNo(serviceNo);
			voGS.setShikigamiNo(idStr);
			
			//得到此式神部分码，即第几个
			daoBDGamerShikigami daoGS = new daoBDGamerShikigami();
			String skipNo = daoGS.qryShikigamiSkipNobyID(userNo, serviceNo, idStr);
			voGS.setSkipNo(skipNo);
			
			if(daoGS.insGamerShikigami(voGS) == false)
			{
				out.print("<script>location.href='../../Manage/handler/404.html';");//插入失败，跳到统一出错界面。
			}
			else
			{
				//插入成功，则根据式神ID查询式神信息，并将图片URL传给前台
				voBEShikigami voS = new voBEShikigami(); 
				voS = daoShikigaimi.qryShikigamiByID(idStr);
				String imageURL=voS.getShikigamiURL();
				System.out.println("imageURL:"+imageURL);
				response.getWriter().write(imageURL);
				/**********刷新的问题***********/
				//response.sendRedirect("../../drawCard.jsp?imageURL="+voS.getShikigamiURL());
			}
		}
	}
}
