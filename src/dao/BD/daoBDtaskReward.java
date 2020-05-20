package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vo.BD.voBDtaskReward;
import connDB.connyysDB;


public class daoBDtaskReward {
	connyysDB connDB=new connyysDB();
	
	public boolean instaskReward(voBDtaskReward taskReward)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into taskReward values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, taskReward.getTaskNo().trim());
			psmt.setString(2, taskReward.getProductNo().trim());
			psmt.setString(3, String.valueOf(taskReward.getQuantity()).trim());
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
	
	public boolean upttaskReward(voBDtaskReward taskReward)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  taskReward set taskNo=?,productNo=?,quantity=?";
		sSql = sSql + " where taskNo=?,productNo=?";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, taskReward.getTaskNo().trim());
			psmt.setString(2, taskReward.getProductNo().trim());
			psmt.setString(3, String.valueOf(taskReward.getQuantity()).trim());
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
	public boolean deltaskReward(voBDtaskReward taskReward)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from taskReward where taskNo=?,productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, taskReward.getTaskNo().trim());
			psmt.setString(2, taskReward.getProductNo().trim());
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
	public ArrayList qrytaskReward()
	{
		ArrayList taskRewardList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from taskReward order by taskNo,productiNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDtaskReward votaskRewardAll=new voBDtaskReward();
				votaskRewardAll.setTaskNo(rs.getString("taskNo"));
				votaskRewardAll.setProductNo(rs.getString("productNo"));
				votaskRewardAll.setQuantity(rs.getInt("quantity"));
				taskRewardList.add(votaskRewardAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return taskRewardList;		
	}	
	
}