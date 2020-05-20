package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connDB.connyysDB;

import vo.BD.voBDGamerFriend;

public class daoBDGamerFriend {
	connyysDB connDB=new connyysDB();
	
	public ArrayList qryGamerFriend()
	{
		ArrayList GamerFriendList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select a.*,b.*,c.* from Gamer a,Friend b,GamerLearder c where a.serviseNo=b.serviseNo and b.userNo=c.userNo and b.serviceNo=c.serviceNo and a.userNo=b.userNo2 order by UserNo,UserNo1,UserNo2";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerFriend GamerFriendAll=new voBDGamerFriend();
				GamerFriendAll.setUserNo(rs.getString("UserNo"));
				GamerFriendAll.setServiceNo(rs.getString("ServiceNo"));
				GamerFriendAll.setGamerName(rs.getString("GamerName"));
				GamerFriendAll.setRegistTime(rs.getDate("RegistTime"));
				GamerFriendAll.setUserNo(rs.getString("imageURL"));
				GamerFriendAll.setServiceNo(rs.getString("unionNo"));
				GamerFriendAll.setGamerName(rs.getString("unionJob"));
				GamerFriendAll.setPvpGrade(rs.getInt("pvpGrade"));
				GamerFriendAll.setOnline(rs.getInt("online"));
				GamerFriendAll.setUserNo1(rs.getString("UserNo1"));
				GamerFriendAll.setUserNo2(rs.getString("UserNo2"));
				psmt.setString(4, String.valueOf(GamerFriendAll.getLeaderLevel()).trim());
				GamerFriendList.add(GamerFriendAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerFriendList;		
	}	
}
