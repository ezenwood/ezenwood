package com.ezen.ezenwood.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ezen.common.AbstractDAO;

@Repository("MyPageDAO")
public class MyPageDAOImle extends AbstractDAO implements MyPageDAO{
	
	@Override
	public Map<String,Object> orderStatus(Map<String,Object> map) {
	return (Map<String,Object>) selectOne("orders.orderStatus", map);
}

	@Override
	public Map<String, Object> memberInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("member.selectOneByMemberNum", map);
	}

	@Override
	public int memberUpdate(Map<String, Object> map) {
		return (int) update("member.updateMember", map);
	}

	@Override
	public int memberDelete(Map<String, Object> map) {
		return (int) update("member.deleteMember", map);
	}
	
	
	

	@Override
	public int orderCancle(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("orders.orderCancle", map);
	}

	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("orders.selectAllNo6", map);
	}

	@Override
	public Map<String, Object> deliveryTracking(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("orders.selectAllByStatus", map);
	}

	@Override
	//주문취소 내역보기
	public List<Map<String,Object>> cancelOrder(Map<String, Object> map) {
		return (List<Map<String,Object>>) selectList("orders.selectCancel", map);
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

	@Override
	public int ordercount() {
		return (int) selectOne("orders.selectorders");
	}
	
	

}
