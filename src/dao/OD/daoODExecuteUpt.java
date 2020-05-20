package dao.OD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import connDB.connyysDB;

public class daoODExecuteUpt {
	connyysDB connDB=new connyysDB();
	Map<String, Integer> Index = new HashMap<String, Integer>(){{
		put("leader", 0);put("shikigami", 1);put("mitama", 2);put("service", 3);
		put("productInfo", 4);put("commodityInfo", 5);
		put("commodityDetail", 6);put("map", 7);put("taskInfo", 8);
	}};
	String [][] Table = {
		{"LEADERNO","LEADERNAME","LEADERURL","LEADERCREATEATTACK","LEADERDEVELOPATTACK","LEADERCREATELIFE","LEADERDEVELOPLIFE","LEADERCREATEDEFENCE","LEADERDEVELOPDEFENCE","LEADERCREATESPEED","LEADERCREATECRIT","LEADERCREATECRITICALDAMAGE","BIOGRAPHY"},
		{"SHIKIGAMINO","SHIKIGAMINAME","SHIKIGAMIURL","SHIKIGAMIXYD","ATTACK","DEVELOPATTACK","LIFE","DEVELOPLIFE","DEFENCE","DEVELOPDEFENCE","SPEED","CRIT","CRITICALDAMAGE","BIOGRAPHY"},
		{"MITAMANO","MITAMANAME","MITAMAURL","CREATEATTACK","DEVELOPATTACK","CREATELIFE","DEVELOPLIFE","CREATEDEFENCE","DEVELOPDEFENCE","CREATESPEED","DEVELOPSPEED","CREATECRIT","DEVELOPCRIT","CREATECRITICALDAMAGE","DEVELOPCRITICALDAMAGE","CREATEBLOCKING","DEVELOPBLOCKING","CREATERESISTANCE","DEVELOPRESISTANCE","SUITNATURE"},
		{"SERVICENO","SERVICENAME","CURRENTNUMBER","CAPACITY"},
		//{"USERNO","SERVICENO","GAMERNAME","IMAGEURL","REGISTTIME","UNIONNO","UNIONJOB","PVPGRADE","STATUS"},
		//玩家信息不可更改，防止管理员权限泛滥
		{"PRODUCTNO","PRODUCTNAME","PRODUCTDESCRIPTION"},
		{"COMMODITYNO","COMMODITYNAME","PRICE"},
		{"PRODUCTNO","COMMODITYNO","PCOUNT"},
		{"MAPNO","MAPNAME","IMAGEURL"},
		{"TASKNO","TASKNAME","TASKDESCRIPTION","QUATE"}
	};
	//int[] pkLen = new int[]{};
	public boolean executeUpt(String tableName, String pkValue, int uptIndex, String newValue)
	{
		boolean flag = false;             //操作是否成功
		String sSql = "";
		/*构造sql语句*/
		int idx = Index.get(tableName);
		String targetColName = Table[idx][uptIndex];
		String pkName = Table[idx][0];
		
		sSql = "update " + tableName + " set " + targetColName + " = ?" + " where " + pkName + " = ?";
				
		
System.out.println("daoODExecuteUpt.java: sSql="+sSql);

		PreparedStatement psmt = null;
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			psmt.setString(1, newValue);
			psmt.setString(2, pkValue);
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
}