package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBECommodityInfo;
import connDB.connyysDB;

public class daoBECommodityInfo {
	connyysDB connDB=new connyysDB();
	public boolean insCommodityInfo(voBECommodityInfo CommodityInfo)
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into CommodityInfo values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, CommodityInfo.getCommodityNo().trim());
			psmt.setString(2, CommodityInfo.getCommodityName().trim());
			psmt.setString(3, String.valueOf(CommodityInfo.getPrice()).trim());
			
			System.out.println(CommodityInfo.getCommodityNo()+" "+CommodityInfo.getCommodityName()+" "+CommodityInfo.getPrice());			
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
	
	
	

	public boolean delCommodityInfo(voBECommodityInfo CommodityInfo)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from CommodityInfo where commodityNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, CommodityInfo.getCommodityNo());
			System.out.println("dao: "+CommodityInfo.getCommodityNo());
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

 
	public ArrayList qryCommodityInfo()
	{
		ArrayList CommodityInfoList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from CommodityInfo order by commodityNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBECommodityInfo CommodityInfovoAll=new voBECommodityInfo();
				CommodityInfovoAll.setCommodityNo(rs.getString("commodityNo"));
				CommodityInfovoAll.setCommodityName(rs.getString("commodityName"));
				CommodityInfovoAll.setPrice(rs.getInt("price"));
				System.out.println("dao :"+rs.getString("commodityNo"));
				CommodityInfoList.add(CommodityInfovoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return CommodityInfoList;		
	}
}
