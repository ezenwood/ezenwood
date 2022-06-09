package com.ezen.ezenwood.common.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezen.ezenwood.common.dao.BasketDAO;
import com.ezen.ezenwood.common.dao.SubImageDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAO;

@Service("commonService")
public class CommonService {
	
	@Resource(name = "BasketDAO")
	BasketDAO basketDAO;
	
	@Resource(name = "GoodsDAO")
	GoodsDAO goodsDAO;
	
	@Resource(name = "SubImageDAO")
	SubImageDAO subImageDAO;
	

	public int insertCart(Map<String, Object> insertMap) {
		
		
		
		
		return basketDAO.insertCart(insertMap);
	}
	
	
	public List<Map<String,Object>> cartList(String MEMBER_ID){
		
		List<Map<String,Object>> result = basketDAO.cartList(MEMBER_ID);
		
		for(Map<String,Object> a : result) {
			
			String GOODS_NUM = ((BigDecimal) a.get("BASKET_GOODS_NUM")).toString();
			Map<String, Object> insertMap  = new HashMap<String, Object>();
			insertMap.put("GOODS_NUM", GOODS_NUM);
			Map<String, Object> goodsMap = goodsDAO.goodsDetail(insertMap);
			a.put("goodsMap", goodsMap);
			
			String subImage = subImageDAO.getSubImageByIDX(Integer.parseInt(GOODS_NUM));
			
			a.put("subImage", subImage);
			
			
		}
		
		
		return result;
	}
	
	public boolean deleteCart(Map<String,Object> insertMap) {
		
		String[] deleteArray = (String[]) insertMap.get("deleteArray");
		
		int checkNum = deleteArray.length;
		
		int deleteCartNum = 0;
		
		for(int i=0 ; i<checkNum ; i++) {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("BASKET_NUM", deleteArray[i]);
			map.put("MEMBER_ID", insertMap.get("MEMBER_ID"));
			deleteCartNum += basketDAO.deleteCart(map);
		}
		
		if(checkNum==deleteCartNum) {
			return true;
		}
		
		
		
		
		
		return false;
	}
	
	
	
	
	
	
	
	
	
}
