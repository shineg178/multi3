package three.user.mapper;

import three.user.model.UserVO;

public interface UserMapper {

	// 회원가입
	int joinUser(UserVO vo);

	/* 로그인 */
	public UserVO loginUser(UserVO user);

	UserVO findUserByuserNum(int userNum);
	
	//아이디 찾기 
	String findId(UserVO vo);
	
	//비밀번호 찾기
	String findPwd(UserVO vo);

}
