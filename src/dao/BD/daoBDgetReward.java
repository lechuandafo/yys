package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import connDB.connyysDB;
import vo.BD.voBDgetReward;

public class daoBDgetReward {
	connyysDB connDB=new connyysDB();
	
	public boolean insgetReward(voBDgetReward getReward)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into getReward values(?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, getReward.getUserNo().trim());
			psmt.setString(2, getReward.getServiceNo().trim());
			psmt.setString(3, getReward.getTaskNo().trim());
			psmt.setString(4, getReward.getProductNo().trim());
			psmt.setString(5, getReward.getRcount().trim());
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
	
	public boolean uptgetReward(voBDgetReward getReward)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  getReward set userNo=?,serviceNo=?,taskNo=?,productNo=?,rcount=?";
		sSql = sSql + " where userNo=?,serviceNo=?,taskNo=?,productNo=? ";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, getReward.getUserNo().trim());
			psmt.setString(2, getReward.getServiceNo().trim());
			psmt.setString(3, getReward.getTaskNo().trim());
			psmt.setString(4, getReward.getProductNo().trim());
			psmt.setString(5, getReward.getRcount().trim());
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
	public boolean delgetReward(voBDgetReward getReward)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from getReward where userNo=?,serviceNo=?,taskNo=?,productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, getReward.getUserNo().trim());
			psmt.setString(2, getReward.getServiceNo().trim());
			psmt.setString(3, getReward.getTaskNo().trim());
			psmt.setString(4, getReward.getProductNo().trim());
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
	public ArrayList qrybuyMitama()
	{
		ArrayList getRewardList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from getReward order by userNo,serviceNo,taskNo,productNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDgetReward vogetRewardAll=new voBDgetReward();
				vogetRewardAll.setUserNo(rs.getString("userNo"));
				vogetRewardAll.setServiceNo(rs.getString("serviceNo"));
				vogetRewardAll.setTaskNo(rs.getString("taskNo"));
				vogetRewardAll.setProductNo(rs.getString("productNo"));
				vogetRewardAll.setRcount(rs.getString("rcount"));
				getRewardList.add(vogetRewardAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return getRewardList;		
	}	
}