package dao.BE;

import java.sql.*;
import java.util.*;
import vo.BE.voBEService;
import connDB.connyysDB;

public class daoBEService {
	connyysDB connDB=new connyysDB();
	
	public boolean insService(voBEService Service)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Service values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Service.getServiceNo().trim());
			psmt.setString(2, Service.getServiceName().trim());
			psmt.setString(3, "0");//新增区时前端没有赋值当前人数，默认为0
			psmt.setString(4, Service.getCapacity().trim());
System.out.println(Service.getServiceNo());
			int nReturn = psmt.executeUpdate();
			if (nReturn == 1) flag = true;			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return flag;		
	}
	
	
	
	//删除区
	public boolean delService(voBEService Service)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Service where serviceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Service.getServiceNo());
			System.out.println("daoBEService.java: "+Service.getServiceNo());
			int nReturn = psmt.executeUpdate();
			if (nReturn == 1) flag = true;			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return flag;		
	}

	//查询区
	public ArrayList qryService()
	{
		ArrayList ServiceList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Service order by serviceNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBEService ServicevoAll=new voBEService();
				ServicevoAll.setServiceNo(rs.getString("serviceNo"));
				ServicevoAll.setServiceName(rs.getString("serviceName"));
				ServicevoAll.setCurrentNumber(rs.getString("currentNumber"));
				ServicevoAll.setCapacity(rs.getString("capacity"));
				ServiceList.add(ServicevoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return ServiceList;		
	}	

	//修改更新
	public boolean uptService(String uptAttr, String uptValue )//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		//int TableIndex = TableNametoIndex["Service"];
		String sSql = "update Service set ";
		sSql = sSql + uptAttr + " = " + uptValue;
		//sSql = sSql + " where serviceNo = " + TableFK[TableIndex][0];
		
		
		try {			
			
			int nReturn = psmt.executeUpdate();
			if (nReturn == 1) flag = true;			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return flag;		
	}
	
}
