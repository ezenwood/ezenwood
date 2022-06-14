package com.ezen.ezenwood.admin.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.admin.service.AdminService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("")
	public String admin() {
		return "admin/admin";
	}

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AdminService")
	private AdminService adminService;


	// goods 
	// 상품 리스트 보기
	@RequestMapping(value = "/goods")
	public String goodsList(HttpServletRequest request, Model model) throws Exception {
		
		Map<String, Object> insertMap = new HashMap<String,Object>();
		
		
		String category = request.getParameter("isSearch");
		String currentPageNum = request.getParameter("searchNum");
		
		if(category==null) {
			category="6";
			
		}
		if(currentPageNum==null) {
			currentPageNum="1";
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
		paginationInfo.setPageSize(5);
		paginationInfo.setRecordCountPerPage(10);
		
		insertMap.put("START", paginationInfo.getFirstRecordIndex()+1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("category", category);
		
		
		List<Map<String,Object>> result = adminService.adminGoodsList(insertMap);
		
		
		model.addAttribute("goodsListMap", result);
		
		
		
		if(result.isEmpty()) {
			
		}else {
			
			
			paginationInfo.setTotalRecordCount(((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());
			
			model.addAttribute("TOTAL_COUNT", ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());
			
			
			model.addAttribute("paginationInfo", paginationInfo);
		}
		
		
		
		
		
		
		
		
		
		
		
		return "admin/goods/goodsList";
	}
	
	
	// 상품 수정하기 (update)
	@RequestMapping(value = "/goods/{GOODS_NUM}" ,method = RequestMethod.GET)
	public String goodsListDetail(@PathVariable String GOODS_NUM, Model model) throws Exception {
		
		Map<String,Object> insertMap = new HashMap<String,Object>();
		insertMap.put("GOODS_NUM", GOODS_NUM);
		
		Map<String,Object> result = adminService.adminGoodsDetail(insertMap);
		
		
		model.addAttribute("goodsMap", result);
		
		return "admin/goods/goodsmodify";
	}
	
	
	@RequestMapping(value ="/goods/{GOODS_NUM}" ,method = RequestMethod.POST )
	public String goodsUpdate(@PathVariable String GOODS_NUM, CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		Map<String, Object> insertMap = commandMap.getMap();
		insertMap.put("GOODS_NUM", GOODS_NUM);
		insertMap.put("request", request);
		
		int checkNum = adminService.adminGoodsUpdate(insertMap);
		//
		
		
		
		
		
		
		return "redirect:/admin/goods";
	}
	
	
	
	
	
	// 상품 등록하기 (insert)
	@RequestMapping(value = "/goods/write", method = RequestMethod.GET )
	public String goodsinsertForm() throws Exception {
		
		
		
		
		
		
		
		
		return "/admin/goods/goodsInsert";
	}
	
	
	
	@RequestMapping(value = "/goods/write", method = RequestMethod.POST )
	public String goodsinsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		
		Map<String,Object> insertMap = commandMap.getMap();
		insertMap.put("request", request);
		
		adminService.adminGoodsInsert(insertMap);
		
		
		
		
		
		return "redirect:/admin/goods";
	}
	
	
	
	
//	
//	// (update) @@@@@@없음
//	@RequestMapping(value = "")
//	public String goodsUpdate() throws Exception {
//		return null;
//	}
//	
//	
	// 상품 삭제하기 (delete)
	@RequestMapping(value = "/goods/delete", method = RequestMethod.GET)
	public String goodsDelete(HttpServletRequest request) throws Exception {
		
		String GOODS_NUM = request.getParameter("GOODS_NUM");
		
		Map<String,Object> insertMap = new HashMap<String,Object>();
		
		insertMap.put("GOODS_NUM", GOODS_NUM); 
		
		int checkNum = adminService.adminGoodsDelete(insertMap);
		
		
		
		return "redirect:/admin/goods";
	}
	
	
	
	
	
	
	//member
	// 회원 리스트 보기	 
	@RequestMapping(value = "/memberList/{pageNum}",method = RequestMethod.GET)
	public ModelAndView adminMemberList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> adminMemberListMap = adminService.adminMemberList(insertMap);
		mav.addObject("adminMemberListMap",adminMemberListMap);

		int totalCount = 0;

		if (adminMemberListMap.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) adminMemberListMap.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);

		}

		mav.setViewName("admin/member/memberList");
		return mav;
	}

	
	
	
	
	// 탈퇴 회원 보기
	@RequestMapping(value = "/delmemberList/{pageNum}" ,method = RequestMethod.GET) 
	public ModelAndView delmemberList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> adminDelMemberListMap = adminService.adminDelMemberList(insertMap);
		mav.addObject("adminDelMemberListMap",adminDelMemberListMap);

		int totalCount = 0;

		if (adminDelMemberListMap.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) adminDelMemberListMap.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);

		}

		mav.setViewName("admin/member/DelmemberList");
		return mav;

	}
	 
	 
	 /* // 회원 수정
	 * 
	 * @RequestMapping(value = "") public String memberUpdate() throws Exception {
	 * return null; }
	 * 
	 * // 회원 삭제하기
	 * 
	 * @RequestMapping(value = "") public String memberDelete() throws Exception {
	 * return null; }
	 */

	
	
	
	

	/*
	 * // order // 주문 리스트보기
	 * 
	 * @RequestMapping(value = "") public String orderList() throws Exception {
	 * return null; }
	 * 
	 * 
	 * // 주문 디테일 보기
	 * 
	 * @RequestMapping(value = "") public String orderDetail() throws Exception {
	 * return null; }
	 * 
	 * 
	 * // 주문 수정하기
	 * 
	 * @RequestMapping(value = "") public String orderUpdate() throws Exception {
	 * return null; }
	 * 
	 * 
	 * // 주문 삭제하기
	 * 
	 * @RequestMapping(value = "") public String orderDelete() throws Exception {
	 * return null; }
	 * 
	 */

	// notice
	// 공지사항 리스트보기
	@RequestMapping(value = "/notice/{pageNum}", method = RequestMethod.GET)
	public ModelAndView adminNoticeList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> list = adminService.adminNoticeList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("admin/notice/noticeList");
		return mv;
	}

	// 공지사항 자세히 보기
	@RequestMapping(value = "/noticedetail/{ntNum}")
	public ModelAndView noticeDetail(@PathVariable int ntNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("NOTICE_NUM", ntNum);

		Map<String, Object> resultMap = adminService.adminNoticeDetail(insertMap);

		mav.addObject("NTMap", resultMap);

		mav.setViewName("/admin/notice/noticeDetail");
		return mav;
	}

	// 공지사항 수정하기 (update) (GET)
	@RequestMapping(value = "/notice/update/{ntNum}", method = RequestMethod.GET)
	public ModelAndView noticeUpdateForm(@PathVariable int ntNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("NOTICE_NUM", ntNum);
		System.out.println(ntNum);
		mav.setViewName("/admin/notice/noticeModify");
		return mav;
	}

	// 공지사항 수정하기 (update) (POST)
	@RequestMapping(value = "/notice/update/{ntNum}", method = RequestMethod.POST)
	public ModelAndView noticeUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();

		int resultMap = adminService.adminNoticeUpdate(commandMap.getMap());

		mav.addObject(resultMap);

		mav.setViewName("/admin/notice/noticeList");
		return mav;
	}

	// 공지사항 쓰기 (insert) (GET)
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public String noticeWriteForm() throws Exception {

		return "/admin/notice/noticeWrite";
	}

	// 공지사항 쓰기 (insert) (POST)
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String noticeWrite(CommandMap commandMap) throws Exception {

		int resultMap = adminService.adminNoticeInsert(commandMap.getMap());

		return "redirect:/admin/notice/1";

	}

	// 공지사항 삭제하기 (delete)
	@RequestMapping(value = "/notice/del/{ntNum}", method = RequestMethod.GET)
	public ModelAndView noticeDelete(@PathVariable int ntNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		int NOTICE_NUM = ntNum;

		insertMap.put("NOTICE_NUM", NOTICE_NUM);
		int resultMap = adminService.adminNoticeDelete(insertMap);

		mav.addObject(resultMap);
		mav.setViewName("/admin/notice/noticeList");
		return mav;
	}

	// QNA
	// 큐엔에이 리스트 보기
	@RequestMapping(value = "/qna/{pageNum}", method = RequestMethod.GET)
	public ModelAndView qnaList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> list = adminService.adminQNAList(insertMap);
		mav.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {

			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);

		}

		mav.setViewName("admin/qna/qnaList");
		return mav;
	}

	// 큐엔에이 디테일보기

	@RequestMapping(value = "/qnadetail/{QNANum}/{QNAType}")
	public ModelAndView qnaDetail(@PathVariable int QNANum, @PathVariable String QNAType) throws Exception {
		ModelAndView mav = new ModelAndView();

		String QNA_TYPE = QNAType;
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QNA_NUM", QNANum);
		if (QNA_TYPE.equals("A")) {
			Map<String, Object> resultMap = adminService.adminQNADetailA(insertMap);

			mav.addObject("QNAMap", resultMap);

			mav.setViewName("/admin/qna/qnaDetail");

		} else {
			Map<String, Object> resultMap = adminService.adminQNADetailQ(insertMap);

			mav.addObject("QNAMap", resultMap);

			mav.setViewName("/admin/qna/qnaDetail");
		}

		return mav;
	}

	// 큐엔에이 답변등록 (insert)

	@RequestMapping(value = "/qna/writer")
	public String qnaReply() throws Exception {

		return null;
	}

	// 큐엔에이 수정하기 (update)

	@RequestMapping(value = "/qna/update")
	public String qnaReplyUpdate() throws Exception {

		return null;
	}

	// 큐엔에이 삭제하기 (delete)

	@RequestMapping(value = "/qna/del")
	public String qnaDelete() throws Exception {

		return null;
	}

	// reivew
	// 리뷰 리스트 보기
	@RequestMapping(value = "/review/{pageNum}", method = RequestMethod.GET)
	public ModelAndView reviewList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> list = adminService.adminReviewList(insertMap);
		mav.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {

			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);

		}

		mav.setViewName("admin/review/reviewList");
		return mav;
	}

	// 리뷰 디테일 보기
	@RequestMapping(value = "/reviewdetail/{RVNum}")
	public ModelAndView reviewDetail(@PathVariable int RVNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("REVIEW_NUM", RVNum);

		Map<String, Object> resultMap = adminService.adminReviewDetail(insertMap);

		mav.addObject("RVMap", resultMap);

		mav.setViewName("/admin/review/reviewDetail");
		return mav;
	}

	// 리뷰 답글 ??

	// 리뷰 수정 ??

	// 리뷰 삭제하기 (delete)
	@RequestMapping(value = "/review/del/{RVNum}", method = RequestMethod.GET)
	public ModelAndView reviewDelete(@PathVariable int RVNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		int REVIEW_NUM = RVNum;

		insertMap.put("REVIEW_NUM", REVIEW_NUM);
		int resultMap = adminService.adminReviewDelete(insertMap);

		mav.addObject(resultMap);
		mav.setViewName("/admin/review/reviewList");
		return mav;
	}

	/*
	 * //OneToOne // 일대일문의 리스트 보기
	 * 
	 * @RequestMapping(value = "") public String otoList() throws Exception { return
	 * null; }
	 * 
	 * 
	 * // 일대일 문의 디테일 보기
	 * 
	 * @RequestMapping(value = "") public String otoDetail() throws Exception {
	 * return null; }
	 * 
	 * 
	 * 
	 * // 일대일문의 답글 달기 (insert)
	 * 
	 * @RequestMapping(value = "") public String otoReply() throws Exception {
	 * return null; }
	 * 
	 * 
	 * 
	 * // 일대일문의 수정하기 (update)
	 * 
	 * @RequestMapping(value = "") public String otoReplyUpdate() throws Exception {
	 * return null; }
	 * 
	 * 
	 * 
	 * // 일대일 문의 삭제하기 (delete)
	 * 
	 * @RequestMapping(value = "") public String otoReplyDelete() throws Exception {
	 * return null; }
	 * 
	 */

	// fq
	// 자주묻는질문 리스트보기
	@RequestMapping(value = "/fqlist/{pageNum}", method = RequestMethod.GET)
	public ModelAndView fqList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();
		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> list = adminService.adminFQList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("/admin/fq/fqList");
		return mv;
	}

	// 자주묻는 질문 자세히보기
	@RequestMapping("/fqdetail/{fqNum}")
	public ModelAndView fqDetail(@PathVariable int fqNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QUESTION_NUM", fqNum);

		Map<String, Object> resultMap = adminService.adminFQDetail(insertMap);

		mav.addObject("FQMap", resultMap);

		mav.setViewName("/admin/fq/fqDetail");
		return mav;
	}

	// 자주묻는질문 수정하기 get
	@RequestMapping(value = "/fqupdate/{fqNum}", method = RequestMethod.GET)
	public ModelAndView fqUpdateForm(@PathVariable int fqNum, CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("QUESTION_NUM", fqNum);
		mav.setViewName("/admin/fq/fqUpdateForm");
		return mav;
	}

	// 자주묻는질문 수정하기 post
	@RequestMapping(value = "/fqupdate/{fqNum}", method = RequestMethod.POST)
	public ModelAndView fqUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();

		int resultMap = adminService.adminFQUpdate(commandMap.getMap());

		mav.addObject(resultMap);

		mav.setViewName("/admin/fq/fqList");
		return mav;
	}

	// 자주묻는질문 쓰기 get
	@RequestMapping(value = "/fqwrite", method = RequestMethod.GET)
	public String fqWriteForm() throws Exception {

		return "/admin/fq/fqWriteForm";

	}

	// 자주묻는질문 쓰기 post
	@RequestMapping(value = "/fqwrite", method = RequestMethod.POST)
	public String fqWrite(CommandMap commandMap) throws Exception {

		int resultMap = adminService.adminFQInsert(commandMap.getMap());

		return "redirect:/admin/fqlist/1";

	}

	// 자주묻는질문 삭제하기
	@RequestMapping(value = "/fqdelete/{fqNum}", method = RequestMethod.GET)
	public ModelAndView fqdelete(@PathVariable int fqNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		int QUESTION_NUM = fqNum;

		insertMap.put("QUESTION_NUM", QUESTION_NUM);
		int resultMap = adminService.adminFQDelete(insertMap);

		mav.addObject(resultMap);
		mav.setViewName("/admin/fq/fqList");
		return mav;
	}

}
