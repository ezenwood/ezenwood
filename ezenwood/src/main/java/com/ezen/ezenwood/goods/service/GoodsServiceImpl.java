package com.ezen.ezenwood.goods.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ezen.common.ImageSaver;
import com.ezen.ezenwood.common.dao.ImageDAO;
import com.ezen.ezenwood.common.dao.SubImageDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAO;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService {
	
	
	@Resource(name = "GoodsDAO")
	GoodsDAO goodsDAO;
	
	
	@Resource(name = "SubImageDAO")
	SubImageDAO subImageDAO;
	
	@Resource(name = "ImageDAO")
	ImageDAO imageDAO;
	
	ImageSaver imageSaver = new ImageSaver();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int qnaDelete(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return goodsDAO.qnaDelete(insertMap);
	}














	@Override
	public int reviewDelete(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return goodsDAO.reviewDelete(insertMap); 
	}














	@Override
	public List<Map<String, Object>> goodsList(Map<String, Object> map) {
		
		List<Map<String,Object>> listMap = goodsDAO.goodList(map);
		
		for(Map<String,Object> goodsmap : listMap) {
			System.out.println(((BigDecimal)goodsmap.get("GOODS_NUM")).intValue());
			int SUBIMAGE_PARENT = ((BigDecimal)goodsmap.get("GOODS_NUM")).intValue();
			String GOODS_SUBIMAGE = subImageDAO.getSubImageByIDX(SUBIMAGE_PARENT);
			goodsmap.put("GOODS_SUBIMAGE", GOODS_SUBIMAGE);
			
		}
		
		
		
		return listMap;
	}














	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> insertMap) {
		Map<String, Object> goodsmap = goodsDAO.goodsDetail(insertMap);
		
		int SUBIMAGE_PARENT = ((BigDecimal)goodsmap.get("GOODS_NUM")).intValue();
		String GOODS_SUBIMAGE = subImageDAO.getSubImageByIDX(SUBIMAGE_PARENT);
		
		
		
		goodsmap.put("GOODS_SUBIMAGE", GOODS_SUBIMAGE);
		
		
		
		insertMap.put("IMAGE_TABLENAMES_TABLENAME", "GOODS");
		insertMap.put("IMAGE_PARENT", SUBIMAGE_PARENT);
		String GOODS_IMAGE = imageDAO.selectImage(insertMap);
		
		
		
		
		goodsmap.put("GOODS_IMAGE", GOODS_IMAGE);
		
		return goodsmap;
	}














	@Override
	public String getGoodsTitle(String GOODS_NUM) {
		// TODO Auto-generated method stub
		return goodsDAO.getGoodsTitle(GOODS_NUM);
	}














	@Override
	public List<Map<String, Object>> getQNAListForDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.getQNAListForDetail(map);
	}














	@Override
	public List<Map<String, Object>> QNAList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return goodsDAO.QNAList(insertMap); 
	}














	@Override
	public int insertReview(Map<String, Object> insertMap, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		int checkNum = goodsDAO.insertReview(insertMap);
		
		try {
			insertMap.put("IMAGE_TABLENAMES_TABLENAME", "REVIEW");
			insertMap.put("IMAGE_PARENT", insertMap.get("REVIEW_NUM"));
			
			insertMap = imageSaver.saveImageFile(insertMap, request);
			
			if(insertMap.get("IMAGE_STD")==null) {
				
			}else {
				imageDAO.insertImage(insertMap);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		
		
		return checkNum;
	}














	@Override
	public Map<String, Object> getReviewDetail(Map<String, Object> map) {
		Map<String, Object> resultMap = goodsDAO.getReviewDetail(map);
		
		map.put("IMAGE_TABLENAMES_TABLENAME", "REVIEW");
		map.put("IMAGE_PARENT", map.get("REVIEW_NUM"));
		map.put("GOODS_NUM", resultMap.get("REVIEW_PARENT"));
		String REVIEW_IMAGE = imageDAO.selectImage(map);
		
		resultMap.put("REVIEW_IMAGE", REVIEW_IMAGE);
		
		
		Map<String,Object> goodsMap =goodsDAO.goodsDetail(map);
		
		resultMap.put("goodsMap", goodsMap);
		
		String GOODS_SUBIMAGE = subImageDAO.getSubImageByIDX(((BigDecimal)map.get("GOODS_NUM")).intValue());
		
		resultMap.put("GOODS_SUBIMAGE", GOODS_SUBIMAGE);
		
		
		
		
		return resultMap;
	}














	@Override
	public List<Map<String, Object>> getReviewListForDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.getReviewListForDetail(map);
	}














	@Override
	public Map<String, Object> getQNADetail(Map<String, Object> insertMap) {
		Map<String, Object> resultMap = goodsDAO.getQNADetail(insertMap);
		
		resultMap.put("Answer", goodsDAO.AnswerForQNADetil(resultMap));
		
		resultMap.put("GOODS_NUM", resultMap.get("QNA_PARENT"));
		resultMap.put("IMAGE_TABLENAMES_TABLENAME", "QNA");
		resultMap.put("IMAGE_PARENT", resultMap.get("QNA_NUM"));
		
		resultMap.put("GoodsMap", goodsDAO.goodsDetail(resultMap));
		
		
		
		String GOODS_SUBIMAGE = subImageDAO.getSubImageByIDX(((BigDecimal)((Map<String, Object>)resultMap.get("GoodsMap")).get("GOODS_NUM")).intValue());
		
		String  QNA_IMAGE = imageDAO.selectImage(resultMap);
		resultMap.put("QNA_IMAGE", QNA_IMAGE);
		resultMap.put("GOODS_SUBIMAGE", GOODS_SUBIMAGE);
		
		
		
		return resultMap;
	}














	public int insertQNA(Map<String, Object> insertMap, HttpServletRequest request) {
		
		goodsDAO.insertQNA(insertMap);
		
		try {
			insertMap.put("IMAGE_TABLENAMES_TABLENAME", "QNA");
			insertMap.put("IMAGE_PARENT", insertMap.get("QNA_NUM"));
			Map<String,Object> returnMap = imageSaver.saveImageFile(insertMap, request);
			if(returnMap.get("IMAGE_ORG")==null) {
				
			}else {
			imageDAO.insertImage(insertMap);
			}
		} catch (Exception e) {
			// image store fail
			e.printStackTrace();
		
		
		return 0;
	}
		return 1;

}
}
