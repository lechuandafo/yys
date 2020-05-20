package dao.BE;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BE.voBESkill;
import connDB.connyysDB;

public class daoBESkill {
	connyysDB connDB=new connyysDB();
	public boolean insSkill(voBESkill Skill)//���Ӽ���
	{
		boolean flag = false;            //�����Ƿ�ɹ�		
		PreparedStatement psmt = null;
		String sSql = "insert into Skill values(?,?,?,?)";
		try {			
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Skill.getSkillNo().trim());
			psmt.setString(2, Skill.getSkillName().trim());
			psmt.setString(3, Skill.getSkillDescription().trim());
			psmt.setString(4, Skill.getBaseCoefficient().trim()); 
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
	public boolean delSkill(voBESkill Skill)
	{
		boolean flag = false;               //�����Ƿ�ɹ�
		PreparedStatement psmt = null;
		String sSql = "delete from Skill where skillNo=?";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, Skill.getSkillNo());
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
	public ArrayList qrySkill()
	{
		ArrayList SkillList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select * from Skill order by skillNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //ʵ����vo
				voBESkill SkillvoAll=new voBESkill();
				SkillvoAll.setSkillNo(rs.getString("skillNo"));
				SkillvoAll.setSkillName(rs.getString("skillName"));
				SkillvoAll.setSkillDescription(rs.getString("skillDescription"));
				SkillvoAll.setBaseCoefficient(rs.getString("baseCoefficient"));
				SkillList.add(SkillvoAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return SkillList;		
	}
}
