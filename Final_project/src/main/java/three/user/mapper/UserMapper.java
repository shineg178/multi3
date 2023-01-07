package three.user.mapper;

import three.user.model.UserVO;

public interface UserMapper {

	// 회원가입
	int joinUser(UserVO vo);

	/* 로그인 */
	public UserVO loginUser(UserVO user);
	
	/* 유저찾기 */
	UserVO findUserByuserNum(int userNum);;

}
