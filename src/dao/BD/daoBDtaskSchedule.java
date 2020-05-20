package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vo.BD.voBDtaskSchedule;
import connDB.connyysDB;

public class daoBDtaskSchedule {
	connyysDB connDB=new connyysDB();
	
	public boolean instaskSchedule(voBDtaskSchedule taskSchedule)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into taskSchedule values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, taskSchedule.getUserNo().trim());
			psmt.setString(2, taskSchedule.getServiceNo().trim());
			psmt.setString(3, taskSchedule.getTaskNo().trim());
			psmt.setString(4, taskSchedule.getTaskCount().trim());
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
	
	public boolean upttaskSchedule(voBDtaskSchedule taskSchedule)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  taskSchedule set userNo=?,serviceNo=?,TaskNo=?,TaskCount=?";
		sSql = sSql + " where userNo=?,serviceNo=?,TaskNo=? ";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, taskSchedule.getUserNo().trim());
			psmt.setString(2, taskSchedule.getServiceNo().trim());
			psmt.setString(3, taskSchedule.getTaskNo().trim());
			psmt.setString(4, taskSchedule.getTaskCount().trim());
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
	public boolean deltaskSchedule(voBDtaskSchedule taskSchedule)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from taskSchedule where userNo=?,serviceNo=?,TaskNo=? ";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, taskSchedule.getUserNo().trim());
			psmt.setString(2, taskSchedule.getServiceNo().trim());
			psmt.setString(3, taskSchedule.getTaskNo().trim());
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
	public ArrayList qrytaskSchedule()
	{
		ArrayList taskScheduleList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from taskSchedule order by userNo,serviceNo,taskNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDtaskSchedule votaskScheduleAll=new voBDtaskSchedule();
				votaskScheduleAll.setUserNo(rs.getString("userNo"));
				votaskScheduleAll.setServiceNo(rs.getString("serviceNo"));
				votaskScheduleAll.setTaskNo(rs.getString("taskNo"));
				votaskScheduleAll.setTaskCount(rs.getString("taskCount"));
				taskScheduleList.add(votaskScheduleAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return taskScheduleList;		
	}	
	
}
