package com.ezen.ezenwood.board.dao;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	
	//OTO
	public int insertOTO(Map<String, Object> insertMap);
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap);
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap);
	public Map<String, Object> AnswerForOTODetil(Map<String, Object> insertMap);

	
	//FQ
	
	//NOTICE
	
	
}