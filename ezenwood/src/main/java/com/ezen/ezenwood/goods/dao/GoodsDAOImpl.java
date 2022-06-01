package com.ezen.ezenwood.goods.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository(value = "GoodsDAO")
public class GoodsDAOImpl extends AbstractDAO implements GoodsDAO {
	public int insertQNA(Map<String, Object> insertMap) {
		
		return (int) insert("qna.clientQna", insertMap);
	}

	
}
