package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBEInstance;
import connDB.connyysDB;

public class daoBEInstance {
connyysDB connDB=new connyysDB();
	
	public boolean insInstance(voBEInstance Instance)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Instance values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Instance.getInstanceNo().trim());
			psmt.setString(2, Instance.getInstanceName().trim());
			psmt.setString(3, Instance.getMapNo().trim());
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
	
	
	
	//删除区
	public boolean delInstance(voBEInstance Instance)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Instance where instanceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Instance.getInstanceNo());
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

	//查询区
	public ArrayList qryInstance()
	{
		ArrayList InstanceList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Instance order by instanceNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBEInstance InstancevoAll=new voBEInstance();
				InstancevoAll.setInstanceNo(rs.getString("InstanceNo"));
				InstancevoAll.setInstanceName(rs.getString("InstanceName"));
				InstancevoAll.setInstanceName(rs.getString("InstancePassword"));
				InstanceList.add(InstancevoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return InstanceList;		
	}	
}
