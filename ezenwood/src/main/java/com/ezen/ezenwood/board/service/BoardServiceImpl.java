package com.ezen.ezenwood.board.service;

import java.io.IOException; 
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ezen.ezenwood.common.dao.ImageDAO;
import com.ezen.common.ImageSaver;
import com.ezen.ezenwood.board.dao.BoardDAO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "BoardDAO")
	BoardDAO boardDAO;

	@Resource(name = "ImageDAO")
	ImageDAO imageDAO;
	
	ImageSaver imageSaver = new ImageSaver();

	// OTO
	@Override
	public int insertOTO(Map<String, Object> insertMap, HttpServletRequest request) throws Exception{

		int checkNum = boardDAO.insertOTO(insertMap);
		
		if(checkNum==1) {
			insertMap.put("IMAGE_TABLENAMES_TABLENAME", "ONETOONE");
			insertMap.put("IMAGE_PARENT", insertMap.get("SONETOONE_NUM"));
			
			ImageSaver imageSaver = new ImageSaver();
			
			imageSaver.insertOTO(insertMap);
			
			imageDAO.insertImage(insertMap);
			
		}

		return checkNum;
	}
	@Override
	public Map<String, Object> getinsertOTOGET(Map<String, Object> insertMap) {
		
		return boardDAO.InsertOTOGET(insertMap);
	}


	@Override
	public List<Map<String, Object>> OTOList(Map<String, Object> insertMap) {

		return boardDAO.OTOList(insertMap);
	}

	@Override
	public Map<String, Object> getOTODetail(Map<String, Object> insertMap) {

		insertMap.put("IMAGE_TABLENAMES_TABLENAME", "ONETOONE");
		insertMap.put("IMAGE_PARENT", insertMap.get("ONETOONE_NUM"));
		
		Map<String, Object> resultMap = boardDAO.getOTODetail(insertMap);
		resultMap.put("Answer", boardDAO.AnswerForOTODetil(resultMap));
		String otoImage = imageDAO.selectImage(insertMap);
		
		
		resultMap.put("otoImage", otoImage);

		return resultMap;
	}

	@Override
	public Map<String, Object> getOTODelete(Map<String, Object> insertMap) {
		Map<String, Object> resultMap = boardDAO.getOTODetail(insertMap);

		resultMap.put("Delete", boardDAO.OTODelete(insertMap));

		// String BOARD_IMAGE = imageDAO.selectImage(resultMap);
		// resultMap.put("BOARD_IMAGE", BOARD_IMAGE);

		return resultMap;
	}

	// FQ
	@Override
	public List<Map<String, Object>> FQList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return boardDAO.FQList(insertMap);
	}



	// NOTICE
	@Override
	public List<Map<String, Object>> NoticeList(Map<String, Object> insertMap) {
		return boardDAO.NoticeList(insertMap);
	}

	@Override
	public Map<String, Object> getNoticeDetail(Map<String, Object> map) {
		Map<String, Object> resultMap = boardDAO.getNoticeDetail(map);
		
		map.put("IMAGE_TABLENAMES_TABLENAME", "NOTICE");
		map.put("IMAGE_PARENT", map.get("NOTICE_NUM"));
		
		String NOTICE_IMAGE = imageDAO.selectImage(map);
		resultMap.put("NOTICE_IMAGE", NOTICE_IMAGE);
		
		return resultMap;
	}

	



}
