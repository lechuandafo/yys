package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBEUnionInfo;
import connDB.connyysDB;

public class daoBEUnionInfo {
	connyysDB connDB=new connyysDB();
	public boolean insUnion_Info(voBEUnionInfo Union_Info)//增加主角
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into Union_Info values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Union_Info.getUnionNo().trim());
			psmt.setString(2, Union_Info.getUnionName().trim());
			psmt.setString(3, String.valueOf(Union_Info.getCreateTime()).trim());
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
	
	
	

	public boolean delUnion_Info(voBEUnionInfo Union_Info)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from Union_Info where Union_InfoNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Union_Info.getUnionNo());
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

 
	public ArrayList qryUnion_Info()
	{
		ArrayList Union_InfoList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Union_Info order by Union_InfoNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBEUnionInfo Union_InfovoAll=new voBEUnionInfo();
				Union_InfovoAll.setUnionNo(rs.getString("UnionNo"));
				Union_InfovoAll.setUnionName(rs.getString("UnionName"));
				Union_InfovoAll.setCreateTime(rs.getDate("Union_InfoCreateAttack"));
				Union_InfoList.add(Union_InfovoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return Union_InfoList;		
	}
}
