package com.ezen.ezenwood.member.dao;

import java.util.List;
import java.util.Map;

public interface LoginDAO {

	public Map<String, Object> login(Map<String, Object> map) throws Exception;

	public Map<String, Object> findId(Map<String, Object> map) throws Exception;

	public Map<String, Object> findPw(Map<String, Object> map) throws Exception;
	
	public String selectid() throws Exception;

}
