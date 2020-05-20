package vo.BD;

import java.sql.Timestamp;

public class voBDbuyMitama {
	private String userNo;
	private String serviceNo;
	private String mitamaNo;
	private Timestamp buyTimem;
	private String mcount;
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
	public Timestamp getBuyTimem() {
		return buyTimem;
	}
	public void setBuyTimem(Timestamp buyTimem) {
		this.buyTimem = buyTimem;
	}
	public String getMcount() {
		return mcount;
	}
	public void setMcount(String mcount) {
		this.mcount = mcount;
	}
	public String getMitamaNo() {
		return mitamaNo;
	}
	public void setMitamaNo(String mitamaNo) {
		this.mitamaNo = mitamaNo;
	}

}

