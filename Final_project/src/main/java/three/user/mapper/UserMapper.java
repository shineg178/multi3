package three.user.mapper;

import three.user.model.UserVO;

public interface UserMapper {

	// 회원가입
	int joinUser(UserVO vo);

	/* 로그인 */
	public UserVO loginUser(UserVO user);

	UserVO findUserByuserNum(int userNum);

	//아이디 중복체크
	int checkId(String userId);
}
