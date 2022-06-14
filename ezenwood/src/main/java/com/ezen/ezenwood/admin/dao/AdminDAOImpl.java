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
	public List<Map<String, Object>> adminDelMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("member.selectMemberList", map);
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

	// 주문 관리 order

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

	// 공지사항 notice

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
		return (String) selectOne("member.otoid",ONETOONE_NUM);
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
		return (int) update("onetoone.insertAdmin", map);
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
