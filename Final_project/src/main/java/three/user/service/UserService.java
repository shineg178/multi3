package three.user.service;

import three.user.model.UserVO;

public interface UserService {

	//회원가입
	int joinUser(UserVO vo);
	
	/* 로그인 */
    int loginUser(UserVO vo);
	
}
