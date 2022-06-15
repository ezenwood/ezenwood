package com.ezen.ezenwood.admin.service;

import java.math.BigDecimal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ezen.common.ImageSaver;
import com.ezen.ezenwood.admin.dao.AdminDAO;
import com.ezen.ezenwood.admin.dao.AdminDAOImpl;
import com.ezen.ezenwood.common.dao.ImageDAO;
import com.ezen.ezenwood.common.dao.SubImageDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAOImpl;
import com.ezen.ezenwood.mypage.dao.MyPageDAO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AdminDAO")
	AdminDAOImpl adminDAO;

	@Resource(name = "SubImageDAO")
	SubImageDAO subImageDAO;

	@Resource(name = "ImageDAO")
	ImageDAO imageDAO;

	@Resource(name = "GoodsDAO")
	GoodsDAOImpl goodsDAO;

	// goods

	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		List<Map<String, Object>> result = adminDAO.adminGoodsList(map);

		for (Map<String, Object> a : result) {

			String SubImage = subImageDAO.getSubImageByIDX(((BigDecimal) a.get("GOODS_NUM")).intValue());
			a.put("subImage", SubImage);

		}

		return result;
	}

	@Override
	public Map<String, Object> adminGoodsDetail(Map<String, Object> map) throws Exception {

		map.put("IMAGE_TABLENAMES_TABLENAME", "GOODS");
		map.put("IMAGE_PARENT", map.get("GOODS_NUM"));

		Map<String, Object> result = adminDAO.adminGoodsDetail(map);

		String subImage = subImageDAO.getSubImageByIDX(Integer.parseInt((String) map.get("GOODS_NUM")));
		String goodsImage = imageDAO.selectImage(map);

		result.put("subImage", subImage);
		result.put("mainImage", goodsImage);

		return result;
	}

	@Override
	public int adminGoodsUpdate(Map<String, Object> map) throws Exception {

		int checkNum = adminDAO.adminGoodsUpdate(map);

		// image

		if (checkNum == 1) {
			ImageSaver imageSaver = new ImageSaver();
			imageSaver.updateGoods(map);
			map.put("IMAGE_TABLENAMES_TABLENAME", "GOODS");
			map.put("IMAGE_PARENT", map.get("GOODS_NUM"));

			// subImage

			if (map.get("noSubImage").equals("1")) {
				// empty subImage
			} else {
				if (map.get("newSubImage").equals("1")) {
					// insert subImage
					subImageDAO.insertGoods(map);
				} else {
					// update subImage
					subImageDAO.updateGoods(map);
				}
			}

			// main Image
			if (map.get("noMainImage").equals("1")) {
				// empty subImage
			} else {
				if (map.get("newMainImage").equals("1")) {
					// insert subImage
					imageDAO.insertImage(map);
				} else {
					// update mainImage
					imageDAO.updateGoods(map);
				}
			}

		} else {
			checkNum = 0;
		}

		return checkNum;
	}

	@Override
	public int adminGoodsDelete(Map<String, Object> map) throws Exception {

		return adminDAO.adminGoodsDelete(map);
	}

	@Override
	public int adminGoodsInsert(Map<String, Object> map) throws Exception {

		//
		int checkNum = adminDAO.adminGoodsInsert(map);

		if (checkNum == 1) {
			map.put("IMAGE_TABLENAMES_TABLENAME", "GOODS");
			map.put("IMAGE_PARENT", map.get("GOODS_NUM"));

			ImageSaver imageSaver = new ImageSaver();

			imageSaver.insertGoods(map);

			if (map.get("noSubImage").equals("1")) {
				// empty subImage
			} else {
				subImageDAO.insertGoods(map);
			}

			if (map.get("noMainImage").equals("1")) {
				// empty MainImage

			} else {
				imageDAO.insertImage(map);
			}

		}

		return checkNum;
	}

	// member

	@Override
	public List<Map<String, Object>> adminMemberList(Map<String, Object> map) throws Exception {

		return adminDAO.adminMemberList(map);
	}

	public List<Map<String, Object>> adminDelMemberList(Map<String, Object> map) throws Exception {

		return adminDAO.adminDelMemberList(map);

	}

	@Override
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception {

		return adminDAO.adminMemberDetail(map);
	}

	@Override
	public int adminMemberUpdate(Map<String, Object> map) throws Exception {
		return adminDAO.adminMemberUpdate(map);
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
		List<Map<String, Object>> listMap = adminDAO.adminQNAList(map);

		for (Map<String, Object> goodsmap : listMap) {

			String GOODS_TITLE = ((BigDecimal) goodsmap.get("QNA_PARENT")).toString();

			String goods = goodsDAO.getGoodsTitle(GOODS_TITLE);
			goodsmap.put("GOODS_TITLE", goods);
		}

		return listMap;

	}

	@Override
	public Map<String, Object> adminQNADetailQ(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminQNADetailQ(map);
	}

	@Override
	public Map<String, Object> adminQNADetailA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminQNADetailA(map);
	}

	@Override
	public int adminQNAInsert(Map<String, Object> map) throws Exception {
		// 
		int cheknum = adminDAO.adminQNAInsert(map);
		
		if(cheknum == 1) {
			int QNANUM = (int) map.get("QNA_NUM");
			adminDAO.adminQNAcheck(QNANUM);
		}
		
		return cheknum;
	}

	@Override
	public int adminQNAUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminQNAUpdate(map);
	}

	@Override
	public int adminQNADelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminQNADelete(map);
	}

	// review

	@Override
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> listMap = adminDAO.adminReviewList(map);

		for (Map<String, Object> goodsmap : listMap) {
			Map<String, Object> amap = new HashMap<String, Object>();

			String GOODS_TITLE = ((BigDecimal) goodsmap.get("REVIEW_PARENT")).toString();
			int SUBIMAGE_PARENT = ((BigDecimal) goodsmap.get("REVIEW_PARENT")).intValue();

			amap.put("GOODS_NUM", goodsmap.get("REVIEW_PARENT"));

			Map<String, Object> bmap = goodsDAO.goodsDetail(amap);

			goodsmap.put("GOODS", bmap);

			String GOODS_SUBIMAGE = subImageDAO.getSubImageByIDX(SUBIMAGE_PARENT);
			String goods = goodsDAO.getGoodsTitle(GOODS_TITLE);
			goodsmap.put("GOODS_TITLE", goods);
			goodsmap.put("GOODS_SUBIMAGE", GOODS_SUBIMAGE);
		}

		return listMap;
	}

	@Override
	public Map<String, Object> adminReviewDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> listMap = adminDAO.adminReviewDetail(map);

		String GOODS_TITLE = ((BigDecimal) listMap.get("REVIEW_PARENT")).toString();
		int SUBIMAGE_PARENT = ((BigDecimal) listMap.get("REVIEW_PARENT")).intValue();

		String GOODS_SUBIMAGE = subImageDAO.getSubImageByIDX(SUBIMAGE_PARENT);
		String goods = goodsDAO.getGoodsTitle(GOODS_TITLE);
		listMap.put("GOODS_TITLE", goods);
		listMap.put("GOODS_SUBIMAGE", GOODS_SUBIMAGE);

		return listMap;
	}

	@Override
	public int adminReviewDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminReviewDelete(map);
	}

	// oto

	@Override
	public List<Map<String, Object>> adminOTOList(Map<String, Object> map) throws Exception {
		return adminDAO.adminOTOList(map);

	}

	@Override
	public Map<String, Object> adminOTODetailQ(Map<String, Object> map) throws Exception {

		return adminDAO.adminOTODetailQ(map);
	}

	@Override
	public Map<String, Object> adminOTODetailA(Map<String, Object> map) throws Exception {

		return adminDAO.adminOTODetailA(map);
	}

	@Override
	public String adminOTODetailB(String ONETOONE_NUM) throws Exception {

		return adminDAO.adminOTODetailB(ONETOONE_NUM);
	}

	@Override
	public int adminOTOUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminOTOUpdate(map);
	}

	@Override
	public int adminOTODelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminOTODelete(map);
	}

	@Override
	public int adminOTOInsert(Map<String, Object> map) throws Exception {
		
		int checknum = adminDAO.adminOTOInsert(map);
		if (checknum == 1) {
			int OTONUM = (int) map.get("ONETOONE_NUM");
			adminDAO.adminOTOcheck(OTONUM);
		}

		return checknum;
	}

	@Override
	public int adminOTOcheck(int ONETOONE_NUM) throws Exception {
		return adminDAO.adminOTOcheck(ONETOONE_NUM);
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
	public int adminFQInsert(Map<String, Object> map) throws Exception {
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
