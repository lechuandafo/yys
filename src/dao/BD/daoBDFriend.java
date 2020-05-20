package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDFriend;
import connDB.connyysDB;

public class daoBDFriend {
	connyysDB connDB=new connyysDB();
	public boolean insFriend(voBDFriend Friend)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Friend values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Friend.getServiceNo().trim());
			psmt.setString(2, Friend.getUserNo1().trim());
			psmt.setString(3, Friend.getUserNo2().trim()); 
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
	
	
	

	public boolean delFriend(voBDFriend Friend)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Friend where UserNo1=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Friend.getUserNo1());
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

 
	public ArrayList qryFriend()
	{
		ArrayList FriendList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Friend order by UserNo1";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDFriend FriendvoAll=new voBDFriend();
				FriendvoAll.setServiceNo(rs.getString("ServiceNo"));
				FriendvoAll.setUserNo1(rs.getString("UserNo1"));
				FriendvoAll.setUserNo2(rs.getString("UserNo2"));
				FriendList.add(FriendvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return FriendList;		
	}
}
