package vo.BD;


public class voBDGamerSkill {
	private String userNo;
	private String serviceNo;
	private String skillNo;
	private int skillLevel;
	private String belongToLeader;//����ӵ�еļ��ܣ���Ҹ�����ѡ����ʱ�����ݴ�����ʾ��ѡ���ܡ�
	
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