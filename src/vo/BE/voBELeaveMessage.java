package vo.BE;

import java.sql.Date;

public class voBELeaveMessage {
	private String leaveMessageNo;
	private String userNo;
	private Date leaveMessageDate;
	private String leaveMessageContent;
	public String getLeaveMessageNo() {
		return leaveMessageNo;
	}
	public void setLeaveMessageNo(String leaveMessageNo) {
		this.leaveMessageNo = leaveMessageNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public Date getLeaveMessageDate() {
		return leaveMessageDate;
	}
	public void setLeaveMessageDate(Date leaveMessageDate) {
		this.leaveMessageDate = leaveMessageDate;
	}
	public String getLeaveMessageContent() {
		return leaveMessageContent;
	}
	public void setLeaveMessageContent(String leaveMessageContent) {
		this.leaveMessageContent = leaveMessageContent;
	}
	
}
