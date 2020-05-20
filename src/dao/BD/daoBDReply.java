package dao.BD;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDReply;
import connDB.connyysDB;

public class daoBDReply {
	connyysDB connDB=new connyysDB();
	public boolean insReply(voBDReply Reply)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Reply values(?,?,?,?,?)";
		//"insert into Reply(REPLYNO,LEAVEMESSAGENO,ADMINISTRATORNO,REPLYCONTENT) values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Reply.getReplyNo().trim());
			psmt.setString(2, Reply.getLeaveMessageNo().trim());
//System.out.println("daoBDReply.java: LeaveMessageNo="+Reply.getLeaveMessageNo().trim());
			psmt.setString(3, Reply.getAdministratorNo().trim());
			//Date date = new Date();
			psmt.setDate(4, new Date(new java.util.Date().getTime())); 
			psmt.setString(5, Reply.getReplyContent().trim());
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
	
	
	

	public boolean delReply(voBDReply Reply)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Reply where ReplyNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Reply.getReplyNo());
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
	
	public String getReplyNo()
	{
		int cnt = 0;
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select count(*) from Reply";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs = psmt.executeQuery();	
			rs.next();
			cnt = rs.getInt("count(*)");		
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		
		String replyNo = String.valueOf(cnt);
		int len = replyNo.length();
		for(int i=0; i<9-len; i++)
			replyNo = "0" + replyNo;
		replyNo = "Y" + replyNo;
		return replyNo;
	}
 
	public ArrayList qryReplyByLeaveMessageNo(String leaveMessageNo)
	{
		ArrayList ReplyList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Reply where LEAVEMESSAGENO = ?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, leaveMessageNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDReply ReplyvoAll=new voBDReply();
				ReplyvoAll.setReplyNo(rs.getString("ReplyNo"));
				ReplyvoAll.setLeaveMessageNo(rs.getString("LeaveMessageNo"));
				ReplyvoAll.setAdministratorNo(rs.getString("AdministratorNo"));
				ReplyvoAll.setReplyDate(rs.getDate("ReplyDate"));
				ReplyvoAll.setReplyContent(rs.getString("ReplyContent"));
				ReplyList.add(ReplyvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return ReplyList;		
	}
}
