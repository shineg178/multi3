package three.user.mapper;

import three.user.model.UserVO;

public interface UserMapper {
	
	UserVO findUserByuserNum(int userNum);
	
	
}
