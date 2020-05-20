package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDGamerMitama;
import connDB.connyysDB;

public class daoBDGamerMitama {
connyysDB connDB=new connyysDB();
	
	public boolean insGamerMitama(voBDGamerMitama GamerMitama)//增加区
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into GamerMitama values(?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerMitama.getUserNo().trim());
			psmt.setString(2, GamerMitama.getServiceNo().trim());
			psmt.setString(3, GamerMitama.getMitamaNo().trim());
			psmt.setString(4, GamerMitama.getSkipNo().trim());
			psmt.setString(5, String.valueOf(GamerMitama.getMitamaLevel()).trim());
			psmt.setString(5, String.valueOf(GamerMitama.getMitamaMastar()).trim());
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
	public boolean delGamerMitama(voBDGamerMitama GamerMitama)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from GamerMitama where userNo=? and serviceNo=? and mitamaNo=? and skipNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerMitama.getUserNo());
			psmt.setString(2, GamerMitama.getServiceNo());
			psmt.setString(3, GamerMitama.getMitamaNo().trim());
			psmt.setString(4, GamerMitama.getSkipNo().trim());
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
	public ArrayList qryGamerMitama()
	{
		ArrayList GamerMitamaList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerMitama order by userNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerMitama GamerMitamavoAll=new voBDGamerMitama();
				GamerMitamavoAll.setUserNo(rs.getString("userNo"));
				GamerMitamavoAll.setServiceNo(rs.getString("serviceNo"));
				GamerMitamavoAll.setMitamaNo(rs.getString("mitamaNo"));
				GamerMitamavoAll.setSkipNo(rs.getString("skipNo"));
				GamerMitamavoAll.setMitamaLevel(rs.getInt("mitamaLevel"));
				GamerMitamavoAll.setMitamaMastar(rs.getInt("mitamaMastar"));
				GamerMitamaList.add(GamerMitamavoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerMitamaList;		
	}
	
	public ArrayList qryGamerMitamaM(String userNo,String serviceNo,String MitamaNo,String SkipNo)
	{
		ArrayList GamerMitamaList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerMitama where USERNO=? and SERVICENO=? and MitamaNo=? and SkipNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
			psmt.setString(3, MitamaNo);
			psmt.setString(4, SkipNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerMitama GamerMitamavoAll=new voBDGamerMitama();
				GamerMitamavoAll.setUserNo(rs.getString("userNo"));
				GamerMitamavoAll.setServiceNo(rs.getString("serviceNo"));
				GamerMitamavoAll.setMitamaNo(rs.getString("mitamaNo"));
				GamerMitamavoAll.setSkipNo(rs.getString("skipNo"));
				GamerMitamavoAll.setMitamaLevel(rs.getInt("mitamaLevel"));
				GamerMitamavoAll.setMitamaMastar(rs.getInt("mitamaStar"));
				GamerMitamaList.add(GamerMitamavoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerMitamaList;		
	}	
	
}
