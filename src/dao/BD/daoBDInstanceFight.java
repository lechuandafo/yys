package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import connDB.connyysDB;
import vo.BD.voBDInstanceFight;
public class daoBDInstanceFight {
	connyysDB connDB=new connyysDB();
	
	public boolean insInstanceFight(voBDInstanceFight InstanceFight)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into InstanceFight values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, InstanceFight.getInstanceNo().trim());
			psmt.setString(2, String.valueOf(InstanceFight.getRoundTime()).trim());
			psmt.setString(3, InstanceFight.getSGroupNo().trim());
			psmt.setString(4, InstanceFight.getMapNo().trim());
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
	
	public boolean uptInstanceFight(voBDInstanceFight InstanceFight)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  InstanceFight set instanceNo=?,roundtime=?,SGroupNo=?,mapNo=?";
		sSql = sSql + " where instanceNo=?,roundtime=?,SGroupNo=?,mapNo=? ";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, InstanceFight.getInstanceNo().trim());
			psmt.setString(2, String.valueOf(InstanceFight.getRoundTime()).trim());
			psmt.setString(3, InstanceFight.getSGroupNo().trim());
			psmt.setString(4, InstanceFight.getMapNo().trim());
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
	
	//删除会员等级表
	public boolean delInstanceFight(voBDInstanceFight InstanceFight)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from InstanceFight where instanceNo=?,roundtime=?,SGroupNo=?,mapNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, InstanceFight.getInstanceNo().trim());
			psmt.setString(2, String.valueOf(InstanceFight.getRoundTime()).trim());
			psmt.setString(3, InstanceFight.getSGroupNo().trim());
			psmt.setString(4, InstanceFight.getMapNo().trim());
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

	//查询岗位表 
	public ArrayList qryInstanceFight()
	{
		ArrayList InstanceFightList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from InstanceFight order by instanceNo,roundtime,SGroupNo,mapNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDInstanceFight voInstanceFightAll=new voBDInstanceFight();
				voInstanceFightAll.setInstanceNo(rs.getString("instanceNo"));
				voInstanceFightAll.setRoundTime(rs.getInt("roundTime"));
				voInstanceFightAll.setSGroupNo(rs.getString("SGroupNo"));
				voInstanceFightAll.setMapNo(rs.getString("mapNo"));
				InstanceFightList.add(voInstanceFightAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return InstanceFightList;		
	}


}
