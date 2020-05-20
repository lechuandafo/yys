package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBELeaveMessage;
import connDB.connyysDB;

public class daoBELeaveMessage {
	connyysDB connDB=new connyysDB();
	public boolean insLeaveMessage(voBELeaveMessage LeaveMessage)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into LeaveMessage values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, LeaveMessage.getLeaveMessageNo().trim());
			psmt.setString(2, LeaveMessage.getUserNo().trim());
			psmt.setString(3, String.valueOf(LeaveMessage.getLeaveMessageDate()).trim());
			psmt.setString(4, LeaveMessage.getLeaveMessageContent().trim()); 
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
	
	
	

	public boolean delLeaveMessage(voBELeaveMessage LeaveMessage)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from LeaveMessage where LeaveMessageNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, LeaveMessage.getLeaveMessageNo());
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

	//查询主角 
	public ArrayList qryLeaveMessage()
	{
		ArrayList LeaveMessageList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from LeaveMessage order by LeaveMessageNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBELeaveMessage LeaveMessagevoAll=new voBELeaveMessage();
				LeaveMessagevoAll.setLeaveMessageNo(rs.getString("LeaveMessageNo"));
				LeaveMessagevoAll.setUserNo(rs.getString("UserNo"));
				LeaveMessagevoAll.setLeaveMessageDate(rs.getDate("LeaveMessageDate"));
				LeaveMessagevoAll.setLeaveMessageContent(rs.getString("LeaveMessageContent"));
				LeaveMessageList.add(LeaveMessagevoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return LeaveMessageList;		
	}
}
