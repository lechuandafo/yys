package dao.BD;

import java.sql.*;
import java.util.*;

import vo.BD.voBDBuyCommodity;
import connDB.connyysDB;

public class daoBDBuyCommodity {
	connyysDB connDB=new connyysDB();
	
	public boolean insBuyCommodity(voBDBuyCommodity BuyCommodity)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into BuyCommodity values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, BuyCommodity.getUserNo().trim());
			psmt.setString(2, BuyCommodity.getServiceNo().trim());
			psmt.setString(3, BuyCommodity.getCommodityNo().trim());
			psmt.setString(4, String.valueOf(BuyCommodity.getCcount()).trim());
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
	public boolean delBuyCommodity(voBDBuyCommodity BuyCommodity)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from BuyCommodity where UserNo=? and serviceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, BuyCommodity.getUserNo());
			psmt.setString(2, BuyCommodity.getServiceNo());
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
	public ArrayList qryBuyCommodity()
	{
		ArrayList BuyCommodityList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from BuyCommodity order by UserNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDBuyCommodity BuyCommodityvoAll=new voBDBuyCommodity();
				BuyCommodityvoAll.setUserNo(rs.getString("UserNo"));
				BuyCommodityvoAll.setServiceNo(rs.getString("ServiceNo"));
				BuyCommodityvoAll.setCommodityNo(rs.getString("CommodityNo"));
				BuyCommodityvoAll.setCcount(rs.getInt("Ccount"));
				BuyCommodityList.add(BuyCommodityvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return BuyCommodityList;		
	}	
}
