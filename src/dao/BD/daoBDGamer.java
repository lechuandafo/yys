package dao.BD;

import java.sql.*;
import java.util.*;

import vo.BD.voBDGamer;
import connDB.connyysDB;

public class daoBDGamer {
	connyysDB connDB=new connyysDB();
	
	public boolean insGamer(voBDGamer Gamer)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Gamer values(?,?,?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Gamer.getUserNo().trim());
			psmt.setString(2, Gamer.getServiceNo().trim());
			psmt.setString(3, Gamer.getGamerName().trim());
			psmt.setString(4, String.valueOf(Gamer.getRegistTime()).trim());
			psmt.setString(5, Gamer.getImageURL().trim());
			psmt.setString(6, Gamer.getUnionNo().trim());
			psmt.setString(7, Gamer.getUnionJob().trim());
			psmt.setString(8, String.valueOf(Gamer.getPvpGrade()).trim());
			psmt.setString(9, String.valueOf(Gamer.getStatus()).trim());
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
	
	public boolean insGamerFirst(voBDGamer Gamer)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Gamer (UserNo,ServiceNo,GamerName,ImageURL,PvpGrade,Status) values(?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Gamer.getUserNo().trim());
			psmt.setString(2, Gamer.getServiceNo().trim());
			psmt.setString(3, Gamer.getGamerName().trim());
			//psmt.setString(4, String.valueOf(Gamer.getRegistTime()).trim());
			psmt.setString(4, Gamer.getImageURL().trim());
			psmt.setString(5, String.valueOf(Gamer.getPvpGrade()).trim());
			psmt.setString(6, String.valueOf(Gamer.getStatus()).trim());
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
	public boolean delGamer(voBDGamer Gamer)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Gamer where UserNo=? and serviceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Gamer.getUserNo());
			psmt.setString(2, Gamer.getServiceNo());
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
	public ArrayList qryGamer()
	{
		ArrayList GamerList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Gamer order by UserNo,ServiceNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamer GamervoAll=new voBDGamer();
				GamervoAll.setUserNo(rs.getString("UserNo"));
				GamervoAll.setServiceNo(rs.getString("ServiceNo"));
				GamervoAll.setGamerName(rs.getString("GamerName"));
				GamervoAll.setRegistTime(rs.getDate("RegistTime"));
				GamervoAll.setImageURL(rs.getString("imageURL"));
				GamervoAll.setUnionNo(rs.getString("unionNo"));
				GamervoAll.setUnionJob(rs.getString("unionJob"));
				GamervoAll.setPvpGrade(rs.getInt("pvpGrade"));
				GamervoAll.setStatus(rs.getInt("status"));
				GamerList.add(GamervoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerList;		
	}	

public ArrayList qryGamerService(String userNo,String serviceNo)
	{
		ArrayList GamerList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Gamer where userNo = ? and serviceNo = ?";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,userNo);
			psmt.setString(2,serviceNo);
			System.out.println(userNo+serviceNo);
			rs  = psmt.executeQuery();
			while (rs.next())
			{
			  //实例化vo
				//System.out.println(rs.getString("GamerName"));
				voBDGamer GamervoAll=new voBDGamer();
				GamervoAll.setUserNo(rs.getString("UserNo"));
				GamervoAll.setServiceNo(rs.getString("ServiceNo"));
				GamervoAll.setGamerName(rs.getString("GamerName"));
				GamervoAll.setRegistTime(rs.getDate("RegistTime"));
				GamervoAll.setImageURL(rs.getString("imageURL"));
				GamervoAll.setUnionNo(rs.getString("unionNo"));
				GamervoAll.setUnionJob(rs.getString("unionJob"));
				GamervoAll.setPvpGrade(rs.getInt("pvpGrade"));
				GamervoAll.setStatus(rs.getInt("status"));
				System.out.println(rs.getString("GamerName")+"1");
				GamerList.add(GamervoAll);
				voBDGamer vo = (voBDGamer) GamerList.get(0);
				//System.out.println(vo.getGamerName()+vo.getUserNo()+vo.getServiceNo()+vo.getImageURL());
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		
		return GamerList;		
	}

	//搜索区
	public ArrayList searchGamer(int choice, String keyword)
	{
		ArrayList GamerList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String[] attr = {"UserNo", "ServiceNo", "GamerName", "RegistTime"};
		String sSql = "select * from Gamer where "+ attr[choice-1] + " like ?";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, "%"+keyword+"%");
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamer GamervoAll=new voBDGamer();
				GamervoAll.setUserNo(rs.getString("UserNo"));
				GamervoAll.setServiceNo(rs.getString("ServiceNo"));
				GamervoAll.setGamerName(rs.getString("GamerName"));
				GamervoAll.setRegistTime(rs.getDate("RegistTime"));
				GamervoAll.setImageURL(rs.getString("imageURL"));
				GamervoAll.setUnionNo(rs.getString("unionNo"));
				GamervoAll.setUnionJob(rs.getString("unionJob"));
				GamervoAll.setPvpGrade(rs.getInt("pvpGrade"));
				GamervoAll.setStatus(rs.getInt("status"));
				GamerList.add(GamervoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerList;		
	}
	
	public boolean uptGamerup(String userNo,String serviceNo)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "Update Gamer set status=1 where UserNo=? and serviceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
		
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
	
	public boolean uptGamerdown(String userNo,String serviceNo)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "Update Gamer set status=0 where UserNo=? and serviceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
		
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
