package com.ezen.ezenwood.mypage.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ezen.ezenwood.common.dao.SubImageDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAO;
import com.ezen.ezenwood.goods.dao.GoodsDAOImpl;
import com.ezen.ezenwood.mypage.dao.MyPageDAO;
import com.ezen.ezenwood.mypage.dao.MyPageDAOImle;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MyPageDAO")
	MyPageDAOImle mypageDAO;

	@Resource(name = "SubImageDAO")
	SubImageDAO subImageDAO;

	@Resource(name = "GoodsDAO")
	GoodsDAOImpl goodsDAO;
	
	//메인 주문 진행 사항
	@Override
	public Map<String,Object> orderStatus(Map<String, Object> map) throws Exception {
		return mypageDAO.orderStatus(map);
	}
	
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
	public List<Map<String, Object>> cancelOrder(Map<String, Object> map) throws Exception {
		return mypageDAO.cancelOrder(map);
	}

	@Override
	public List<Map<String, Object>> memberReivewList(Map<String, Object> map){
		List<Map<String,Object>> listMap = mypageDAO.memberReivewList(map);
		
		
		for(Map<String,Object> goodsmap : listMap) {
			Map<String, Object> amap = new HashMap<String, Object>();
			
			
			String GOODS_TITLE = ((BigDecimal)goodsmap.get("REVIEW_PARENT")).toString();
			int SUBIMAGE_PARENT = ((BigDecimal)goodsmap.get("REVIEW_PARENT")).intValue();
			
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
	public List<Map<String, Object>> memberQNAList(Map<String, Object> map) throws Exception {
		return mypageDAO.memberQNAList(map);
	}

	@Override
	public List<Map<String, Object>> memberOTOList(Map<String, Object> map) throws Exception {
		return mypageDAO.memberOTOList(map);
	}

	@Override
	public int ordercount() {
		return mypageDAO.ordercount();
	}

}
