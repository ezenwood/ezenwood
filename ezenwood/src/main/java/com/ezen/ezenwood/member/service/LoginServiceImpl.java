package com.ezen.ezenwood.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ezen.ezenwood.member.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.login(map);
	}

	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findId(map);
	}

	@Override
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPw(map);
	}

	@Override
	public String selectid() throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectid();
	}

	@Override
	public int emailcheck(String MEMBER_NUM) {
		// TODO Auto-generated method stub
		return loginDAO.emailcheck(MEMBER_NUM);
	}
	
	

}
