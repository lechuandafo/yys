package vo.BE;

import java.sql.Date;

public class voBEUnionInfo {
	private String unionNo;
	private String unionName;
	private Date createTime;
	public String getUnionNo() {
		return unionNo;
	}
	public void setUnionNo(String unionNo) {
		this.unionNo = unionNo;
	}
	public String getUnionName() {
		return unionName;
	}
	public void setUnionName(String unionName) {
		this.unionName = unionName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
