package three.user.service;

import java.io.BufferedReader;
import com.google.gson.JsonParser;
import com.google.gson.JsonElement;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;

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


	@Override
	public int checkId(String userId) {
		int cnt = usermapper.checkId(userId);
		System.out.println("cnt: "+cnt);
		return cnt;
	}

	@Override
	public String findId(UserVO vo) {
		return usermapper.findId(vo);
	}

	@Override
	public UserVO findPwd(UserVO vo) {
		return usermapper.findPwd(vo);
	}

	@Override
	public UserVO findSocialUser(UserVO vo) {
		return usermapper.findSocialUser(vo);
	}

	@Override
	public int joinSocial(UserVO vo) {
		return usermapper.joinSocial(vo);
	}

	@Override
	public int updatePwd(UserVO vo) {
		return usermapper.updatePwd(vo);
	}



}
