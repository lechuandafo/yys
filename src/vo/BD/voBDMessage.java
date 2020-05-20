package vo.BD;

import java.sql.Date;

public class voBDMessage {
	private String messageNo;
	private String userNo1;
	private String userNo2;
	private Date messageDate;
	private String messageContent;
	public String getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
	}
	public String getUserNo1() {
		return userNo1;
	}
	public void setUserNo1(String userNo1) {
		this.userNo1 = userNo1;
	}
	public String getUserNo2() {
		return userNo2;
	}
	public void setUserNo2(String userNo2) {
		this.userNo2 = userNo2;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	
	
	
}
