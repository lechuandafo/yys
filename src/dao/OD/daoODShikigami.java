package dao.OD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connDB.connyysDB;

import vo.BD.voBDGamerShikigami;
import vo.OD.*;

public class daoODShikigami {
	connyysDB connDB=new connyysDB();

	public ArrayList qryGamerShikigami(String userNo,String serviceNo)
	{
		ArrayList GamerShikigamiList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select a.*,b.* from GamerShikigami a,Shikigami b where a.ShikigamiNo=b.ShikigamiNo and UserNo =? and serviceNo= ? order by ShikigamiLevel desc";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,userNo);
			psmt.setString(2,serviceNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voODShikigami ShikigamivoAll=new voODShikigami();
				ShikigamivoAll.setShikigamiNo(rs.getString("shikigamiNo"));
				ShikigamivoAll.setShikigamiName(rs.getString("shikigamiName"));
				ShikigamivoAll.setShikigamiURL(rs.getString("shikigamiURL"));
				ShikigamivoAll.setShikigamiXYD(rs.getString("shikigamiXYD"));
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
				ShikigamivoAll.setUserNo(rs.getString("UserNo"));
				ShikigamivoAll.setServiceNo(rs.getString("ServiceNo"));
				ShikigamivoAll.setSkipNo(rs.getString("SkipNo"));
				ShikigamivoAll.setShikigamiLevel(rs.getInt("ShikigamiLevel"));
				ShikigamivoAll.setMitamaNo1(rs.getString("MitamaNo1"));
				ShikigamivoAll.setSkipNo1(rs.getString("SkipNo1"));
				ShikigamivoAll.setMitamaNo2(rs.getString("MitamaNo2"));
				ShikigamivoAll.setSkipNo2(rs.getString("SkipNo2"));
				ShikigamivoAll.setMitamaNo3(rs.getString("MitamaNo3"));
				ShikigamivoAll.setSkipNo3(rs.getString("SkipNo3"));
				ShikigamivoAll.setMitamaNo4(rs.getString("MitamaNo4"));
				ShikigamivoAll.setSkipNo4(rs.getString("SkipNo4"));
				ShikigamivoAll.setMitamaNo5(rs.getString("MitamaNo5"));
				ShikigamivoAll.setSkipNo5(rs.getString("SkipNo5"));
				ShikigamivoAll.setMitamaNo6(rs.getString("MitamaNo6"));
				ShikigamivoAll.setSkipNo6(rs.getString("SkipNo6"));
				ShikigamivoAll.setShikigamiEXP(rs.getInt("ShikigamiEXP"));
				GamerShikigamiList.add(ShikigamivoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerShikigamiList;
	}
	public ArrayList qryGamerShikigamiM(String userNo,String serviceNo, String ShikigamiNo,String SkipNo)
	{
		ArrayList GamerShikigamiList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select a.*,b.* from GamerShikigami a,Shikigami b where a.ShikigamiNo=b.ShikigamiNo and UserNo =? and serviceNo= ? and ShikigamiNo= ? and SkipNo= ? order by ShikigamiLevel desc";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1,userNo);
			psmt.setString(2,serviceNo);
			psmt.setString(3,ShikigamiNo);
			psmt.setString(4,SkipNo);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voODShikigami ShikigamivoAll=new voODShikigami();
				ShikigamivoAll.setShikigamiNo(rs.getString("shikigamiNo"));
				ShikigamivoAll.setShikigamiName(rs.getString("shikigamiName"));
				ShikigamivoAll.setShikigamiURL(rs.getString("shikigamiURL"));
				ShikigamivoAll.setShikigamiXYD(rs.getString("shikigamiXYD"));
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
				ShikigamivoAll.setUserNo(rs.getString("UserNo"));
				ShikigamivoAll.setServiceNo(rs.getString("ServiceNo"));
				ShikigamivoAll.setSkipNo(rs.getString("SkipNo"));
				ShikigamivoAll.setShikigamiLevel(rs.getInt("ShikigamiLevel"));
				ShikigamivoAll.setMitamaNo1(rs.getString("MitamaNo1"));
				ShikigamivoAll.setSkipNo1(rs.getString("SkipNo1"));
				ShikigamivoAll.setMitamaNo2(rs.getString("MitamaNo2"));
				ShikigamivoAll.setSkipNo2(rs.getString("SkipNo2"));
				ShikigamivoAll.setMitamaNo3(rs.getString("MitamaNo3"));
				ShikigamivoAll.setSkipNo3(rs.getString("SkipNo3"));
				ShikigamivoAll.setMitamaNo4(rs.getString("MitamaNo4"));
				ShikigamivoAll.setSkipNo4(rs.getString("SkipNo4"));
				ShikigamivoAll.setMitamaNo5(rs.getString("MitamaNo5"));
				ShikigamivoAll.setSkipNo5(rs.getString("SkipNo5"));
				ShikigamivoAll.setMitamaNo6(rs.getString("MitamaNo6"));
				ShikigamivoAll.setSkipNo6(rs.getString("SkipNo6"));
				ShikigamivoAll.setShikigamiEXP(rs.getInt("ShikigamiEXP"));
				GamerShikigamiList.add(ShikigamivoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return GamerShikigamiList;
	}
}
