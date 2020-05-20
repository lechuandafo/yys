package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBEMap;
import connDB.connyysDB;

public class daoBEMap {
	connyysDB connDB=new connyysDB();
	
	public boolean insMap(voBEMap Map)//������
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into Map values(?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Map.getMapNo().trim());
			psmt.setString(2, Map.getMapName().trim());
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
	public boolean delMap(voBEMap Map)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from Map where mapNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Map.getMapNo());
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
	public ArrayList qryMap()
	{
		ArrayList MapList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from MapNo order by mapNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ����vo
				voBEMap MapvoAll=new voBEMap();
				MapvoAll.setMapNo(rs.getString("mapNo"));
				MapvoAll.setMapName(rs.getString("mapName"));
				MapList.add(MapvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return MapList;		
	}	
}
