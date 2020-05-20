package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDGamerShikigami;
import connDB.connyysDB;

public class daoBDGamerShikigami {
	connyysDB connDB=new connyysDB();
	public boolean insGamerShikigami(voBDGamerShikigami GamerShikigami)//增加主角
	{
		boolean flag = false;            //操作是否成功		
		PreparedStatement psmt = null;
		//未插入的值采用默认值或空值
		String sSql = "insert into GamerShikigami(UserNo,ServiceNo,SHIKIGAMINO,SKIPNO) values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerShikigami.getUserNo().trim());
			psmt.setString(2, GamerShikigami.getServiceNo().trim());
			psmt.setString(3, GamerShikigami.getShikigamiNo().trim());
			psmt.setString(4, GamerShikigami.getSkipNo().trim());
//			psmt.setString(5, String.valueOf(GamerShikigami.getShikigamiLevel()).trim());
//			psmt.setString(6, GamerShikigami.getMitamaNo1().trim());
//			psmt.setString(7, GamerShikigami.getSkipNo1().trim());
//			psmt.setString(8, GamerShikigami.getMitamaNo2().trim());
//			psmt.setString(9, GamerShikigami.getSkipNo2().trim());
//			psmt.setString(10, GamerShikigami.getMitamaNo3().trim());
//			psmt.setString(11, GamerShikigami.getSkipNo3().trim());
//			psmt.setString(12, GamerShikigami.getMitamaNo4().trim());
//			psmt.setString(13, GamerShikigami.getSkipNo4().trim());
//			psmt.setString(14, GamerShikigami.getMitamaNo5().trim());
//			psmt.setString(15, GamerShikigami.getSkipNo5().trim());
//			psmt.setString(16, GamerShikigami.getMitamaNo6().trim());
//			psmt.setString(17, GamerShikigami.getSkipNo6().trim());
//			psmt.setString(18, String.valueOf(GamerShikigami.getShikigamiEXP()).trim());
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
	
	
	
	//删除主角
	public boolean delGamerShikigami(voBDGamerShikigami GamerShikigami)
	{
		boolean flag = false;               //操作是否成功
		PreparedStatement psmt = null;
		String sSql = "delete from GamerShikigami where USERNO=? and SERVICENO=? and SHIKIGAMINO=? and SKIPNO=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, GamerShikigami.getUserNo());
			psmt.setString(2, GamerShikigami.getServiceNo());
			psmt.setString(3, GamerShikigami.getShikigamiNo());
			psmt.setString(4, GamerShikigami.getSkipNo());
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

	//查询主角 
	public ArrayList qryGamerShikigami()
	{
		ArrayList GamerShikigamiList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from GamerShikigami order by USERNO,SERVICENO";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDGamerShikigami GamerShikigamivoAll=new voBDGamerShikigami();
				GamerShikigamivoAll.setUserNo(rs.getString("UserNo"));
				GamerShikigamivoAll.setServiceNo(rs.getString("ServiceNo"));
				GamerShikigamivoAll.setShikigamiNo(rs.getString("ShikigamiNo"));
				GamerShikigamivoAll.setSkipNo(rs.getString("SkipNo"));
				GamerShikigamivoAll.setShikigamiLevel(rs.getInt("ShikigamiLevel"));
				GamerShikigamivoAll.setMitamaNo1(rs.getString("MitamaNo1"));
				GamerShikigamivoAll.setSkipNo1(rs.getString("SkipNo1"));
				GamerShikigamivoAll.setMitamaNo2(rs.getString("MitamaNo2"));
				GamerShikigamivoAll.setSkipNo2(rs.getString("SkipNo2"));
				GamerShikigamivoAll.setMitamaNo3(rs.getString("MitamaNo3"));
				GamerShikigamivoAll.setSkipNo3(rs.getString("SkipNo3"));
				GamerShikigamivoAll.setMitamaNo4(rs.getString("MitamaNo4"));
				GamerShikigamivoAll.setSkipNo4(rs.getString("SkipNo4"));
				GamerShikigamivoAll.setMitamaNo5(rs.getString("MitamaNo5"));
				GamerShikigamivoAll.setSkipNo5(rs.getString("SkipNo5"));
				GamerShikigamivoAll.setMitamaNo6(rs.getString("MitamaNo6"));
				GamerShikigamivoAll.setSkipNo6(rs.getString("SkipNo6"));
				GamerShikigamivoAll.setShikigamiEXP(rs.getInt("ShikigamiEXP"));
				GamerShikigamiList.add(GamerShikigamivoAll);
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
	
	
	
	//抽卡时，生成抽到的式神的部分码，即查询此式神是该玩家第几个抽到的同种式神，从0开始计数
	public String qryShikigamiSkipNobyID(String userNo, String serviceNo, String ID)
	{
		int skipNo = 0;
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select count(*) from GAMERSHIKIGAMI where USERNO=? and SERVICENO=? and SHIKIGAMINO=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, userNo);
			psmt.setString(2, serviceNo);
			psmt.setString(3, ID);
			rs = psmt.executeQuery();	
			rs.next();
			skipNo = rs.getInt("count(*)");//列名？		
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		
		String skipNoStr = String.valueOf(skipNo);
		int len = skipNoStr.length();
		for(int i=0; i<3-len; i++)
			skipNoStr = "0" + skipNoStr;
		return skipNoStr;
	}
}
