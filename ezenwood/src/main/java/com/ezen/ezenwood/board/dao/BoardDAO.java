package com.ezen.ezenwood.board.dao;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	
	//OTO
	public int insertOTO(Map<String, Object> insertMap);
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap);
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap);
	public Map<String, Object> AnswerForOTODetil(Map<String, Object> insertMap);
	public int OTODelete(Map<String, Object> insertMap);

	
	//FQ
	public List<Map<String, Object>> FQList (Map<String, Object> insertMap);
	

	//NOTICE
	public List<Map<String, Object>> NoticeList(Map<String, Object> insertMap);
	public Map<String, Object> getNoticeDetail(Map<String, Object> insertMap);
	
}
