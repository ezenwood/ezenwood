package com.ezen.ezenwood.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository("BasketDAO")
public class BasketDAO extends AbstractDAO {
	
	public int insertCart(Map<String, Object> insertMap) {
		
		
		
		return (int) insert("basket.insertAll", insertMap);
	}
	
	public List<Map<String, Object>> cartList(String MEMBER_ID){
		
		return selectList("basket.selectAll", MEMBER_ID);
	}
	
	public int deleteCart(Map<String, Object> map) {
		
		
		return (int) delete("basket.deleteBasket", map);
	}
	
	
	

}
