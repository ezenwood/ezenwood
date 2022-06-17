package com.ezen.ezenwood.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;


@Repository(value = "GoodsDAO")
public class GoodsDAOImpl extends AbstractDAO implements GoodsDAO {
	
	
	
	
	
	
	
	
	
	
	@Override
	public int reviewDelete(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (int) update("review.reviewDelete", insertMap);
	}




	@Override
	public int qnaDelete(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (int) update("qna.qnaDelete", insertMap);
	}




	@Override
	public String getGoodsTitle(String GOODS_NUM) {
		// TODO Auto-generated method stub
		return (String) selectOne("goods.selectGoodsTitle", GOODS_NUM);
	}




	@Override
	public List<Map<String, Object>> getQNAListForDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("qna.selectQNAForDetailinsu", map);
	}




	public int insertQNA(Map<String, Object> insertMap) {
		
		return (int) insert("qna.clientQna", insertMap);
	}

	
	
	
	
	
	@Override
	public Map<String, Object> getQNADetail(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("qna.selectQNADetailForClient", insertMap);
	}




	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("goods.goodsDetailPage", insertMap);
	}


	
	


	@Override
	public Map<String, Object> getReviewDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("review.selectReviewDetail", map);
	}




	@Override
	public List<Map<String, Object>> getReviewListForDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("review.selectReviewList", map);
	}




	@Override
	public int insertReview(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (int) insert("review.insertReview", insertMap);
	}




	@Override
	public List<Map<String, Object>> QNAList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return selectList("qna.selectQNAList", insertMap);
	}




	@Override
	public Map<String, Object> AnswerForQNADetil(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("qna.AnswerForQNADetail", insertMap);
	}




	@Override
	public List<Map<String, Object>> goodList(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		
		return selectList("goods.selectAll", insertMap);
	}
	
	

	
}
