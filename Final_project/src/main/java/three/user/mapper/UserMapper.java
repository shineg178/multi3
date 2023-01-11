package three.user.mapper;

import three.user.model.UserVO;

public interface UserMapper {

	// 회원가입
	int joinUser(UserVO vo);

	/* 로그인 */
	UserVO loginUser(UserVO user);
	
	//아이디 찾기 
	String findId(UserVO vo);
	
	//비밀번호 찾기
	String findPwd(UserVO vo);
	
	//구글로그인 유저 찾기
	UserVO findSocialUser(UserVO vo);
	
	//구글 회원가입
	int joinSocial(UserVO vo);

	/* 유저찾기 */
	UserVO findUserByuserNum(int userNum);;

	//아이디 중복체크
	int checkId(String userId);
}
