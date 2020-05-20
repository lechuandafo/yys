package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBEShikigami;
import connDB.connyysDB;

public class daoBEShikigami {
	connyysDB connDB=new connyysDB();
	public boolean insShikigami(voBEShikigami Shikigami)//��������
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into Shikigami values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Shikigami.getShikigamiNo().trim());
			psmt.setString(2, Shikigami.getShikigamiName().trim());
			psmt.setString(3, Shikigami.getShikigamiURL().trim());
			psmt.setString(4, String.valueOf(Shikigami.getAttack()).trim());
			psmt.setString(5, String.valueOf(Shikigami.getDevelopAttack()).trim());
			psmt.setString(6, String.valueOf(Shikigami.getLife()).trim());
			psmt.setString(7, String.valueOf(Shikigami.getDevelopLife()).trim());
			psmt.setString(8, String.valueOf(Shikigami.getDefence()).trim());
			psmt.setString(9, String.valueOf(Shikigami.getDevelopDefence()).trim());
			psmt.setString(10, String.valueOf(Shikigami.getSpeed()).trim());
			psmt.setString(11, String.valueOf(Shikigami.getCrit()).trim());
			psmt.setString(12, String.valueOf(Shikigami.getCriticalDamage()).trim());
			psmt.setString(13, Shikigami.getBiography().trim());
			psmt.setString(14, Shikigami.getShikigamiXYD().trim());
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
	public boolean delShikigami(voBEShikigami Shikigami)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from Shikigami where shikigamiNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Shikigami.getShikigamiNo());
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

	//��ѯ���� 
	public ArrayList qryShikigami()
	{
		ArrayList ShikigamiList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Shikigami order by shikigamiNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBEShikigami ShikigamivoAll=new voBEShikigami();
				ShikigamivoAll.setShikigamiNo(rs.getString("shikigamiNo"));
				ShikigamivoAll.setShikigamiName(rs.getString("shikigamiName"));
				ShikigamivoAll.setShikigamiURL(rs.getString("shikigamiURL"));
				ShikigamivoAll.setAttack(rs.getInt("Attack"));
				ShikigamivoAll.setDevelopAttack(rs.getInt("developAttack"));
				ShikigamivoAll.setLife(rs.getInt("Life"));
				ShikigamivoAll.setDevelopLife(rs.getInt("developLife"));
				ShikigamivoAll.setDefence(rs.getInt("defence"));
				ShikigamivoAll.setDevelopDefence(rs.getInt("developDefence"));
				ShikigamivoAll.setSpeed(rs.getInt("speed"));
				ShikigamivoAll.setCrit(rs.getDouble("crit"));
				ShikigamivoAll.setCriticalDamage(rs.getDouble("criticalDamage"));
				ShikigamivoAll.setBiography(rs.getString("biography"));
				ShikigamiList.add(ShikigamivoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return ShikigamiList;		
	}
	//前台需要，通过式神ID查询具体某一个式神的信息
		public voBEShikigami qryShikigamiByID(String ID)
		{
			voBEShikigami ShikigamivoAll = new voBEShikigami();
			ResultSet rs = null;
			PreparedStatement psmt = null;
			String sSql = "select * from Shikigami where shikigamiNo=?";		
			try {
				psmt = connDB.getConn().prepareStatement(sSql);
				psmt.setString(1, ID);
				rs  = psmt.executeQuery();	
				while (rs.next())
				{
				  //ʵ��vo
					ShikigamivoAll.setShikigamiNo(rs.getString("shikigamiNo"));
					ShikigamivoAll.setShikigamiName(rs.getString("shikigamiName"));
					ShikigamivoAll.setShikigamiURL(rs.getString("shikigamiURL"));
					ShikigamivoAll.setAttack(rs.getInt("Attack"));
					ShikigamivoAll.setDevelopAttack(rs.getInt("developAttack"));
					ShikigamivoAll.setLife(rs.getInt("Life"));
					ShikigamivoAll.setDevelopLife(rs.getInt("developLife"));
					ShikigamivoAll.setDefence(rs.getInt("defence"));
					ShikigamivoAll.setDevelopDefence(rs.getInt("developDefence"));
					ShikigamivoAll.setSpeed(rs.getInt("speed"));
					ShikigamivoAll.setCrit(rs.getDouble("crit"));
					ShikigamivoAll.setCriticalDamage(rs.getDouble("criticalDamage"));
					ShikigamivoAll.setBiography(rs.getString("biography"));
				}
			} catch (Exception e) 
			{
				e.printStackTrace();
			}finally
			{
				connDB.commitConn();
				connDB.closeConn();
			}
			return ShikigamivoAll;		
		}
		
		//前台抽卡时需查询当前式神总集中一共有多少式神
		public int qryShikigamiTotalNum()
		{
			int totalNum = 0;
			ResultSet rs = null;
			PreparedStatement psmt = null;
			String sSql = "select count(*) from SHIKIGAMI";		
			try {
				psmt = connDB.getConn().prepareStatement(sSql);
				rs = psmt.executeQuery();	
				rs.next();
				totalNum = rs.getInt("count(*)");//列名？		
			} catch (Exception e) 
			{
				e.printStackTrace();
			}finally
			{
				connDB.commitConn();
				connDB.closeConn();
			}
			return totalNum;		
		}
}
