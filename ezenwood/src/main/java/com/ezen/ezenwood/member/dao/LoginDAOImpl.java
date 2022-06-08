package com.ezen.ezenwood.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository("loginDAO")
public class LoginDAOImpl extends AbstractDAO implements LoginDAO {
	
	//�α���
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectId", map);
	}
	
	//���̵� ã��
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectIdByEmail", map);
	}

	//��й�ȣ ã��
	@Override
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectPw", map);
	}
	
	
}
