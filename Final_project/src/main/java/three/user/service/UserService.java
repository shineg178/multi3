package three.user.service;

import three.user.model.UserVO;

public interface UserService {

	// 회원가입
	int joinUser(UserVO vo);

	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception;

	/* 로그인 */
	public UserVO loginUser(UserVO user) throws Exception;

}
