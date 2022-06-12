package com.ezen.ezenwood.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ezen.ezenwood.admin.dao.AdminDAO;
import com.ezen.ezenwood.admin.dao.AdminDAOImpl;

import com.ezen.ezenwood.goods.dao.GoodsDAO;
import com.ezen.ezenwood.mypage.dao.MyPageDAO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "AdminDAO")
	AdminDAOImpl adminDAO;
	
	//goods
	

	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminGoodsDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminGoodsUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminGoodsDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminGoodsInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// member

	@Override
	public List<Map<String, Object>> adminMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminMemberUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminMemberDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// order

	@Override
	public List<Map<String, Object>> adminOrderList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminOrderUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOrderDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// notice

	@Override
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception {
		
		return adminDAO.adminNoticeList(map);
	}

	@Override
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminNoticeDetail(map);
	}

	@Override
	public int adminNoticeInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminNoticeInsert(map);
	}
	
	@Override
	public int adminNoticeUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminNoticeUpdate(map);
	}

	@Override
	public int adminNoticeDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminNoticeDelete(map);
	}



	// Qna

	@Override
	public List<Map<String, Object>> adminQNAList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminQNADetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminQNAInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminQNAUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminQNADelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// review

	@Override
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminReviewDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminReviewInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminReviewUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminReviewDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// oto

	@Override
	public List<Map<String, Object>> adminOTOList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> adminOTODetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminOTOUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOTODelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOTOInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// fq(자주묻는질문)

	@Override
	public List<Map<String, Object>> adminFQList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminFQList(map);
	}

	@Override
	public Map<String, Object> adminFQDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminFQDetail(map);
	}

	@Override
	public int adminFQUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminFQUpdate(map);
	}

	@Override
	public int adminFQDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminFQDelete(map);
	}

	@Override
	public int adminFQInsert(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminFQInsert(map);
	}

	// about
	@Override
	public Map<String, Object> adminAboutDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminAboutUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminAboutInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
