package dao.BE;

import java.sql.*;
import java.util.*;

import vo.BE.voBEProductInfo;
import connDB.connyysDB;

public class daoBEProductInfo {
	connyysDB connDB=new connyysDB();
	public boolean insProductInfo(voBEProductInfo ProductInfo)//������Ʒ
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into ProductInfo values(?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, ProductInfo.getProductNo().trim());
			psmt.setString(2, ProductInfo.getProductName().trim());
			psmt.setString(3, ProductInfo.getProductDescription().trim());
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
	
	
	
	//ɾ����
	public boolean delProductInfo(voBEProductInfo ProductInfo)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from ProductInfo where productNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, ProductInfo.getProductNo());
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

	//��ѯ��
	public ArrayList qryProductInfo()
	{
		ArrayList ProductInfoList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from ProductInfo order by ProductNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBEProductInfo ProductInfovoAll=new voBEProductInfo();
				ProductInfovoAll.setProductNo(rs.getString("productNo"));
				ProductInfovoAll.setProductName(rs.getString("productName"));
				ProductInfovoAll.setProductDescription(rs.getString("productDescription"));
				ProductInfoList.add(ProductInfovoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return ProductInfoList;		
	}	
}
