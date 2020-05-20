package dao.PRO;

import java.sql.CallableStatement;

import connDB.connyysDB;

public class daoProcedure {
	connyysDB connDB=new connyysDB();
	@SuppressWarnings("finally")
	public String getAuthorAutoNo(String tableName,String authorName)
	{
		CallableStatement cstmt = null;
		String sAutoNo = null;
		String sSql = "{call auto_No1(?,?,?)}";
		try {
			cstmt = (CallableStatement) connDB.getConn().prepareStatement(sSql);
			cstmt.setString(1, tableName);
			cstmt.setString(2, authorName);
			cstmt.registerOutParameter(3,oracle.jdbc.OracleTypes.VARCHAR); 
			cstmt.execute();
			sAutoNo = cstmt.getString(3);				
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			//System.out.print(sAutoNo);
			return sAutoNo;	
		}
	}
	
	//在线人数存储过程调用
	public boolean getGamerOnlinePro(){
		CallableStatement cstmt = null;
		boolean flag=false;
		String sSql = "{call RPT_GamerOnline()}";
		try{
			cstmt = connDB.getConn().prepareCall(sSql);
			cstmt.execute();
			flag=true;
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}finally{
			connDB.commitConn();
			connDB.closeConn();
		}
		//System.out.println("执行报表1存储过程!");
		return flag;
	}	
	
	    //商品日售存储过程调用
		public boolean getProductSellPro(){
			CallableStatement cstmt = null;
			boolean flag=false;
			String sSql = "{call RPT_ProductSell()}";
			try{
				cstmt = connDB.getConn().prepareCall(sSql);
				cstmt.execute();
				flag=true;
			}catch (Exception e) {
				e.printStackTrace();
				flag=false;
			}finally{
				connDB.commitConn();
				connDB.closeConn();
			}
			//System.out.println("执行报表2存储过程!");
			return flag;
		}	
		
		//活跃排行存储过程调用
		public boolean getSkillRankPro(){
			CallableStatement cstmt = null;
			boolean flag=false;
			String sSql = "{call RPT_SkillRank()}";
			try{
				cstmt = connDB.getConn().prepareCall(sSql);
				cstmt.execute();
				flag=true;
			}catch (Exception e) {
				e.printStackTrace();
				flag=false;
			}finally{
				connDB.commitConn();
				connDB.closeConn();
			}
			//System.out.println("执行报表3存储过程!");
			return flag;
		}
}
