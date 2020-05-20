package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDCommodityDetail;
import connDB.connyysDB;

public class daoBDCommodityDetail {
	connyysDB connDB=new connyysDB();
	
	public boolean insCommodityDetail(voBDCommodityDetail CommodityDetail)
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		String sSql = "insert into CommodityDetail values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, CommodityDetail.getProductNo().trim());
			psmt.setString(2, CommodityDetail.getCommodityNo().trim());
			psmt.setString(3, CommodityDetail.getPcount().trim());
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
	
	public boolean uptCommodityDetail(voBDCommodityDetail CommodityDetail)
	{
		boolean flag = false;             //操作是否成功 
		PreparedStatement psmt = null;
		String sSql = "update  CommodityDetail set productNo=? and commodityNo=? and pcount=?";
		sSql = sSql + " where  productNo=? and commodityNo=?";
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, CommodityDetail.getProductNo().trim());
			psmt.setString(2, CommodityDetail.getCommodityNo().trim());
			psmt.setString(3, CommodityDetail.getPcount().trim());
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
	
	//删除商品详情表
	public boolean delCommodityDetail(voBDCommodityDetail CommodityDetail)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from CommodityDetail where ProductNo=?,CommodityNo=?,Pcount=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,CommodityDetail.getProductNo());
			psmt.setString(2,CommodityDetail.getCommodityNo());
			psmt.setString(3,CommodityDetail.getPcount());
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

	//查询商品详情表 
	public ArrayList qryCommodityDetail()
	{
		ArrayList CommodityDetailList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from CommodityDetail order by productNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDCommodityDetail voCommodityDetailAll=new voBDCommodityDetail();
				voCommodityDetailAll.setProductNo(rs.getString("productNo"));
				voCommodityDetailAll.setCommodityNo(rs.getString("commodityNo"));
				voCommodityDetailAll.setPcount(rs.getString("pcount"));
				CommodityDetailList.add(voCommodityDetailAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return CommodityDetailList;		
	}	
	
}
