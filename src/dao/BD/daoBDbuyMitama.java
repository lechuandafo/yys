package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vo.BD.voBDbuyMitama;
import connDB.connyysDB;


public class daoBDbuyMitama {
	connyysDB connDB=new connyysDB();
	
	public boolean insbuyMitama(voBDbuyMitama buyMitama)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into buyMitama values(?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, buyMitama.getUserNo().trim());
			psmt.setString(2, buyMitama.getServiceNo().trim());
			psmt.setString(3, buyMitama.getMitamaNo().trim());
			psmt.setTimestamp(4, buyMitama.getBuyTimem());
			psmt.setString(5, buyMitama.getMcount().trim());
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
	
	public boolean uptbuyMitama(voBDbuyMitama buyMitama)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  buyMitama set mcount=? ";//~~~~~~~~~~~
		sSql = sSql + " where userNo=? and serviceNo=? and mitamaNo=? ";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,buyMitama.getUserNo());
			psmt.setString(2,buyMitama.getServiceNo());
			psmt.setString(3,buyMitama.getMitamaNo());
			psmt.setTimestamp(4, buyMitama.getBuyTimem());
			psmt.setString(5,buyMitama.getMcount());
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
	public boolean delbuyMitama(voBDbuyMitama buyMitama)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from buyMitama where userNo=?,serviceNo=?,mitamaNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,buyMitama.getUserNo());
			psmt.setString(2,buyMitama.getServiceNo());
			psmt.setString(3,buyMitama.getMitamaNo());
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
		ArrayList buyMitamaList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from buyMitama order by userNo,serviceNo,mitamaNo,mcount";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDbuyMitama vobuyMitamaAll=new voBDbuyMitama();
				vobuyMitamaAll.setUserNo(rs.getString("userNo"));
				vobuyMitamaAll.setServiceNo(rs.getString("serviceNo"));
				vobuyMitamaAll.setMitamaNo(rs.getString("mitamaNo"));
				vobuyMitamaAll.setBuyTimem(rs.getTimestamp("buyTimem"));
				vobuyMitamaAll.setMcount(rs.getString("mcount"));
				buyMitamaList.add(vobuyMitamaAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return buyMitamaList;		
	}	
	
}
