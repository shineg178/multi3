package three.user.model;

public class UserVO {
	
	//회원 번호
	private int userNum;
	
	// 회원 id
	private String userId;

	// 회원 비밀번호
	private String userPassword;

	// 회원 이름
	private String userName;
	
	//회원 닉네임
	private String userNick;

	// 회원 연락처
	private int userTel;
	
	// 회원 이메일
	private String userEmail;

	// 회원 우편번호
	private String userAddr1;

	// 회원 도로명 주소
	private String userAddr2;

	// 회원 상세주소
	private String userAddr3;

	// 관리자 구분(0:일반사용자, 1:관리자)
	private int adminCk;

	// 회원 포인트
	private int point;
	
	// 회원 은행명
	private String userBankName;
	
	// 회원 은행계좌
	private int userBankAccount;
	
	//회원 브론즈뱃지
	private int userBronzeBadge;
	
	//회원 실버뱃지
	private int userSilverBadge;
	
	//회원 골드뱃지
	private int userGoldBadge;

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getUserTel() {
		return userTel;
	}

	public void setUserTel(int userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

	public int getAdminCk() {
		return adminCk;
	}

	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getUserBankName() {
		return userBankName;
	}

	public void setUserBankName(String userBankName) {
		this.userBankName = userBankName;
	}

	public int getUserBankAccount() {
		return userBankAccount;
	}

	public void setUserBankAccount(int userBankAccount) {
		this.userBankAccount = userBankAccount;
	}

	public int getUserBronzeBadge() {
		return userBronzeBadge;
	}

	public void setUserBronzeBadge(int userBronzeBadge) {
		this.userBronzeBadge = userBronzeBadge;
	}

	public int getUserSilverBadge() {
		return userSilverBadge;
	}

	public void setUserSilverBadge(int userSilverBadge) {
		this.userSilverBadge = userSilverBadge;
	}

	public int getUserGoldBadge() {
		return userGoldBadge;
	}

	public void setUserGoldBadge(int userGoldBadge) {
		this.userGoldBadge = userGoldBadge;
	}

	@Override
	public String toString() {
		return "UserVO [userNum=" + userNum + ", userId=" + userId + ", userPassword=" + userPassword + ", userName="
				+ userName + ", userNick=" + userNick + ", userTel=" + userTel + ", userEmail=" + userEmail
				+ ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3 + ", adminCk="
				+ adminCk + ",  point=" + point + ", userBankName=" + userBankName
				+ ", userBankAccount=" + userBankAccount + ", userBronzeBadge=" + userBronzeBadge + ", userSilverBadge="
				+ userSilverBadge + ", userGoldBadge=" + userGoldBadge + "]";
	}

	

}