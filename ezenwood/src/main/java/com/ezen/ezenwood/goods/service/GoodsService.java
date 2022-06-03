package com.ezen.ezenwood.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	
	public List<Map<String, Object>> goodsList(Map<String, Object> map);
	
	public int insertQNA(Map<String, Object> insertMap, HttpServletRequest request);
	
	public Map<String,Object> goodsDetail(Map<String, Object> insertMap);
	
	public String getGoodsTitle(String GOODS_NUM);
	
	public List<Map<String, Object>> getQNAListForDetail(Map<String, Object> map);
	
	public Map<String, Object> getQNADetail(Map<String, Object> insertMap);
	
	public List<Map<String,Object>> QNAList(Map<String, Object> insertMap);
	
	
	public int insertReview(Map<String, Object> insertMap, HttpServletRequest request);
	
	public List<Map<String, Object>> getReviewListForDetail(Map<String, Object> map);
	
	public Map<String, Object> getReviewDetail(Map<String,Object> map);
	
	
	

}
