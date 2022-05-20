package com.ezen.ezenwood.admin.dao;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	//good list �˻� ���ǹ������ ī�װ���, ��ǰ��
	public List<Map<String,Object>> adminGoodsList(Map<String,Object> map);
	
	public Map<String,Object> adminGoodsDetail(Map<String,Object> map);
	
	public int adminGoodsUpdate(Map<String,Object> map);
	
	public int adminGoodsDelete(Map<String,Object> map);
	
	public int adminGoodsInsert(Map<String,Object> map);
	
	
	//
	//member List �˻� ���ǹ� ����� ���̵��, �̸� , Ż��
	public List<Map<String,Object>> adminMemberList(Map<String,Object> map);
	
	public Map<String,Object> adminMemberDetail(Map<String,Object> map);
	
	public int adminMemberUpdate(Map<String,Object> map);
	
	public int adminMemberDelete(Map<String,Object> map);
	
	
	//
	
	//order List �˻� ���ǹ� ����� ���̵�, �ֹ���ȣ, ��ۻ���
	public List<Map<String,Object>> adminOrderList(Map<String,Object> map);
	
	public Map<String,Object> adminOrderDetail(Map<String,Object> map);
	
	public int adminOrderUpdate(Map<String,Object> map);
	
	public int adminOrderDelete(Map<String,Object> map);
	
	//
	
	public List<Map<String,Object>> adminNoticeList(Map<String,Object> map);
	
	public Map<String,Object> adminNoticeDetail(Map<String,Object> map);
	
	public int adminNoticeUpdate(Map<String,Object> map);
	
	public int adminNoticeDelete(Map<String,Object> map);
	
	public int adminNoticeInsert(Map<String,Object> map);
	
	//
	
	//QNA List �˻� ���ǹ� ����� �ۼ���, �亯������������
	public List<Map<String,Object>> adminQNAList(Map<String,Object> map);
	
	public Map<String,Object> adminQNADetail(Map<String,Object> map);
	
	public int adminQNAInsert(Map<String,Object> map);
	
	public int adminQNAUpdate(Map<String,Object> map);
	
	public int adminQNADelete(Map<String,Object> map);
	
	//
	
	public List<Map<String,Object>> adminReviewList(Map<String,Object> map);
	
	public Map<String,Object> adminReviewDetail(Map<String,Object> map);
	
	public int adminReviewInsert(Map<String,Object> map);
	
	public int adminReviewUpdate(Map<String,Object> map);
	
	public int adminReviewDelete(Map<String,Object> map);
	
	//
	
	// OTO List �˻� ���ǹ� ����� ���̵�
	public List<Map<String,Object>> adminOTOList(Map<String,Object> map);
	
	public Map<String,Object> adminOTODetail(Map<String,Object> map);
	
	public int adminOTOUpdate(Map<String,Object> map);
	
	public int adminOTODelete(Map<String,Object> map);
	
	public int adminOTOInsert(Map<String,Object> map);
	
	
	//
	
	public List<Map<String,Object>> adminFQList(Map<String,Object> map);
	
	public Map<String,Object> adminFQDetail(Map<String,Object> map);
	
	public int adminFQUpdate(Map<String,Object> map);
	
	public int adminFQDelete(Map<String,Object> map);
	
	public int adminFQInsert(Map<String,Object> map);
	
	//
	
	
	public Map<String,Object> adminAboutDetail(Map<String,Object> map);
	
	public int adminAboutUpdate(Map<String,Object> map);
	
	public int adminAboutInsert(Map<String,Object> map);
	
	
	
	
	
	
}
