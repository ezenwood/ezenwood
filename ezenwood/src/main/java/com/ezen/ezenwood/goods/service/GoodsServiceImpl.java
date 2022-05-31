package com.ezen.ezenwood.goods.service;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ezen.common.ImageSaver;
import com.ezen.ezenwood.common.dao.ImageDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAO;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService {
	
	
	@Resource(name = "GoodsDAO")
	GoodsDAO goodsDAO;
	
	@Resource(name = "ImageDAO")
	ImageDAO imageDAO;
	
	ImageSaver imageSaver = new ImageSaver();
	
	
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
