package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vo.BD.voBDInstancePrize;
import connDB.connyysDB;

public class daoBDInstancePrize {
	connyysDB connDB=new connyysDB();
	
	public boolean insInstancePrize(voBDInstancePrize InstancePrize)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into InstancePrize values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, InstancePrize.getInstanceNo().trim());
			psmt.setString(2, InstancePrize.getPrizeNo().trim());
			psmt.setString(3, String.valueOf(InstancePrize.getPrizeQuantity()).trim());
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
	
	public boolean uptInstancePrize(voBDInstancePrize InstancePrize)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  InstancePrize set instanceNo=?,prizeNo=?,prizeQuantity=?";
		sSql = sSql + " where instanceNo=?,prizeNo=? ";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, InstancePrize.getInstanceNo().trim());
			psmt.setString(2, InstancePrize.getPrizeNo().trim());
			psmt.setString(3, String.valueOf(InstancePrize.getPrizeQuantity()).trim());
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
	public boolean delInstancePrize(voBDInstancePrize InstancePrize)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from InstancePrize where instanceNo=?,prizeNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,InstancePrize.getInstanceNo());
			psmt.setString(2,InstancePrize.getPrizeNo());
			psmt.setString(3,String.valueOf(InstancePrize.getPrizeQuantity()).trim());
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
	public ArrayList qryInstancePrize()
	{
		ArrayList InstancePrizeList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from InstancePrize order by instanceNo,prizeNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDInstancePrize voInstancePrizeAll=new voBDInstancePrize();
				voInstancePrizeAll.setInstanceNo(rs.getString("instanceNo"));
				voInstancePrizeAll.setPrizeNo(rs.getString("prizeNo"));
				voInstancePrizeAll.setPrizeQuantity(rs.getInt("prizeQuantity"));
				InstancePrizeList.add(voInstancePrizeAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return InstancePrizeList;		
	}	
	
}

