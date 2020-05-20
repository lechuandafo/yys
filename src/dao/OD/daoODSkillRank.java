package dao.OD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.OD.voODSkillRank;
import connDB.connyysDB;
import dao.PRO.daoProcedure;

public class daoODSkillRank {
	connyysDB connDB=new connyysDB();
	//查询报表数据表
	public ArrayList<voODSkillRank> queryRecords() throws Exception{
		
		PreparedStatement psmt = null;
		String sql="SELECT * FROM SkillRank order by rank";
		ArrayList<voODSkillRank> voList=new ArrayList<voODSkillRank>();
		daoProcedure daoPro=new daoProcedure();
		boolean flag=daoPro.getGamerOnlinePro();
		if(flag){
			//System.out.println("报表3存储过程执行成功!");
			try{
				psmt=connDB.getConn().prepareStatement(sql);
				ResultSet rs=psmt.executeQuery();
				while(rs.next()){
					voODSkillRank vo=new voODSkillRank();
					vo.setServiceNo(rs.getString(1));
					vo.setServiceName(rs.getString(2));
					vo.setRank(rs.getInt(3));
					vo.setGamerName(rs.getString(4));
					vo.setLevel(rs.getInt(5));
					vo.setFightSkillPoint(rs.getInt(6));
					voList.add(vo);
				}
			}catch (SQLException e){
				e.printStackTrace();
			}finally{
				connDB.commitConn();
				psmt.close();
				connDB.closeConn();
			}
		}
		else{
			//System.out.println("报表3存储过程执行失败!");
		}
	return voList;
	}
}