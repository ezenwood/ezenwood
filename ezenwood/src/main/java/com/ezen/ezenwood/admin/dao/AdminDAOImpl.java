package com.ezen.ezenwood.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;

@Repository(value = "AdminDAO")
public class AdminDAOImpl extends AbstractDAO implements AdminDAO {

	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList(null, map);
	}

	@Override
	public Map<String, Object> adminGoodsDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminGoodsUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminGoodsDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminGoodsInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminMemberList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminMemberUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminMemberDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminOrderUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOrderDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminNoticeUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminNoticeDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminNoticeInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminQNAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminQNADetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminQNAInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminQNAUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminQNADelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminReviewDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminReviewInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminReviewUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminReviewDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminOTOList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminOTODetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminOTOUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOTODelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOTOInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> adminFQList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("frequestion.frequestionList",map);
	}

	@Override
	public Map<String, Object> adminFQDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("frequestion.frequestionDetail",map);
	}

	@Override
	public int adminFQUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminFQDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminFQInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> adminAboutDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminAboutUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminAboutInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
