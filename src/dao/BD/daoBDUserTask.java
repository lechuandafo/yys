package dao.BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BD.voBDUserTask;
import connDB.connyysDB;

public class daoBDUserTask {
	connyysDB connDB=new connyysDB();
	
	public ArrayList qryUserTask()
	{
		ArrayList UserTaskList=new ArrayList();
		ResultSet rs = null;
		PreparedStatement psmt = null;
		String sSql = "select a.*,b.*,c.*,d.* from taskInfo a,taskSchedule b,taskReward c,productNo d where a.taskNo=b.taskNo and b.taskNo=c.taskNo and c.productNo=d.productNo order by userNo,serviceNo,taskNo,productNo";		
		try {
			psmt = connDB.getConn().prepareStatement(sSql);
			rs  = psmt.executeQuery();	
			while (rs.next())
			{
			  //实例化vo
				voBDUserTask voBDUserTaskAll=new voBDUserTask();
				voBDUserTaskAll.setTaskNo(rs.getString("taskNo"));
				voBDUserTaskAll.setTaskName(rs.getString("taskName"));
				voBDUserTaskAll.setTaskDescription(rs.getString("taskDescription"));
				voBDUserTaskAll.setQuate(rs.getInt("quate"));
				voBDUserTaskAll.setUserNo(rs.getString("userNo"));
				voBDUserTaskAll.setServiceNo(rs.getString("serviceNo"));
				voBDUserTaskAll.setTaskCount(rs.getString("taskCount"));
				voBDUserTaskAll.setProductNo(rs.getString("productNo"));
				voBDUserTaskAll.setProductName(rs.getString("productName"));
				voBDUserTaskAll.setQuantity(rs.getInt("quantity"));
				UserTaskList.add(voBDUserTaskAll);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}finally
		{
			connDB.commitConn();
			connDB.closeConn();
		}
		return UserTaskList;		
	}	
}
