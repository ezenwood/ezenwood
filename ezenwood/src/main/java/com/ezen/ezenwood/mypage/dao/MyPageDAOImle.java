package com.ezen.ezenwood.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;

@Repository("MyPageDAO")
public class MyPageDAOImle extends AbstractDAO implements MyPageDAO{

	@Override
	public Map<String, Object> memberInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("member.selectOneByMemberNum", map);
	}

	@Override
	public int memberUpdate(Map<String, Object> map) {
		return (int) update("Member.updateMember", map);
	}

	@Override
	public int memberDelete(Map<String, Object> map) {
		return (int) update("Member.deleteMember", map);
	}

	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("orders.selectAll", map);
	}

	@Override
	public Map<String, Object> deliveryTracking(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("order.selectAllByStatus", map);
	}

	@Override
	public Map<String, Object> cancelOrder(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("order.deleteOrder", map);
	}

	@Override
	public List<Map<String, Object>> memberReivewList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("review.selectClientReview", map);
	}

	@Override
	public List<Map<String, Object>> memberQNAList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("qna.selectClientQna", map);
	}

	@Override
	public List<Map<String, Object>> memberOTOList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("onetoone.selectClientMine", map);
	}
	
	

}
