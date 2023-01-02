package three.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.user.mapper.UserMapper;
import three.user.model.UserVO;

@Service("userservice")
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper usermapper;

	@Override
	public int joinUser(UserVO vo) {
		
		return usermapper.joinUser(vo);
	}
	
	/* 로그인 */
	@Override
	public UserVO loginUser(UserVO user) throws Exception {
		
		return usermapper.loginUser(user);
	}
	


}
