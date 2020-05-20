package vo.BD;

import java.sql.Date;

public class voBDReply {
	private String replyNo;
	private String leaveMessageNo;
	private String administratorNo;
	private Date replyDate;
	private String replyContent;
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public String getLeaveMessageNo() {
		return leaveMessageNo;
	}
	public void setLeaveMessageNo(String leaveMessageNo) {
		this.leaveMessageNo = leaveMessageNo;
	}
	public String getAdministratorNo() {
		return administratorNo;
	}
	public void setAdministratorNo(String administratorNo) {
		this.administratorNo = administratorNo;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
}
