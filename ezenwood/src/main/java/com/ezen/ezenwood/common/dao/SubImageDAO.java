package com.ezen.ezenwood.common.dao;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;

@Repository("SubImageDAO")
public class SubImageDAO extends AbstractDAO{
	
	public String getSubImageByIDX(int parent) {
		
		
		return (String) selectOne("subimage.selectOne", parent);
	}

	
}
