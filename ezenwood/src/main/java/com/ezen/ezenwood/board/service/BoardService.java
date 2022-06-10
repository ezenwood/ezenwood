package com.ezen.ezenwood.board.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	
	
	//OTO
	public int insertOTO(Map<String, Object> insertMap, HttpServletRequest request);
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap);
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap);
	
	

	//FQ
	public List<Map<String, Object>> FQList (Map<String, Object> insertMap);
	public Map<String, Object> getOTODelete(Map<String, Object> insertMap);
	 
		// TODO Auto-generated method stub
		
	

}
