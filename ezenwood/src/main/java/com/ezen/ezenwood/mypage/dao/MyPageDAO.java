package com.ezen.ezenwood.mypage.dao;

import java.util.List;
import java.util.Map;

public interface MyPageDAO {
	
	//member
	//내정보 가져오기
	public Map<String,Object> memberInfo(Map<String,Object> map);
	
	//회원 수정
	public int memberUpdate(Map<String,Object> map);
	
	//회원 탈퇴 
	public int memberDelete(Map<String,Object> map);
	
	//주문(order)
	//orderList
	public List<Map<String,Object>> orderList(Map<String,Object> map);
	
	//배송조회
	public Map<String, Object> deliveryTracking(Map<String,Object> map);
	
	//취소내역
	public Map<String,Object> cancelOrder(Map<String,Object> map);
	
	
	//리뷰(review)
	//review List
	public List<Map<String,Object>> memberReivewList(Map<String,Object> map);
	
	//큐엔에이(QNA) 
	//QNA list
	public List<Map<String,Object>> memberQNAList(Map<String,Object> map);
	
	//1대1문의(OneToOne)
	//otoList
	public List<Map<String,Object>> memberOTOList(Map<String,Object> map);

	
}
