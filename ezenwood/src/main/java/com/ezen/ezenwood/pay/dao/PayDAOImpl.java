package com.ezen.ezenwood.pay.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;



@Repository("PayDAO")
public class PayDAOImpl extends AbstractDAO implements PayDAO {

	@Override
	public List<Map<String, Object>> step1(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> step2(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("member.selectOne", insertMap);
	}

	@Override
	public int step3Save(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (int) insert("orders.insertOrder", insertMap);
	}
	
	
	
	

}
