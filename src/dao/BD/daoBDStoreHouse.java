package dao.BD;

import java.sql.*;
import java.util.*;

import vo.BD.voBDStoreHouse;
import connDB.connyysDB;

public class daoBDStoreHouse {
	connyysDB connDB=new connyysDB();
	
	public boolean insStoreHouse(voBDStoreHouse StoreHouse)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into StoreHouse values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, StoreHouse.getUserNo().trim());
			psmt.setString(2, StoreHouse.getServiceNo().trim());
			psmt.setString(3, StoreHouse.getProductNo().trim());
			psmt.setString(4, String.valueOf(StoreHouse.getNum()).trim());
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
	public boolean delStoreHouse(voBDStoreHouse StoreHouse)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from StoreHouse where UserNo=? and serviceNo=? and productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, StoreHouse.getUserNo());
			psmt.setString(2, StoreHouse.getServiceNo());
			psmt.setString(3, StoreHouse.getProductNo());
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
	public ArrayList qryStoreHouse()
	{
		ArrayList StoreHouseList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from StoreHouse order by UserNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDStoreHouse StoreHousevoAll=new voBDStoreHouse();
				StoreHousevoAll.setUserNo(rs.getString("userNo"));
				StoreHousevoAll.setServiceNo(rs.getString("serviceNo"));
				StoreHousevoAll.setProductNo(rs.getString("productNo"));
				StoreHousevoAll.setNum(rs.getInt("num"));
				StoreHouseList.add(StoreHousevoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return StoreHouseList;		
	}
	
	public int qryGouyu(String userNo, String serviceNo)
	{
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select num from StoreHouse where UserNo=? and ServiceNo=? and ProductNo=?";
		
//System.out.println("dao: "+sSql);
		int retNum = 0;
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
			psmt.setString(3, "P0");
			rs  = psmt.executeQuery();	
			rs.next();
			retNum = rs.getInt("num");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return retNum;	
		
	}
	
	public int qryFuzhou(String userNo, String serviceNo)
	{
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select num from StoreHouse where UserNo=? and ServiceNo=? and ProductNo=?";
		
//System.out.println("dao: "+sSql);
		int retNum = 0;
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
			psmt.setString(3, "P1");
			rs  = psmt.executeQuery();	
			rs.next();
			retNum = rs.getInt("num");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return retNum;	
		
	}
	
	//抽卡或购买商品消费勾玉
	public boolean consumeGouyu(voBDStoreHouse StoreHouse, int num)
	{
		boolean flag = false;               //操作是否成功
		
		//先查询玩家勾玉数目
		int remain = qryGouyu(StoreHouse.getUserNo(), StoreHouse.getServiceNo());
		if(remain < num) return false;
		remain -= num;
		
		PreparedStatement psmt = null;
		String sSql = "update StoreHouse set num=? where UserNo=? and serviceNo=? and productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, String.valueOf(remain));
			psmt.setString(2, StoreHouse.getUserNo());
			psmt.setString(3, StoreHouse.getServiceNo());
			psmt.setString(4, "P0");//勾玉编号
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
	
	//抽卡消费符咒
	public boolean consumeFuzhou(voBDStoreHouse StoreHouse)
	{
		boolean flag = false;               //操作是否成功
		
		//先查询玩家符咒数目
		int remain = qryFuzhou(StoreHouse.getUserNo(), StoreHouse.getServiceNo());
		if(remain < 1) return false;
		remain -= 1;
		PreparedStatement psmt = null;
		String sSql = "update StoreHouse set num=? where UserNo=? and serviceNo=? and productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, String.valueOf(remain));
			psmt.setString(2, StoreHouse.getUserNo());
			psmt.setString(3, StoreHouse.getServiceNo());
			psmt.setString(4, "P1");//符咒编号
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
	public int qryStoreHouseM(String userNo, String serviceNo , String productNo)
	{
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select num from StoreHouse where UserNo=? and ServiceNo=? and ProductNo=?";
		
//System.out.println("dao: "+sSql);
		int retNum = 0;
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
			psmt.setString(3, productNo);
			rs  = psmt.executeQuery();	
			rs.next();
			retNum = rs.getInt("num");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return retNum;	
		
	}
	public boolean uptTiLi(String userNo, String serviceNo , int tili)//刷新体力
	{
		boolean flag = false;               //操作是否成功
		
		PreparedStatement psmt = null;
		String sSql = "update StoreHouse set num=? where UserNo=? and serviceNo=? and productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, String.valueOf(tili));
			psmt.setString(2, userNo);
			psmt.setString(3, serviceNo);
			psmt.setString(4, "P3");
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
