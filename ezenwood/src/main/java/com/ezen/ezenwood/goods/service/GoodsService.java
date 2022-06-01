package com.ezen.ezenwood.goods.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	public int insertQNA(Map<String, Object> insertMap, HttpServletRequest request);

}
