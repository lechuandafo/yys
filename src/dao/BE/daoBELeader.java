package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBELeader;
import connDB.connyysDB;

public class daoBELeader {
	connyysDB connDB=new connyysDB();
	public boolean insLeader(voBELeader Leader)//��������
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into Leader values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Leader.getLeaderNo().trim());
			psmt.setString(2, Leader.getLeaderName().trim());
			psmt.setString(3, Leader.getLeaderURL().trim());
			psmt.setString(4, String.valueOf(Leader.getLeaderCreateAttack()).trim());
			psmt.setString(5, String.valueOf(Leader.getLeaderDevelopAttack()).trim());
			psmt.setString(6, String.valueOf(Leader.getLeaderCreateLife()).trim());
			psmt.setString(7, String.valueOf(Leader.getLeaderDevelopLife()).trim());
			psmt.setString(8, String.valueOf(Leader.getLeaderCreateDefence()).trim());
			psmt.setString(9, String.valueOf(Leader.getLeaderDevelopDefence()).trim());
			psmt.setString(10, String.valueOf(Leader.getLeaderCreateSpeed()).trim());
			psmt.setString(11, String.valueOf(Leader.getLeaderCreateCrit()).trim());
			psmt.setString(12, String.valueOf(Leader.getLeaderCreateCriticalDamage()).trim());
			psmt.setString(13, Leader.getBiography().trim());
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
	public boolean delLeader(voBELeader Leader)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from Leader where leaderNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Leader.getLeaderNo().trim());
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

	//��ѯ���� 
	public ArrayList qryLeader()
	{
		ArrayList LeaderList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Leader order by leaderNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ��vo
				voBELeader LeadervoAll=new voBELeader();
				LeadervoAll.setLeaderNo(rs.getString("leaderNo"));
				LeadervoAll.setLeaderName(rs.getString("leaderName"));
				LeadervoAll.setLeaderURL(rs.getString("leaderURL"));
				LeadervoAll.setLeaderCreateAttack(rs.getInt("leaderCreateAttack"));
				LeadervoAll.setLeaderDevelopAttack(rs.getInt("leaderDevelopAttack"));
				LeadervoAll.setLeaderCreateLife(rs.getInt("leaderCreateLife"));
				LeadervoAll.setLeaderDevelopLife(rs.getInt("leaderDevelopLife"));
				LeadervoAll.setLeaderCreateDefence(rs.getInt("leaderCreateDefence"));
				LeadervoAll.setLeaderDevelopDefence(rs.getInt("leaderDevelopDefence"));
				LeadervoAll.setLeaderCreateSpeed(rs.getInt("leaderCreateSpeed"));
				LeadervoAll.setLeaderCreateCrit(rs.getDouble("leaderCreateCrit"));
				LeadervoAll.setLeaderCreateCriticalDamage(rs.getDouble("leaderCreateCriticalDamage"));
				LeadervoAll.setBiography(rs.getString("biography"));
				LeaderList.add(LeadervoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return LeaderList;		
	}
}
