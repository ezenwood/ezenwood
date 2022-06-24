package com.ezen.ezenwood.board.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	
	
	//OTO
	public int insertOTO(Map<String, Object> insertMap, HttpServletRequest request) throws Exception;
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap);
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap);
	public Map<String, Object> getOTODelete(Map<String, Object> insertMap);



	//FQ
	public List<Map<String, Object>> FQList (Map<String, Object> insertMap);
	
	 

	//Notice
	public List<Map<String, Object>> NoticeList(Map<String, Object> insertMap);
	public Map<String, Object> getNoticeDetail(Map<String, Object> insertMap);
	public Map<String, Object> getinsertOTOGET(Map<String, Object> insertMap);


}
