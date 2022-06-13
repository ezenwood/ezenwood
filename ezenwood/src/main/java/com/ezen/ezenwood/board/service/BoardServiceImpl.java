package com.ezen.ezenwood.board.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ezen.ezenwood.common.dao.ImageDAO;

import com.ezen.ezenwood.board.dao.BoardDAO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "BoardDAO")
	BoardDAO boardDAO;

	@Resource(name = "ImageDAO")
	ImageDAO imageDAO;

	// OTO
	@Override
	public int insertOTO(Map<String, Object> insertMap, HttpServletRequest request) {

		int checkNum = boardDAO.insertOTO(insertMap);

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
		Map<String, Object> resultMap = boardDAO.getOTODetail(insertMap);

		resultMap.put("Answer", boardDAO.AnswerForOTODetil(resultMap));

		// String BOARD_IMAGE = imageDAO.selectImage(resultMap);
		// resultMap.put("BOARD_IMAGE", BOARD_IMAGE);

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
		return resultMap;
	}

	



}
