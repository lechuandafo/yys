package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDMessage;
import connDB.connyysDB;

public class daoBDMessage {
	connyysDB connDB=new connyysDB();
	public boolean insMessage(voBDMessage Message)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Message values(?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Message.getMessageNo().trim());
			psmt.setString(2, Message.getUserNo1().trim());
			psmt.setString(3, Message.getUserNo2().trim());
			psmt.setString(4, String.valueOf(Message.getMessageDate()).trim());
			psmt.setString(5, Message.getMessageContent().trim());
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
	
	
	

	public boolean delMessage(voBDMessage Message)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Message where MessageNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Message.getMessageNo());
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

 
	public ArrayList qryMessage()
	{
		ArrayList MessageList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Message order by MessageNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDMessage MessagevoAll=new voBDMessage();
				MessagevoAll.setMessageNo(rs.getString("MessageNo"));
				MessagevoAll.setUserNo1(rs.getString("UserNo1"));
				MessagevoAll.setUserNo2(rs.getString("UserNo2"));
				MessagevoAll.setMessageDate(rs.getDate("MessageDate"));
				MessagevoAll.setMessageContent(rs.getString("MessageContent"));
				MessageList.add(MessagevoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return MessageList;		
	}
}
