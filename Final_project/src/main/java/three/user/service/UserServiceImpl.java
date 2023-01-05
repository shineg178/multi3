package three.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.user.mapper.UserMapper;
import three.user.model.UserVO;

@Service("userservice")
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper usermapper;

	// 회원가입
	@Override
	public int joinUser(UserVO vo) {

		return usermapper.joinUser(vo);
	}

	/* 로그인 */
	@Override
	public UserVO loginUser(UserVO user) throws Exception {

		return usermapper.loginUser(user);
	}

	// 구글 회원가입
	/*
	 * @Override public void joinUserByGoogle(UserVO vo) { usermapper.joinUser(vo);
	 * }
	 */

	// 구글 로그인
	/*
	 * @Override public UserVO loginUserByGoogle(UserVO vo) { UserVO returnVO =
	 * null; try { returnVO = usermapper.(vo.getUserId(), vo.getUserPassword());
	 * System.out.println("S: 로그인 아이디: " + vo.getUserId() + " 비번: " +
	 * vo.getUserPassword() + " 이름: " + vo.getUserName()); } catch (Exception e) {
	 * e.printStackTrace(); returnVO = null; // 실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 =
	 * 예외처리 } return returnVO; }
	 */

}
