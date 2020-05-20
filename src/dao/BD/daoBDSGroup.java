package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vo.BD.voBDSGroup;
import connDB.connyysDB;

public class daoBDSGroup {
	connyysDB connDB=new connyysDB();
	
	public boolean insSGroup(voBDSGroup SGroup)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into SGroup values(?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, SGroup.getSGroupNo().trim());
			psmt.setString(2, SGroup.getShikigamiNo1().trim());
			psmt.setString(3, String.valueOf(SGroup.getSlevel1()).trim());
			psmt.setString(4, SGroup.getShikigamiNo2().trim());
			psmt.setString(5, String.valueOf(SGroup.getSlevel2()).trim());
			psmt.setString(6, SGroup.getShikigamiNo3().trim());
			psmt.setString(7, String.valueOf(SGroup.getSlevel3()).trim());
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
	
	public boolean uptSGroup(voBDSGroup SGroup)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  SGroup set SGroupNo=?,shikigamiNo1=?,shikigamiNo2=?,shikigamiNo3=?,slevel=?";
		sSql = sSql + " where SGroupNo=?,shikigamiNo1=?,shikigamiNo2=?,shikigamiNo3=?";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, SGroup.getSGroupNo().trim());
			psmt.setString(2, SGroup.getShikigamiNo1().trim());
			psmt.setString(3, String.valueOf(SGroup.getSlevel1()).trim());
			psmt.setString(4, SGroup.getShikigamiNo2().trim());
			psmt.setString(5, String.valueOf(SGroup.getSlevel2()).trim());
			psmt.setString(6, SGroup.getShikigamiNo3().trim());
			psmt.setString(7, String.valueOf(SGroup.getSlevel3()).trim());
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
	
	//删除副本队伍表
	public boolean delSGroup(voBDSGroup SGroup)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from SGroup where SGroupNo=?,shikigamiNo1=?,shikigamiNo2=?,shikigamiNo3=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, SGroup.getSGroupNo().trim());
			psmt.setString(2, SGroup.getShikigamiNo1().trim());
			psmt.setString(3, String.valueOf(SGroup.getSlevel1()).trim());
			psmt.setString(4, SGroup.getShikigamiNo2().trim());
			psmt.setString(3, String.valueOf(SGroup.getSlevel2()).trim());
			psmt.setString(6, SGroup.getShikigamiNo3().trim());
			psmt.setString(3, String.valueOf(SGroup.getSlevel3()).trim());
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

	//查询副本队伍表 
	public ArrayList qrySGroup()
	{
		ArrayList SGroupList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from SGroup order by SGroupNo,shikigamiNo1,shikigamiNo2,shikigamiNo3";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDSGroup voSGroupAll=new voBDSGroup();
				voSGroupAll.setSGroupNo(rs.getString("SGroupNo"));
				psmt.setString(2, voSGroupAll.getShikigamiNo1().trim());
				psmt.setString(3, String.valueOf(voSGroupAll.getSlevel1()).trim());
				psmt.setString(4, voSGroupAll.getShikigamiNo2().trim());
				psmt.setString(5, String.valueOf(voSGroupAll.getSlevel2()).trim());
				psmt.setString(6, voSGroupAll.getShikigamiNo3().trim());
				psmt.setString(7, String.valueOf(voSGroupAll.getSlevel3()).trim());
				int nReturn = psmt.executeUpdate();
				SGroupList.add(voSGroupAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return SGroupList;		
	}	
	
}

