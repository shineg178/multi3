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
	
	// 회원 닉네임
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

	// 회원 포인트
	private int userPoint;
	
	// 회원 이미지
	private String userImage;
	
	// 회원 자기소개
	private String userInfo;
	
	// 회원 브론즈뱃지
	private int userBronzeBadge;
	
	// 회원 실버뱃지
	private int userSilverBadge;
	
	// 회원 골드뱃지
	private int userGoldBadge;
	
	// 회원 트위터
	private int userTwitter;
		
	// 회원 페이스북
	private int userFacebook;
		
	// 회원 인스타그램
	private int userInstagram;
		
	// 회원 링크드인
	private int userLinkedin;
	
	// 회원 상태 (관리자, 일반회원, 소셜로그인, 탈퇴회원)
	private int userStatus;
	


	

}