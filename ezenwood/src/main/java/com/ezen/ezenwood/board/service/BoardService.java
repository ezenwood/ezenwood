package com.ezen.ezenwood.board.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	
	
	//OTO
	public int insertOTO(Map<String, Object> insertMap, HttpServletRequest request);
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap);
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap);
	public int OTODelete(Map<String, Object> insertMap, HttpServletRequest request);

	//FQ
	public List<Map<String, Object>> FQList (Map<String, Object> insertMap);
	 

	//Notice
	public List<Map<String, Object>> NoticeList(Map<String, Object> insertMap);
	public Map<String, Object> getNoticeDetail(Map<String, Object> insertMap);
		


}
