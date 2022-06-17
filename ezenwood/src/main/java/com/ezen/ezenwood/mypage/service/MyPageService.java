package com.ezen.ezenwood.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	
	//member
	//내정보 가져오기
	public Map<String,Object> memberInfo(Map<String,Object> map) throws Exception;
	
	//회원 수정
	public int memberUpdate(Map<String,Object> map) throws Exception;
	
	//회원 탈퇴 
	public int memberDelete(Map<String,Object> map) throws Exception;
	
	//주문(order)
	//orderList
	public List<Map<String,Object>> orderList(Map<String,Object> map) throws Exception;
	
	//orderlistcount
	public int ordercount();
	
	//배송조회
	public Map<String, Object> deliveryTracking(Map<String,Object> map) throws Exception;
	
	//취소내역
	public List<Map<String,Object>> cancelOrder(Map<String,Object> map) throws Exception;
	
	
	//리뷰(review)
	//review List
	public List<Map<String,Object>> memberReivewList(Map<String,Object> map) throws Exception;
	
	//큐엔에이(QNA) 
	//QNA list
	public List<Map<String,Object>> memberQNAList(Map<String,Object> map) throws Exception;
	
	//1대1문의(OneToOne)
	//otoList
	public List<Map<String,Object>> memberOTOList(Map<String,Object> map) throws Exception;

	

	
}
