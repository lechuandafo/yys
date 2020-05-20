package vo.BD;

import java.sql.Date;

public class voBDGamer {
	private String userNo;
	private String serviceNo;
	private String gamerName; 
	private Date registTime;
	private String imageURL;
	private String unionNo;
	private String unionJob;
	private int pvpGrade;
	private int status;	
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getServiceNo() {
		return serviceNo;
	}
	public void setServiceNo(String serviceNo) {
		this.serviceNo = serviceNo;
	}
	public String getGamerName() {
		return gamerName;
	}
	public void setGamerName(String gamerName) {
		this.gamerName = gamerName;
	}
	public Date getRegistTime() {
		return registTime;
	}
	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getUnionNo() {
		return unionNo;
	}
	public void setUnionNo(String unionNo) {
		this.unionNo = unionNo;
	}
	public String getUnionJob() {
		return unionJob;
	}
	public void setUnionJob(String unionJob) {
		this.unionJob = unionJob;
	}
	public int getPvpGrade() {
		return pvpGrade;
	}
	public void setPvpGrade(int pvpGrade) {
		this.pvpGrade = pvpGrade;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}