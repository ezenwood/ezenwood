package com.ezen.ezenwood.goods.service;

import java.io.IOException;
import java.math.BigDecimal;
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














	public int insertQNA(Map<String, Object> insertMap, HttpServletRequest request) {
		
		goodsDAO.insertQNA(insertMap);
		
		try {
			insertMap.put("IMAGE_TABLENAMES_TABLENAME", "QNA");
			insertMap.put("IMAGE_PARENT", insertMap.get("QNA_NUM"));
			Map<String,Object> returnMap = imageSaver.saveImageFile(insertMap, request);
			imageDAO.insertImage(insertMap);
		} catch (Exception e) {
			// image store fail
			e.printStackTrace();
		
		
		return 0;
	}
		return 1;

}
}
