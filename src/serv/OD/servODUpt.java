package serv.OD;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OD.daoODExecuteUpt;

public class servODUpt extends HttpServlet {

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
		
		
		String url = request.getHeader("Referer");//得到发出请求的页面的URL
		String pkValue = request.getParameter("pkValue").trim();
		String uptIndex = request.getParameter("uptIndex").trim();
		String newValue = request.getParameter("newValue").trim();
		
		String tableName = url.substring(url.lastIndexOf('/')+1, url.length()-4);//得到要修改的表名
		if(tableName.equals("gamerBasicInfo")) tableName = "gamer";
		else if(tableName.equals("commodity")) tableName = "commodityInfo";
		else if(tableName.equals("product")) tableName = "productInfo";
		else if(tableName.equals("task")) tableName = "taskInfo";
		
		pkValue = new String(pkValue.getBytes("ISO-8859-1"),"utf-8");//解决js内容提交到servlet乱码问题
		uptIndex = new String(uptIndex.getBytes("ISO-8859-1"),"utf-8");//解决js内容提交到servlet乱码问题
		newValue = new String(newValue.getBytes("ISO-8859-1"),"utf-8");//解决js内容提交到servlet乱码问题
		
System.out.println("servODUpt.java: pkValue = "+pkValue);
System.out.println("servODUpt.java: tableName = "+tableName);

		daoODExecuteUpt dao = new daoODExecuteUpt();
		boolean flag = dao.executeUpt(tableName, pkValue, Integer.valueOf(uptIndex), newValue);
		if(flag == false){
			out.write("false");
		}
		else out.write("true");
	}

}
