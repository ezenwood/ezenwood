package com.ezen.ezenwood.admin.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.ezen.common.AbstractDAO;

@Repository(value = "AdminDAO")
public class AdminDAOImpl extends AbstractDAO implements AdminDAO {

	// 상품 관리 goods

	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return selectList("goods.goodsListForAdmin", map);
	}

	@Override
	public Map<String, Object> adminGoodsDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("goods.goodsDetailForAdmin", map);
	}

	@Override
	public int adminGoodsUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("goods.updateGoods", map);
	}

	@Override
	public int adminGoodsDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) delete("goods.goodsDelete", map);
	}

	@Override
	public int adminGoodsInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) insert("goods.insertGoods", map);
	}

	// 회원 관리 member
	@Override
	public List<Map<String, Object>> adminMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("member.selectMemberListAdmin", map);
	}

	@Override
	public List<Map<String, Object>> memberListByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("member.MemberListByName", map);
	}

	@Override
	public List<Map<String, Object>> memberListById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("member.MemberListById", map);
	}

	@Override
	public List<Map<String, Object>> adminDelMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("member.selectDelMemberList", map);
	}

	@Override
	public List<Map<String, Object>> delmemberListByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("member.DelMemberListByName", map);
	}

	@Override
	public List<Map<String, Object>> delmemberListById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("member.DelMemberListById", map);
	}

	@Override
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("member.selectOneByMemberNumAdmin", map);
	}

	@Override
	public int adminMemberUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("member.selectOneByMemberIdADMIN", map);
	}

	@Override
	public int adminMemberDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Map<String, Object> adminMemberReturn(Map<String, Object> insertMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("member.updateMemberADMIN", insertMap);
	}
	// 주문 관리 order

	@Override
	public List<Map<String, Object>> adminOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("orders.orderListinsu", map);
	}

	@Override
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("orders.adminOrderDetail", map);
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

	// 공지사항 notice

	@Override
	public List<Map<String, Object>> orderListByOrderNum(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("orders.orderListByOrderNum", map);
	}

	@Override
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("notice.noticeListAdmin", map);
	}

	@Override
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("notice.noticeDetail", map);
	}

	@Override
	public int adminNoticeInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) insert("notice.insertNotice", map);
	}

	@Override
	public int adminNoticeUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("notice.noticeupdate", map);
	}

	@Override
	public int adminNoticeDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("notice.noticedelete", map);
	}

	// 큐엔에이 QNA

	@Override
	public List<Map<String, Object>> adminQNAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("qna.selectAdminAllQna", map);
	}

	@Override
	public Map<String, Object> adminQNADetailQ(Map<String, Object> map) {

		return (Map<String, Object>) selectOne("qna.selectQNAForDetail", map);
	}

	@Override
	public Map<String, Object> adminQNADetailA(Map<String, Object> map) {

		return (Map<String, Object>) selectOne("qna.AnswerForQNADetail", map);
	}

	@Override
	public int adminQNAInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) insert("qna.insertAdminQna", map);
	}

	@Override
	public int adminQNAUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("qna.updateAdminQna", map);
	}

	@Override
	public int adminQNADelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("qna.deleteAdminQna", map);
	}

	@Override
	public int adminQNAcheck(int QNA_NUM) {
		// TODO Auto-generated method stub
		return (int) update("qna.adminQNAcheck", QNA_NUM);
	}

	@Override
	public int adminQNAcheckQ(int QNA_NUM) {
		// TODO Auto-generated method stub
		return (int) update("qna.adminQNAcheckQ", QNA_NUM);
	}

	// 리뷰 review

	@Override
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("review.selectAllReview", map);
	}

	@Override
	public Map<String, Object> adminReviewDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("review.selectReviewDetail", map);
	}

	@Override
	public int adminReviewDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("review.admindeleteReview", map);
	}

	// 일대일 문의 OneToOne

	@Override
	public List<Map<String, Object>> adminOTOList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("onetoone.selectAdminoto", map);
	}

	@Override
	public Map<String, Object> adminOTODetailQ(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("onetoone.selectClientDetail", map);
	}

	@Override
	public Map<String, Object> adminOTODetailA(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("onetoone.selectAdminDetail", map);
	}

	@Override
	public String adminOTODetailB(String ONETOONE_NUM) {
		// TODO Auto-generated method stub
		return (String) selectOne("member.otoid", ONETOONE_NUM);
	}

	@Override
	public int adminOTOUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("onetoone.updateAdmin", map);
	}

	@Override
	public int adminOTODelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("onetoone.deleteAdmin", map);
	}

	@Override
	public int adminOTOInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) insert("onetoone.insertAdmin", map);
	}

	@Override
	public int adminOTOcheck(int ONETOONE_NUM) {
		return (int) update("onetoone.OTOcheck", ONETOONE_NUM);
	}

	@Override
	public int adminOTOcheckQ(int ONETOONE_NUM) {
		return (int) update("onetoone.OTOcheckQ", ONETOONE_NUM);
	}

	@Override
	public List<Map<String, Object>> otoSearching(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("onetoone.otosearching", map);
	}
	// 자주묻는질문 fq

	@Override
	public List<Map<String, Object>> adminFQList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("frequestion.frequestionList", map);
	}

	@Override
	public Map<String, Object> adminFQDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("frequestion.frequestionDetail", map);
	}

	@Override
	public int adminFQUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("frequestion.frequestionupdate", map);
	}

	@Override
	public int adminFQDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) update("frequestion.frequestiondelete", map);
	}

	@Override
	public int adminFQInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int) insert("frequestion.frequestionInsert", map);
	}

	// 회사소개 글 about

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
