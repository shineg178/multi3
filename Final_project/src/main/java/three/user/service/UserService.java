package three.user.service;

import three.user.model.UserVO;

public interface UserService {

	// 회원가입
	int joinUser(UserVO vo);

	/* 로그인 */
	UserVO loginUser(UserVO user) throws Exception;


	/*
	 * // 구글회원가입 public void joinUserByGoogle(UserVO vo);
	 * 
	 * // 구글로그인 public UserVO loginUserByGoogle(UserVO vo);
	 */
	
	//아이디 찾기 
	String findId(UserVO vo);
	
	//비밀번호 찾기
	UserVO findPwd(UserVO vo);
	
	//구글로그인 유저 찾기
	UserVO findSocialUser(UserVO vo);
	
	//구글 회원가입
	int joinSocial(UserVO vo);

	int checkId(String userId);
	
	int updatePwd(UserVO vo);
	
	//유저VO 찾기
	UserVO findUserByUserId(String userId);

	
}
