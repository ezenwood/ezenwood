package com.ezen.ezenwood.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;

@Repository("ImageDAO")
public class ImageDAO extends AbstractDAO {
	
	public int insertImage(Map<String, Object> insertMap) {
		
		return (int) insert("image.insertImage", insertMap);
		
	}
	
	
	public String selectImage(Map<String, Object> insertMap) {
		
		return (String) selectOne("image.selectImage", insertMap);
	}
	
	public List<Map<String,Object>> selectImages(Map<String, Object> insertMap){
		return selectList("image.selectImages",insertMap);
	}
	

	
	public int updateGoods(Map<String, Object> insertMap) {
		
		return (int)update("image.updateImage", insertMap);
	}

}
