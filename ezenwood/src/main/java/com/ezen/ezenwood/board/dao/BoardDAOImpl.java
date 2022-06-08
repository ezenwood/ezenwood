package com.ezen.ezenwood.board.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.ezen.common.AbstractDAO;

@Repository(value="BoardDAO")
public class BoardDAOImpl extends AbstractDAO implements BoardDAO{

	//OTO
	@Override
	public int insertOTO(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (int) insert("onetoone.insertClient", insertMap);
	}

	@Override
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return selectList("onetoone.selectOTOList", insertMap);
	}

	@Override
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("onetoone.selectClientMine", insertMap);
	}

	@Override
	public Map<String, Object> AnswerForOTODetil(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("onetoone.AnswerForOTODetail", insertMap);
	}
	
	//FQ
	
	@Override
	public List<Map<String, Object>> FQList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return selectList("frequestion.frequestionList", insertMap);
	}
	
	//NOTICE

}
