package com.ezen.ezenwood.member.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository(value = "JoinDAO")
public class JoinDAOImpl extends AbstractDAO implements JoinDAO {
	
	

	@Override
	public int InsertMember(Map<String, Object> insertMap) {
		
		
		
		return (int) insert("member.insertMember", insertMap);
	}

	@Override
	public int idCheck(Map<String, Object> insertMap) {
		String id = (String) selectOne("member.idCheck", insertMap);
		if(id==null||id.isEmpty()) {
			return 1;
		}else {
			return 0;
		}
		//1이 사용가능한 0은 이미존재하는 아이디
		
	}
	
	

}
