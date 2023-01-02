package three.user.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
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

	

}