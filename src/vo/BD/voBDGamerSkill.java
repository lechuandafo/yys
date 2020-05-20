package vo.BD;


public class voBDGamerSkill {
	private String userNo;
	private String serviceNo;
	private String skillNo;
	private int skillLevel;
	private String belongToLeader;//主角拥有的技能，玩家给主角选择技能时，根据此码显示可选技能。
	
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
	public String getSkillNo() {
		return skillNo;
	}
	public void setSkillNo(String skillNo) {
		this.skillNo = skillNo;
	}
	public int getSkillLevel() {
		return skillLevel;
	}
	public void setSkillLevel(int skillLevel) {
		this.skillLevel = skillLevel;
	}
	public String getBelongToLeader() {
		return belongToLeader;
	}
	public void setBelongToLeader(String belongToLeader) {
		this.belongToLeader = belongToLeader;
	}
}