package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDLeaveMessage;
import connDB.connyysDB;

public class daoBDLeaveMessage {
	connyysDB connDB=new connyysDB();
	public boolean insLeaveMessage(voBDLeaveMessage LeaveMessage)
	{
		boolean flag = false;           	
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
	
	
	

	public boolean delLeaveMessage(voBDLeaveMessage LeaveMessage)
	{
		boolean flag = false;              
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
			  //ʵ��vo
				voBDLeaveMessage LeaveMessagevoAll=new voBDLeaveMessage();
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
