package com.ezen.ezenwood.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository(value = "GoodsDAO")
public class GoodsDAOImpl extends AbstractDAO implements GoodsDAO {
	
	
	
	
	
	@Override
	public String getGoodsTitle(String GOODS_NUM) {
		// TODO Auto-generated method stub
		return (String) selectOne("goods.selectGoodsTitle", GOODS_NUM);
	}




	@Override
	public List<Map<String, Object>> getQNAListForDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("qna.selectQNAForDetail", map);
	}




	public int insertQNA(Map<String, Object> insertMap) {
		
		return (int) insert("qna.clientQna", insertMap);
	}

	
	
	
	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("goods.goodsDetailPage", insertMap);
	}




	@Override
	public List<Map<String, Object>> goodList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return selectList("goods.selectAll", insertMap);
	}
	
	

	
}
