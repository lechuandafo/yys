package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDGamerSkill;
import connDB.connyysDB;

public class daoBDGamerSkill {
	connyysDB connDB=new connyysDB();
	public boolean insGamerSkill(voBDGamerSkill GamerSkill)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into GamerSkill values(?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerSkill.getUserNo().trim());
			psmt.setString(2, GamerSkill.getServiceNo().trim());
			psmt.setString(3, GamerSkill.getSkillNo().trim());
			psmt.setString(4, String.valueOf(GamerSkill.getSkillLevel()).trim());
			psmt.setString(5, GamerSkill.getBelongToLeader().trim());
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
	
	
	

	public boolean delGamerSkill(voBDGamerSkill GamerSkill)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from GamerSkill where UserNo=? and serviceNo=? and skillNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerSkill.getUserNo());
			psmt.setString(2, GamerSkill.getServiceNo());
			psmt.setString(3, GamerSkill.getSkillNo());
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

 
	public ArrayList qryGamerSkill()
	{
		ArrayList GamerSkillList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerSkill order by UserNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerSkill GamerSkillvoAll=new voBDGamerSkill();
				GamerSkillvoAll.setUserNo(rs.getString("UserNo"));
				GamerSkillvoAll.setServiceNo(rs.getString("ServiceNo"));
				GamerSkillvoAll.setSkillNo(rs.getString("skillNo"));
				GamerSkillvoAll.setSkillLevel(rs.getInt("skillLevel"));
				GamerSkillvoAll.setBelongToLeader(rs.getString("belongToLeader"));
				GamerSkillList.add(GamerSkillvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerSkillList;		
	}
}
