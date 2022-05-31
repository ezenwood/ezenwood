package com.ezen.ezenwood.mypage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ezen.ezenwood.mypage.dao.MyPageDAO;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "MyPageDAO")
	private MyPageDAO mypageDAO;
	
	
	@Override
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception {
		return mypageDAO.memberInfo(map);
	}

	@Override
	public int memberUpdate(Map<String, Object> map) throws Exception {
		return mypageDAO.memberUpdate(map);
	}

	@Override
	public int memberDelete(Map<String, Object> map) throws Exception {
		return mypageDAO.memberDelete(map);
	}

	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map) throws Exception {
		return mypageDAO.orderList(map);
	}

	@Override
	public Map<String, Object> deliveryTracking(Map<String, Object> map) throws Exception {
		return mypageDAO.deliveryTracking(map);
	}

	@Override
	public Map<String, Object> cancelOrder(Map<String, Object> map) throws Exception {
		return mypageDAO.cancelOrder(map);
	}

	@Override
	public List<Map<String, Object>> memberReivewList(Map<String, Object> map) throws Exception {
		return mypageDAO.memberReivewList(map);
	}

	@Override
	public List<Map<String, Object>> memberQNAList(Map<String, Object> map) throws Exception {
		return mypageDAO.memberQNAList(map);
	}

	@Override
	public List<Map<String, Object>> memberOTOList(Map<String, Object> map) throws Exception {
		return mypageDAO.memberOTOList(map);
	}

}
