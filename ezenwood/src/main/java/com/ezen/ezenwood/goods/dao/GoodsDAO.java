package com.ezen.ezenwood.goods.dao;

import java.util.List;
import java.util.Map;

public interface GoodsDAO {
	public int insertQNA(Map<String, Object> insertMap);
	
	public List<Map<String, Object>> goodList(Map<String, Object> insertMap);
	
	public Map<String, Object> goodsDetail(Map<String, Object> insertMap);
	
	public String getGoodsTitle(String GOODS_NUM);
	
	public List<Map<String, Object>> getQNAListForDetail(Map<String, Object> map);

	public Map<String, Object> getQNADetail(Map<String, Object> insertMap);
	
	public Map<String, Object> AnswerForQNADetil(Map<String, Object> insertMap);
	
	public List<Map<String, Object>> QNAList(Map<String, Object> insertMap);
	
	
	public int insertReview(Map<String, Object> insertMap);
	
	public List<Map<String, Object>> getReviewListForDetail(Map<String, Object> map);
	
	public Map<String, Object> getReviewDetail(Map<String,Object> map);
	
	
	
}
