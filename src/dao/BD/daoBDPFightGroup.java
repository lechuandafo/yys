package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import connDB.connyysDB;
import vo.BD.voBDPFightGroup;

public class daoBDPFightGroup {
	connyysDB connDB=new connyysDB();
	
	public boolean insPFightGroup(voBDPFightGroup PFightGroup)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into PFightGroup values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, PFightGroup.getUserNo().trim());
			psmt.setString(2, PFightGroup.getServiceNo().trim());
			psmt.setString(3, PFightGroup.getLeaderNo().trim());
			psmt.setString(4, PFightGroup.getShikigamiNo1().trim());
			psmt.setString(5, PFightGroup.getSkipNo1().trim());
			psmt.setString(6, PFightGroup.getShikigamiNo2().trim());
			psmt.setString(7, PFightGroup.getSkipNo2().trim());
			psmt.setString(8, PFightGroup.getShikigamiNo3().trim());
			psmt.setString(9, PFightGroup.getSkipNo3().trim());
			psmt.setString(10, PFightGroup.getShikigamiNo4().trim());
			psmt.setString(11, PFightGroup.getSkipNo4().trim());
			psmt.setString(12, PFightGroup.getShikigamiNo5().trim());
			psmt.setString(13, PFightGroup.getSkipNo5().trim());
			
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
	
	public boolean uptPFightGroup(voBDPFightGroup PFightGroup)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update PFightGroup set shikigamiNo1=?,skipNo1=?,shikigamiNo2=?,skipNo2=?,shikigamiNo3=?,skipNo3=?,shikigamiNo4=?,skipNo4=?,shikigamiNo5=?,skipNo5=? where userNo=? and serviceNo=?";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, PFightGroup.getShikigamiNo1().trim());
			psmt.setString(2, PFightGroup.getSkipNo1().trim());
			psmt.setString(3, PFightGroup.getShikigamiNo2().trim());
			psmt.setString(4, PFightGroup.getSkipNo2().trim());
			psmt.setString(5, PFightGroup.getShikigamiNo3().trim());
			psmt.setString(6, PFightGroup.getSkipNo3().trim());
			psmt.setString(7, PFightGroup.getShikigamiNo4().trim());
			psmt.setString(8, PFightGroup.getSkipNo4().trim());
			psmt.setString(9, PFightGroup.getShikigamiNo5().trim());
			psmt.setString(10, PFightGroup.getSkipNo5().trim());
			psmt.setString(11, PFightGroup.getUserNo().trim());
			psmt.setString(12, PFightGroup.getServiceNo().trim());
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
	public boolean delPFightGroup(voBDPFightGroup PFightGroup)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from PFightGroup where PFightGroupNO=?,userNo=?,serviceNo=?,leaderNo=?,shikigamiNo=?,skipNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			
			psmt.setString(1, PFightGroup.getUserNo().trim());
			psmt.setString(2, PFightGroup.getServiceNo().trim());
			psmt.setString(3, PFightGroup.getLeaderNo().trim());

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
		ArrayList PFightGroupList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from PFightGroup order by PFightGroupNO,userNo,serviceNo,leaderNo,shikigamiNo,skipNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDPFightGroup voPFightGroupAll=new voBDPFightGroup();
				voPFightGroupAll.setUserNo(rs.getString("userNo"));
				voPFightGroupAll.setServiceNo(rs.getString("serviceNo"));
				voPFightGroupAll.setLeaderNo(rs.getString("leaderNo"));
				voPFightGroupAll.setShikigamiNo1(rs.getString("shikigamiNo1"));
				voPFightGroupAll.setSkipNo1(rs.getString("skipNo1"));
				voPFightGroupAll.setShikigamiNo2(rs.getString("shikigamiNo2"));
				voPFightGroupAll.setSkipNo2(rs.getString("skipNo2 "));
				voPFightGroupAll.setShikigamiNo3(rs.getString("shikigamiNo3"));
				voPFightGroupAll.setSkipNo3(rs.getString("skipNo3"));
				voPFightGroupAll.setShikigamiNo4(rs.getString("shikigamiNo4"));
				voPFightGroupAll.setSkipNo4(rs.getString("skipNo4"));
				voPFightGroupAll.setShikigamiNo5(rs.getString("shikigamiNo5"));
				voPFightGroupAll.setSkipNo5(rs.getString("skipNo5"));
				PFightGroupList.add(voPFightGroupAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return PFightGroupList;		
	}
	public ArrayList qrybuyMitamaM(String userNo,String serviceNo)
	{
		ArrayList PFightGroupList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from PFightGroup where userNo=? and serviceNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDPFightGroup voPFightGroupAll=new voBDPFightGroup();
				voPFightGroupAll.setUserNo(rs.getString("userNo"));
				voPFightGroupAll.setServiceNo(rs.getString("serviceNo"));
				voPFightGroupAll.setLeaderNo(rs.getString("leaderNo"));
				voPFightGroupAll.setShikigamiNo1(rs.getString("shikigamiNo1"));
				voPFightGroupAll.setSkipNo1(rs.getString("skipNo1"));
				voPFightGroupAll.setShikigamiNo2(rs.getString("shikigamiNo2"));
				voPFightGroupAll.setSkipNo2(rs.getString("skipNo2"));
				voPFightGroupAll.setShikigamiNo3(rs.getString("shikigamiNo3"));
				voPFightGroupAll.setSkipNo3(rs.getString("skipNo3"));
				voPFightGroupAll.setShikigamiNo4(rs.getString("shikigamiNo4"));
				voPFightGroupAll.setSkipNo4(rs.getString("skipNo4"));
				voPFightGroupAll.setShikigamiNo5(rs.getString("shikigamiNo5"));
				voPFightGroupAll.setSkipNo5(rs.getString("skipNo5"));
				PFightGroupList.add(voPFightGroupAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return PFightGroupList;		
	}	
}