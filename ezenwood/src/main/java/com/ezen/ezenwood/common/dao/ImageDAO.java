package com.ezen.ezenwood.common.dao;

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

}
