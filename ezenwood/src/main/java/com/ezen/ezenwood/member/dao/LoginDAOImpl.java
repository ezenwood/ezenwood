package com.ezen.ezenwood.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository("loginDAO")
public class LoginDAOImpl extends AbstractDAO implements LoginDAO {
	
	//로그인
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectId", map);
	}
	
	//아이디 찾기
	@Override
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.selectIdByEmail", map);
	}

	//비밀번호 찾기
	@Override
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.selectPw", map);
	}
	
	
}
