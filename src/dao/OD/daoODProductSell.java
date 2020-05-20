package dao.OD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.OD.voODProductSell;
import connDB.connyysDB;
import dao.PRO.*;

public class daoODProductSell {
	connyysDB connDB=new connyysDB();
	//查询报表数据表
	public ArrayList<voODProductSell> queryRecords() throws Exception{
		
		PreparedStatement psmt = null;
		String sql="SELECT * FROM ProductSell order by serviceNo";
		ArrayList<voODProductSell> voList=new ArrayList<voODProductSell>();
		daoProcedure daoPro=new daoProcedure();
		boolean flag=daoPro.getProductSellPro();
		if(flag){
			//System.out.println("报表2存储过程执行成功!");
			try{
				psmt=connDB.getConn().prepareStatement(sql);
				ResultSet rs=psmt.executeQuery();
				while(rs.next()){
					voODProductSell vo=new voODProductSell();
					vo.setServiceNo(rs.getString(1));
					vo.setCommodityNo(rs.getString(2));
					vo.setPrice(rs.getInt(3));
					vo.setCcountSum(rs.getInt(4));
					vo.setcSum(rs.getInt(5));
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
			//System.out.println("报表2存储过程执行失败!");
		}
	return voList;
	}
}
	
	