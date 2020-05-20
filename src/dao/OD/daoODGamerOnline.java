package dao.OD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.OD.voODGamerOnline;
import dao.PRO.*;
import connDB.connyysDB;


	public class daoODGamerOnline {
		connyysDB connDB=new connyysDB();
		//查询报表数据表
		public ArrayList<voODGamerOnline> queryRecords() throws Exception{
			
			PreparedStatement psmt = null;
			String sql="SELECT * FROM GamerOnline order by serviceNo";
			ArrayList<voODGamerOnline> voList=new ArrayList<voODGamerOnline>();
			daoProcedure daoPro=new daoProcedure();
			boolean flag=daoPro.getGamerOnlinePro();
			if(flag){
				//System.out.println("报表1存储过程执行成功!");
				try{
					psmt=connDB.getConn().prepareStatement(sql);
					ResultSet rs=psmt.executeQuery();
					while(rs.next()){
						voODGamerOnline vo=new voODGamerOnline();
						vo.setServiceNo(rs.getString(1));
						vo.setInpep(rs.getInt(2));
						vo.setSumpep(rs.getInt(3));
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
				//System.out.println("报表1存储过程执行失败!");
			}
		return voList;
	}
}
