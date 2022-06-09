package com.ezen.ezenwood.pay.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezen.ezenwood.common.dao.SubImageDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAO;
import com.ezen.ezenwood.member.dao.JoinDAO;
import com.ezen.ezenwood.pay.dao.PayDAO;



@Service("PayService")
public class PayServiceImpl implements PayService {

	
	
	@Resource(name = "PayDAO")
	PayDAO payDAO;
	
	@Resource(name = "JoinDAO")
	JoinDAO joinDAO;
	
	@Resource(name = "SubImageDAO")
	SubImageDAO subImageDAO;
	
	@Resource(name = "GoodsDAO")
	GoodsDAO goodsDAO;
	
	
	 
	
	@Override
	public Map<String, Object> step1(Map<String, Object> insertMap) {
		
		
		String[] orderGoodsNumArray = ((String) insertMap.get("ORDERS_GOODS_NUM")).split(",");
		String[] orderGoodsAmountArray = ((String) insertMap.get("ORDERS_AMOUNT")).split(",");
		
		int ogn = orderGoodsNumArray.length;
		int oga = orderGoodsAmountArray.length;
		
		int goodsQuantity = oga;
		int priceSum = 0;
		int priceDSum = 0;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> payInfo = new HashMap<String,Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		if(oga!=oga) {
			// exception
		}else {
			if(oga==1) {
				// 구매 하려는 상품이 하나일 때
				insertMap.put("GOODS_NUM", insertMap.get("ORDERS_GOODS_NUM"));
				Map<String, Object> goodsMap = goodsDAO.goodsDetail(insertMap);
				int GOODS_NUM = Integer.parseInt((String)insertMap.get("ORDERS_GOODS_NUM"));
				 goodsMap.put("subImage", subImageDAO.getSubImageByIDX(GOODS_NUM));
				 goodsMap.put("GOODS_AMOUNT", insertMap.get("ORDERS_AMOUNT"));
				 
				 
				 priceSum = ((BigDecimal) goodsMap.get("GOODS_PRICE")).intValue() * oga;
				 priceDSum = ((BigDecimal) goodsMap.get("GOODS_DCOST")).intValue() * oga;
				 
				 
				 result.add(goodsMap);
			}else {
				for(int i = 0 ; i <oga ; i++) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("GOODS_NUM", orderGoodsNumArray[i]);
					Map<String, Object> goodsMap = goodsDAO.goodsDetail(map);
					int GOODS_NUM = Integer.parseInt(orderGoodsNumArray[i]);
					goodsMap.put("subImage", subImageDAO.getSubImageByIDX(GOODS_NUM));
					goodsMap.put("GOODS_AMOUNT", orderGoodsAmountArray[i]);
					
					priceSum += ((BigDecimal) goodsMap.get("GOODS_PRICE")).intValue() * Integer.parseInt(orderGoodsAmountArray[i]);
					priceDSum += ((BigDecimal) goodsMap.get("GOODS_DCOST")).intValue() ;
					
					result.add(goodsMap);
					
				}
				
			}
		}
		
		payInfo.put("orderGoodsNumArray", orderGoodsNumArray);
		payInfo.put("orderGoodsAmountArray", orderGoodsAmountArray);
		payInfo.put("goodsQuantity", oga);
		payInfo.put("priceSum", priceSum);
		payInfo.put("priceDSum", priceDSum);
		payInfo.put("payListMap", result);
		
		
		
		resultMap.put("payInfo", payInfo);
		resultMap.put("payListMap", result);
		


		
		
		
		
		return resultMap;
	}




	@Override
	public Map<String, Object> step2(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return payDAO.step2(insertMap);
	}




	@Override
	public Map<String, Object> step3(Map<String, Object> insertMap) {
		
		String[] orderGoodsNumArray = (String[]) ((Map<String,Object>)insertMap.get("payInfo")).get("orderGoodsNumArray");
		String[] orderGoodsAmountArray = (String[]) ((Map<String,Object>)insertMap.get("payInfo")).get("orderGoodsAmountArray");
		
		int ogn = orderGoodsNumArray.length;
		int oga = orderGoodsAmountArray.length;
		
		for(int i =0 ; i<oga ; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("GOODS_NUM", orderGoodsNumArray[i]);
			map.put("ORDER_AMOUNT", orderGoodsAmountArray[i]);
			map.put("MEMBER_ID", insertMap.get("MEMBER_ID"));
			map.put("ORDER_RECEIVER", insertMap.get("ORDER_RECEIVER"));
			map.put("ORDER_PHONE", insertMap.get("ORDER_PHONE"));
			map.put("ORDER_RZIPCODE", insertMap.get("ORDER_RZIPCODE"));
			map.put("ORDER_RADD1", insertMap.get("ORDER_RADD1"));
			map.put("ORDER_RADD2", insertMap.get("ORDER_RADD2"));
			map.put("ORDER_RADD3", insertMap.get("ORDER_RADD3"));
			map.put("ORDER_DMEMO", insertMap.get("ORDER_DMEMO"));
			
			int cnum = payDAO.step3Save(map);
			if(cnum!=1) {
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			}
			
			
			
			
		}
		//
		
		
		
		
		
		
		
		return null;
	}

	
	
	
	
	
	
	
	
	
}
