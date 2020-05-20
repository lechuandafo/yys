package dao.OD;

import java.sql.*;
import java.util.ArrayList;


import vo.OD.voODUserInfo;
import connDB.connyysDB;

public class daoODUserInfo {
	connyysDB connDB=new connyysDB();
	public boolean insUserInfo(voODUserInfo UserInfo)
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into UserInfo values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, UserInfo.getUserNo().trim());
			psmt.setString(2, UserInfo.getAccount().trim());
			psmt.setString(3, UserInfo.getPassword().trim());
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
	
	
	public String getAuto_No1(String tableName)
	{
		CallableStatement cstmt = null;
		String sAutoNo = null;
		String sSql = "{call AUTO_No1(?,?)}";
		try {
			cstmt = connDB.getConn().prepareCall(sSql);
			cstmt.setString(1, tableName);
			cstmt.registerOutParameter(2,oracle.jdbc.OracleTypes.VARCHAR); 
			cstmt.executeUpdate();
			sAutoNo = cstmt.getString(2);	
			System.out.println(sAutoNo);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			
		}
		return sAutoNo;
	}
	

	public boolean delUserInfo(voODUserInfo UserInfo)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from UserInfo where UserInfoNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, UserInfo.getUserNo());
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

 
	public ArrayList qryUserInfo()
	{
		ArrayList UserInfoList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from UserInfo order by UserInfoNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voODUserInfo UserInfovoAll=new voODUserInfo();
				UserInfovoAll.setUserNo(rs.getString("UserNo"));
				UserInfovoAll.setAccount(rs.getString("Account"));
				UserInfovoAll.setPassword(rs.getString("Password"));
				UserInfoList.add(UserInfovoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return UserInfoList;		
	}
	public ArrayList qryUser(String account)
	{
		ArrayList UserInfoList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		
		String sSql = "select * from UserInfo where account = '"+account+"'";	
		//System.out.println(sSql);
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voODUserInfo UserInfovoAll=new voODUserInfo();
				UserInfovoAll.setUserNo(rs.getString("UserNo"));
				UserInfovoAll.setAccount(rs.getString("Account"));
				UserInfovoAll.setPassword(rs.getString("Password"));
				UserInfoList.add(UserInfovoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return UserInfoList;		
	}
}
