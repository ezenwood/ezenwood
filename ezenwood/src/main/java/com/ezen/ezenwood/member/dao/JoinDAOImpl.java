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
		
		
		return (int) insert("Member.insertMember", insertMap);
	}

	@Override
	public int idCheck(Map<String, Object> insertMap) {
		String id = (String) selectOne("Member.idCheck", insertMap);
		if(id==null||id.isEmpty()) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	

}
