package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBEMitama;
import vo.BE.voBEMitama;
import connDB.connyysDB;

public class daoBEMitama {
	connyysDB connDB=new connyysDB();
	public boolean insMitama(voBEMitama Mitama)//��������
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into Mitama values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Mitama.getMitamaNo().trim());
			psmt.setString(2, Mitama.getMitamaName().trim());
			psmt.setString(3, Mitama.getMitamaURL().trim());
			psmt.setString(4, String.valueOf(Mitama.getCreateAttack()).trim());
			psmt.setString(5, String.valueOf(Mitama.getDevelopAttack()).trim());
			psmt.setString(6, String.valueOf(Mitama.getCreateLife()).trim());
			psmt.setString(7, String.valueOf(Mitama.getDevelopLife()).trim());
			psmt.setString(8, String.valueOf(Mitama.getCreateDefence()).trim());
			psmt.setString(9, String.valueOf(Mitama.getDevelopDefence()).trim());
			psmt.setString(10, String.valueOf(Mitama.getCreateSpeed()).trim());
			psmt.setString(11, String.valueOf(Mitama.getDevelopSpeed()).trim());
			psmt.setString(12, String.valueOf(Mitama.getCreateCrit()).trim());
			psmt.setString(13, String.valueOf(Mitama.getDevelopCrit()).trim());
			psmt.setString(14, String.valueOf(Mitama.getCreateCriticalDamage()).trim());
			psmt.setString(15, String.valueOf(Mitama.getDevelopCriticalDamage()).trim());
			psmt.setString(16, String.valueOf(Mitama.getCreateBlocking()).trim());
			psmt.setString(17, String.valueOf(Mitama.getDevelopBlocking()).trim());
			psmt.setString(18, String.valueOf(Mitama.getCreateResistance()).trim());
			psmt.setString(19, String.valueOf(Mitama.getDevelopResistance()).trim());
			psmt.setString(20, Mitama.getSuitNature().trim());
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
	
	
	
	//ɾ������
	public boolean delMitama(voBEMitama Mitama)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from Mitama where mitamaNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Mitama.getMitamaNo().trim());
			System.out.println(psmt);
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


	public ArrayList qryMitama()
	{
		ArrayList MitamaList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Mitama order by MitamaNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBEMitama MitamavoAll=new voBEMitama();
				MitamavoAll.setMitamaNo(rs.getString("mitamaNo"));
				MitamavoAll.setMitamaName(rs.getString("mitamaName"));
				MitamavoAll.setMitamaURL(rs.getString("mitamaURL"));
				MitamavoAll.setCreateAttack(rs.getInt("createAttack"));
				MitamavoAll.setDevelopAttack(rs.getDouble("developAttack"));
				MitamavoAll.setCreateLife(rs.getInt("createLife"));
				MitamavoAll.setDevelopLife(rs.getDouble("developLife"));
				MitamavoAll.setCreateDefence(rs.getInt("createDefence"));
				MitamavoAll.setDevelopDefence(rs.getDouble("developDefence"));
				MitamavoAll.setCreateSpeed(rs.getInt("createSpeed"));
				MitamavoAll.setDevelopSpeed(rs.getDouble("developSpeed"));
				MitamavoAll.setCreateCrit(rs.getDouble("createCrit"));
				MitamavoAll.setDevelopCrit(rs.getDouble("developCrit"));
				MitamavoAll.setCreateCriticalDamage(rs.getDouble("createCriticalDamage"));
				MitamavoAll.setDevelopCriticalDamage(rs.getDouble("developCriticalDamage"));
				MitamavoAll.setCreateBlocking(rs.getDouble("createBlocking"));
				MitamavoAll.setDevelopBlocking(rs.getDouble("developBlocking"));
				MitamavoAll.setCreateResistance(rs.getDouble("createResistance"));
				MitamavoAll.setDevelopResistance(rs.getDouble("developResistance"));
				MitamavoAll.setSuitNature(rs.getString("suitNature"));
				MitamaList.add(MitamavoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return MitamaList;		
	}
	
	public ArrayList qryMitamaM(String MitamaNo)
	{
		ArrayList MitamaList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Mitama where mitamaNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, MitamaNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBEMitama MitamavoAll=new voBEMitama();
				MitamavoAll.setMitamaNo(rs.getString("mitamaNo"));
				MitamavoAll.setMitamaName(rs.getString("mitamaName"));
				MitamavoAll.setMitamaURL(rs.getString("mitamaURL"));
				MitamavoAll.setCreateAttack(rs.getInt("createAttack"));
				MitamavoAll.setDevelopAttack(rs.getDouble("developAttack"));
				MitamavoAll.setCreateLife(rs.getInt("createLife"));
				MitamavoAll.setDevelopLife(rs.getDouble("developLife"));
				MitamavoAll.setCreateDefence(rs.getInt("createDefence"));
				MitamavoAll.setDevelopDefence(rs.getDouble("developDefence"));
				MitamavoAll.setCreateSpeed(rs.getInt("createSpeed"));
				MitamavoAll.setDevelopSpeed(rs.getDouble("developSpeed"));
				MitamavoAll.setCreateCrit(rs.getDouble("createCrit"));
				MitamavoAll.setDevelopCrit(rs.getDouble("developCrit"));
				MitamavoAll.setCreateCriticalDamage(rs.getDouble("createCriticalDamage"));
				MitamavoAll.setDevelopCriticalDamage(rs.getDouble("developCriticalDamage"));
				MitamavoAll.setCreateBlocking(rs.getDouble("createBlocking"));
				MitamavoAll.setDevelopBlocking(rs.getDouble("developBlocking"));
				MitamavoAll.setCreateResistance(rs.getDouble("createResistance"));
				MitamavoAll.setDevelopResistance(rs.getDouble("developResistance"));
				MitamavoAll.setSuitNature(rs.getString("suitNature"));
				MitamaList.add(MitamavoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return MitamaList;		
	}
}
