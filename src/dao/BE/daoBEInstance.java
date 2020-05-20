package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBEInstance;
import connDB.connyysDB;

public class daoBEInstance {
connyysDB connDB=new connyysDB();
	
	public boolean insInstance(voBEInstance Instance)//������
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
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
	
	
	
	//ɾ����
	public boolean delInstance(voBEInstance Instance)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
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

	//��ѯ��
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
			  //ʵ����vo
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
