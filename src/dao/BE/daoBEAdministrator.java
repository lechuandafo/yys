package dao.BE;

import java.sql.*;
import java.util.*;

import vo.BE.voBEAdministrator;
import connDB.connyysDB;

public class daoBEAdministrator {
	connyysDB connDB=new connyysDB();
	
	public boolean insAdministrator(voBEAdministrator Administrator)//������
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into Administrator values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Administrator.getAdministratorNo().trim());
			psmt.setString(2, Administrator.getAdministratorName().trim());
			psmt.setString(3, Administrator.getAdministratorPassword().trim());
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
	public boolean delAdministrator(voBEAdministrator Administrator)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from Administrator where administratorNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Administrator.getAdministratorNo());
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
	public ArrayList qryAdministrator()
	{
		ArrayList AdministratorList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Administrator order by administratorNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBEAdministrator AdministratorvoAll=new voBEAdministrator();
				AdministratorvoAll.setAdministratorNo(rs.getString("administratorNo"));
				AdministratorvoAll.setAdministratorName(rs.getString("administratorName"));
				AdministratorvoAll.setAdministratorPassword(rs.getString("administratorPassword"));
				AdministratorList.add(AdministratorvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return AdministratorList;		
	}
	
	public ArrayList qryAdmin(String name)
	{
		ArrayList AdministratorList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Administrator where administratorNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,name);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBEAdministrator AdministratorvoAll=new voBEAdministrator();
				AdministratorvoAll.setAdministratorNo(rs.getString("administratorNo"));
				AdministratorvoAll.setAdministratorName(rs.getString("administratorName"));
				AdministratorvoAll.setAdministratorPassword(rs.getString("administratorPassword"));
				AdministratorList.add(AdministratorvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return AdministratorList;		
	}
}
