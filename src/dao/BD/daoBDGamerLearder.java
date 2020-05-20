package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.*;
import connDB.connyysDB;
import vo.BE.*;
import vo.OD.*;


public class daoBDGamerLearder {
	connyysDB connDB=new connyysDB();
	
	public boolean insGamerLearder(voBDGamerLearder GamerLearder)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into GamerLeader values(?,?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerLearder.getUserNo().trim());
			psmt.setString(2, GamerLearder.getServiceNo().trim());
			psmt.setString(3, GamerLearder.getLeaderNo().trim());
			psmt.setString(4, String.valueOf(GamerLearder.getLeaderLevel()).trim());
			psmt.setString(5, String.valueOf(GamerLearder.getLeaderEXP()).trim());
			psmt.setString(6, GamerLearder.getSkillNo1().trim());
			psmt.setString(7, GamerLearder.getSkillNo2().trim());
			psmt.setString(8, GamerLearder.getSkillNo3().trim());
			
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
	
	public boolean insGamerLearderF(voBDGamerLearder GamerLearder)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into GamerLeader (userNo,serviceNo,LeaderNo,leaderLevel,leaderEXP) values(?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerLearder.getUserNo().trim());
			psmt.setString(2, GamerLearder.getServiceNo().trim());
			psmt.setString(3, GamerLearder.getLeaderNo().trim());
			psmt.setString(4, String.valueOf(GamerLearder.getLeaderLevel()).trim());
			psmt.setString(5, String.valueOf(GamerLearder.getLeaderEXP()).trim());
			
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
	public boolean delGamerLearder(voBDGamerLearder GamerLearder)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from GamerLearder where userNo=? and serviceNo=? and leaderNo=? ";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerLearder.getUserNo());
			psmt.setString(2, GamerLearder.getServiceNo());
			psmt.setString(3, GamerLearder.getLeaderNo());
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
	public ArrayList qryGamerLeader(String userNo,String serviceNo)
	{
		ArrayList GamerLearderList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerLeader a,Leader b where a.leaderNo = b.leaderNo and a.userNo = "+userNo+"and a.serviceNo = "+serviceNo;		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerLearder GamerLeardervoAll=new voBDGamerLearder();
				GamerLeardervoAll.setUserNo(rs.getString("userNo"));
				GamerLeardervoAll.setServiceNo(rs.getString("serviceNo"));
				GamerLeardervoAll.setLeaderNo(rs.getString("leaderNo"));
				GamerLeardervoAll.setLeaderLevel(rs.getInt("leaderLevel"));
				GamerLeardervoAll.setLeaderEXP(rs.getInt("leaderEXP"));
				GamerLeardervoAll.setSkillNo1(rs.getString("skillNo1"));
				GamerLeardervoAll.setSkillNo2(rs.getString("skillNo2"));
				GamerLeardervoAll.setSkillNo3(rs.getString("skillNo3"));
				
				GamerLearderList.add(GamerLeardervoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerLearderList;		
	}	
	public ArrayList qryGamerLearder()
	{
		ArrayList GamerLearderList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerLearder order by userNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerLearder GamerLeardervoAll=new voBDGamerLearder();
				GamerLeardervoAll.setUserNo(rs.getString("userNo"));
				GamerLeardervoAll.setServiceNo(rs.getString("serviceNo"));
				GamerLeardervoAll.setLeaderNo(rs.getString("leaderNo"));
				GamerLeardervoAll.setLeaderLevel(rs.getInt("leaderLevel"));
				GamerLeardervoAll.setLeaderEXP(rs.getInt("leaderEXP"));
				GamerLeardervoAll.setSkillNo1(rs.getString("skillNo1"));
				GamerLeardervoAll.setSkillNo2(rs.getString("skillNo2"));
				GamerLeardervoAll.setSkillNo3(rs.getString("skillNo3"));
				
				GamerLearderList.add(GamerLeardervoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerLearderList;		
	}
	
	public ArrayList qryGamerLearderM(String userNo,String serviceNo)
	{
		ArrayList GamerLearderList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select a.*,b.* from GamerLeader a,Leader b where a.leaderNo=b.leaderNo and userNo = ? and serviceNo = ? order by userNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,userNo);
			psmt.setString(2,serviceNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voODLeaderList GamerLearderAll=new voODLeaderList();
				GamerLearderAll.setUserNo(rs.getString("userNo"));
				GamerLearderAll.setServiceNo(rs.getString("serviceNo"));
				GamerLearderAll.setLeaderNo(rs.getString("leaderNo"));
				GamerLearderAll.setLeaderLevel(rs.getInt("leaderLevel"));
				GamerLearderAll.setLeaderEXP(rs.getInt("leaderEXP"));
				GamerLearderAll.setSkillNo1(rs.getString("skillNo1"));
				GamerLearderAll.setSkillNo2(rs.getString("skillNo2"));
				GamerLearderAll.setSkillNo3(rs.getString("skillNo3"));
				GamerLearderAll.setLeaderName(rs.getString("leaderName"));
				GamerLearderAll.setLeaderURL(rs.getString("leaderURL"));
				GamerLearderAll.setLeaderCreateAttack(rs.getInt("leaderCreateAttack"));
				GamerLearderAll.setLeaderDevelopAttack(rs.getInt("leaderDevelopAttack"));
				GamerLearderAll.setLeaderCreateLife(rs.getInt("leaderCreateLife"));
				GamerLearderAll.setLeaderDevelopLife(rs.getInt("leaderDevelopLife"));
				GamerLearderAll.setLeaderCreateDefence(rs.getInt("leaderCreateDefence"));
				GamerLearderAll.setLeaderDevelopDefence(rs.getInt("leaderDevelopDefence"));
				GamerLearderAll.setLeaderCreateSpeed(rs.getInt("leaderCreateSpeed"));
				GamerLearderAll.setLeaderCreateCrit(rs.getDouble("leaderCreateCrit"));
				GamerLearderAll.setLeaderCreateCriticalDamage(rs.getDouble("leaderCreateCriticalDamage"));
				GamerLearderAll.setBiography(rs.getString("biography"));
				
				GamerLearderList.add(GamerLearderAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{ 
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerLearderList;		
	}
	public ArrayList qryGamerLeaderS(String userNo,String serviceNo, String LeaderNo)
	{
		ArrayList GamerLearderList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerLeader a,Leader b where a.leaderNo = b.leaderNo and a.userNo = "+userNo+"and a.serviceNo = "+serviceNo+" and a.LeaderNo="+LeaderNo ; 		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerLearder GamerLeardervoAll=new voBDGamerLearder();
				GamerLeardervoAll.setUserNo(rs.getString("userNo"));
				GamerLeardervoAll.setServiceNo(rs.getString("serviceNo"));
				GamerLeardervoAll.setLeaderNo(rs.getString("leaderNo"));
				GamerLeardervoAll.setLeaderLevel(rs.getInt("leaderLevel"));
				GamerLeardervoAll.setLeaderEXP(rs.getInt("leaderEXP"));
				GamerLeardervoAll.setSkillNo1(rs.getString("skillNo1"));
				GamerLeardervoAll.setSkillNo2(rs.getString("skillNo2"));
				GamerLeardervoAll.setSkillNo3(rs.getString("skillNo3"));
				
				GamerLearderList.add(GamerLeardervoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerLearderList;		
	}	
}
