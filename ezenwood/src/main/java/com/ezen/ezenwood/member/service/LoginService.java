package com.ezen.ezenwood.member.service;

import java.util.List;
import java.util.Map;

public interface LoginService {

	public Map<String, Object> login(Map<String, Object> map) throws Exception;

	public Map<String, Object> findId(Map<String, Object> map) throws Exception;

	public Map<String, Object> findPw(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectid(String MEMBER_ID) throws Exception;

}
