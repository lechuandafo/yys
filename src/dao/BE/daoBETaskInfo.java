package dao.BE;

import java.sql.*;
import java.util.*;

import vo.BE.voBETaskInfo;
import connDB.connyysDB;

public class daoBETaskInfo {
	connyysDB connDB=new connyysDB();
	public boolean insTaskInfo(voBETaskInfo TaskInfo)//������Ʒ
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into TaskInfo values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, TaskInfo.getTaskNo().trim());
			psmt.setString(2, TaskInfo.getTaskName().trim());
			psmt.setString(3, TaskInfo.getTaskDescription().trim());
			psmt.setString(4, String.valueOf(TaskInfo.getQuate()).trim());
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
	
	
	
	//ɾ����
	public boolean delTaskInfo(voBETaskInfo TaskInfo)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from TaskInfo where taskNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, TaskInfo.getTaskNo());
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

	//��ѯ��
	public ArrayList qryTaskInfo()
	{
		ArrayList TaskInfoList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from TaskInfo order by taskNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBETaskInfo TaskInfovoAll=new voBETaskInfo();
				TaskInfovoAll.setTaskNo(rs.getString("taskNo"));
				TaskInfovoAll.setTaskName(rs.getString("taskName"));
				TaskInfovoAll.setTaskDescription(rs.getString("taskDescription"));
				TaskInfovoAll.setQuate(rs.getInt("quate"));
				TaskInfoList.add(TaskInfovoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return TaskInfoList;		
	}	
}
