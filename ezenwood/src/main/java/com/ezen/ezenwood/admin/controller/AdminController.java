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

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String category = request.getParameter("isSearch");
		String currentPageNum = request.getParameter("searchNum");

		if (category == null) {
			category = "6";

		}
		if (currentPageNum == null) {
			currentPageNum = "1";
		}

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
		paginationInfo.setPageSize(5);
		paginationInfo.setRecordCountPerPage(10);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("category", category);

		List<Map<String, Object>> result = adminService.adminGoodsList(insertMap);

		model.addAttribute("goodsListMap", result);

		if (result.isEmpty()) {

		} else {

			paginationInfo.setTotalRecordCount(((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

			model.addAttribute("TOTAL_COUNT", ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

			model.addAttribute("paginationInfo", paginationInfo);
		}

		return "admin/goods/goodsList";
	}

	// 상품 수정하기 (update)
	@RequestMapping(value = "/goods/{GOODS_NUM}", method = RequestMethod.GET)
	public String goodsListDetail(@PathVariable String GOODS_NUM, Model model) throws Exception {

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("GOODS_NUM", GOODS_NUM);

		Map<String, Object> result = adminService.adminGoodsDetail(insertMap);

		model.addAttribute("goodsMap", result);

		return "admin/goods/goodsmodify";
	}

	@RequestMapping(value = "/goods/{GOODS_NUM}", method = RequestMethod.POST)
	public String goodsUpdate(@PathVariable String GOODS_NUM, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		Map<String, Object> insertMap = commandMap.getMap();
		insertMap.put("GOODS_NUM", GOODS_NUM);
		insertMap.put("request", request);

		int checkNum = adminService.adminGoodsUpdate(insertMap);
		//

		return "redirect:/admin/goods";
	}

	// 상품 등록하기 (insert)
	@RequestMapping(value = "/goods/write", method = RequestMethod.GET)
	public String goodsinsertForm() throws Exception {

		return "/admin/goods/goodsInsert";
	}

	@RequestMapping(value = "/goods/write", method = RequestMethod.POST)
	public String goodsinsert(CommandMap commandMap, HttpServletRequest request) throws Exception {

		Map<String, Object> insertMap = commandMap.getMap();
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

		Map<String, Object> insertMap = new HashMap<String, Object>();

		insertMap.put("GOODS_NUM", GOODS_NUM);

		int checkNum = adminService.adminGoodsDelete(insertMap);

		return "redirect:/admin/goods";
	}

	// member
	// 회원 리스트 보기
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public ModelAndView adminMemberList(Model model, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();

		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchKeyword == null || searchOption == null) {

			String currentPageNum = request.getParameter("PageNum");

			if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
				currentPageNum = "1";
			}
			Map<String, Object> insertMap = new HashMap<String, Object>();

			PaginationInfo paginationInfo = new PaginationInfo();

			// 현재 페이지 번호
			paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
			// 한 페이지에 게시되는 게시물 건수
			paginationInfo.setRecordCountPerPage(9);
			// 페이징 리스트의 사이즈
			paginationInfo.setPageSize(5);
			insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
			insertMap.put("END", paginationInfo.getLastRecordIndex());

			List<Map<String, Object>> adminMemberList = adminService.adminMemberList(insertMap);

			model.addAttribute("adminMemberList", adminMemberList);

			if (adminMemberList.isEmpty()) {

			} else {

				paginationInfo.setTotalRecordCount(((BigDecimal) adminMemberList.get(0).get("TOTAL_COUNT")).intValue());

				model.addAttribute("TOTAL_COUNT", ((BigDecimal) adminMemberList.get(0).get("TOTAL_COUNT")).intValue());

				model.addAttribute("paginationInfo", paginationInfo);
			}

		} else {
			if (searchOption.equals("1")) {
				// id
				String currentPageNum = request.getParameter("PageNum");

				if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
					currentPageNum = "1";
				}

				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
				paginationInfo.setPageSize(5);
				paginationInfo.setRecordCountPerPage(9);

				Map<String, Object> insertMap = new HashMap<String, Object>();
				insertMap.put("searchKeyword", searchKeyword);
				insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
				insertMap.put("END", paginationInfo.getLastRecordIndex());

				List<Map<String, Object>> result = adminService.MemberListById(insertMap);
				model.addAttribute("result", result);

				if (result.isEmpty()) {
				} else {
					paginationInfo.setTotalRecordCount(((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("TOTAL_COUNT", ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("paginationInfo", paginationInfo);
				}

				model.addAttribute("adminMemberList", result);
			} else {
				// name
				String currentPageNum = request.getParameter("PageNum");

				if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
					currentPageNum = "1";
				}

				Map<String, Object> insertMap = new HashMap<String, Object>();

				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
				paginationInfo.setPageSize(5);
				paginationInfo.setRecordCountPerPage(9);

				insertMap.put("searchKeyword", searchKeyword);
				insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
				insertMap.put("END", paginationInfo.getLastRecordIndex());

				insertMap.put("searchKeyword", searchKeyword);

				List<Map<String, Object>> result = adminService.MemberListByName(insertMap);
				model.addAttribute("result", result);

				if (result.isEmpty()) {
				} else {
					paginationInfo.setTotalRecordCount(((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("TOTAL_COUNT", ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("paginationInfo", paginationInfo);
				}
				model.addAttribute("adminMemberList", result);
			}
		}
		mav.setViewName("admin/member/memberList");

		return mav;

	}

	// 탈퇴 회원 보기
	@RequestMapping(value = "/delmemberList", method = RequestMethod.GET)
	public ModelAndView delmemberList(Model model, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();

		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchKeyword == null || searchOption == null) {

			String currentPageNum = request.getParameter("PageNum");

			if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
				currentPageNum = "1";
			}
			Map<String, Object> insertMap = new HashMap<String, Object>();

			PaginationInfo paginationInfo = new PaginationInfo();

			// 현재 페이지 번호
			paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
			// 한 페이지에 게시되는 게시물 건수
			paginationInfo.setRecordCountPerPage(9);
			// 페이징 리스트의 사이즈
			paginationInfo.setPageSize(5);
			insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
			insertMap.put("END", paginationInfo.getLastRecordIndex());
			List<Map<String, Object>> adminDelMemberListMap = adminService.adminDelMemberList(insertMap);
			model.addAttribute("adminDelMemberListMap", adminDelMemberListMap);
			if (adminDelMemberListMap.isEmpty()) {
			} else {
				paginationInfo
						.setTotalRecordCount(((BigDecimal) adminDelMemberListMap.get(0).get("TOTAL_COUNT")).intValue());
				model.addAttribute("TOTAL_COUNT",
						((BigDecimal) adminDelMemberListMap.get(0).get("TOTAL_COUNT")).intValue());

				model.addAttribute("paginationInfo", paginationInfo);
			}

		} else {
			if (searchOption.equals("1")) {
				// id
				String currentPageNum = request.getParameter("PageNum");

				if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
					currentPageNum = "1";
				}

				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
				paginationInfo.setPageSize(5);
				paginationInfo.setRecordCountPerPage(9);

				Map<String, Object> insertMap = new HashMap<String, Object>();
				insertMap.put("searchKeyword", searchKeyword);
				insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
				insertMap.put("END", paginationInfo.getLastRecordIndex());

				List<Map<String, Object>> result = adminService.DelMemberListById(insertMap);
				model.addAttribute("result", result);

				if (result.isEmpty()) {
				} else {
					paginationInfo.setTotalRecordCount(((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("TOTAL_COUNT", ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("paginationInfo", paginationInfo);
				}

				model.addAttribute("adminDelMemberListMap", result);
			} else {
				// name
				String currentPageNum = request.getParameter("PageNum");

				if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
					currentPageNum = "1";
				}

				Map<String, Object> insertMap = new HashMap<String, Object>();

				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
				paginationInfo.setPageSize(5);
				paginationInfo.setRecordCountPerPage(9);

				insertMap.put("searchKeyword", searchKeyword);
				insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
				insertMap.put("END", paginationInfo.getLastRecordIndex());

				insertMap.put("searchKeyword", searchKeyword);

				List<Map<String, Object>> result = adminService.DelMemberListByName(insertMap);
				model.addAttribute("result", result);

				if (result.isEmpty()) {
				} else {
					paginationInfo.setTotalRecordCount(((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("TOTAL_COUNT", ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue());

					model.addAttribute("paginationInfo", paginationInfo);
				}
				model.addAttribute("adminDelMemberListMap", result);
			}
		}
		mav.setViewName("admin/member/DelmemberList");

		return mav;

	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/{MEMBER_ID}", method = RequestMethod.GET)
	public String memberUpdateDetail(@PathVariable String MEMBER_ID, Model model) throws Exception {

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("MEMBER_ID", MEMBER_ID);

		Map<String, Object> memberUpdateMap = adminService.adminMemberDetail(insertMap);

		model.addAttribute("memberUpdateMap", memberUpdateMap);

		return "admin/member/memberUpdateForm";
	}

	@RequestMapping(value = "/member/{MEMBER_ID}", method = RequestMethod.POST)
	public String memberUpdate(@PathVariable String MEMBER_ID, CommandMap commandMap, HttpServletRequest request)
			throws Exception {
		Map<String, Object> insertMap = commandMap.getMap();
		insertMap.put("MEMBER_ID", MEMBER_ID);
		insertMap.put("request", request);
		int checkNum = adminService.adminMemberUpdate(insertMap);
		return "redirect:/admin/memberList/1";

	}

	// 탈퇴 회원 복구
	@RequestMapping({ "/member/return/{MEMBER_ID}" })
	public ModelAndView memberReturn(@PathVariable String MEMBER_ID) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("MEMBER_ID", MEMBER_ID);
		Map<String, Object> resultMap = this.adminService.adminMemberReturn(insertMap);
		mav.addObject("MemReMap", resultMap);
		mav.setViewName("admin/member/DelmemberList");
		return mav;
	}

	// order // 주문 리스트보기

	@RequestMapping(value = "/order")
	public String orderList(HttpServletRequest request, Model model) throws Exception {

		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");

		if (searchKeyword == null || searchOption == null) {

			String currentPageNum = request.getParameter("PageNum");
			String searchType = request.getParameter("searchType");

			if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
				currentPageNum = "1";
			}
			if (searchType == null || searchType.equals("") || searchType.isEmpty()) {
				searchType = "7";
			}

			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
			paginationInfo.setPageSize(5);
			paginationInfo.setRecordCountPerPage(10);

			Map<String, Object> insertMap = new HashMap<String, Object>();
			insertMap.put("searchType", searchType);
			insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
			insertMap.put("END", paginationInfo.getLastRecordIndex());

			List<Map<String, Object>> result = adminService.adminOrderList(insertMap);
			int TOTAL_COUNT = 0;
			if (result.isEmpty()) {
				//
			} else {
				TOTAL_COUNT = ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue();
				paginationInfo.setTotalRecordCount(TOTAL_COUNT);
				model.addAttribute("paginationInfo", paginationInfo);
			}

			model.addAttribute("TOTAL_COUNT", TOTAL_COUNT);
			model.addAttribute("orderListMap", result);

		} else {
			if (searchOption.equals("1")) {
				// id
				String currentPageNum = request.getParameter("PageNum");
				String searchType = request.getParameter("searchType");

				if (currentPageNum == null || currentPageNum.equals("") || currentPageNum.isEmpty()) {
					currentPageNum = "1";
				}
				if (searchType == null || searchType.equals("") || searchType.isEmpty()) {
					searchType = "7";
				}

				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(Integer.parseInt(currentPageNum));
				paginationInfo.setPageSize(5);
				paginationInfo.setRecordCountPerPage(10);

				Map<String, Object> insertMap = new HashMap<String, Object>();
				insertMap.put("searchType", searchType);
				insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
				insertMap.put("END", paginationInfo.getLastRecordIndex());

				List<Map<String, Object>> result = adminService.adminOrderList(insertMap);
				int TOTAL_COUNT = 0;
				if (result.isEmpty()) {
					//
				} else {
					TOTAL_COUNT = ((BigDecimal) result.get(0).get("TOTAL_COUNT")).intValue();
					paginationInfo.setTotalRecordCount(TOTAL_COUNT);
					model.addAttribute("paginationInfo", paginationInfo);
				}

				model.addAttribute("TOTAL_COUNT", TOTAL_COUNT);
				model.addAttribute("orderListMap", result);
			} else {
				// orderNum

				Map<String, Object> insertMap = new HashMap<String, Object>();

				insertMap.put("searchKeyword", searchKeyword);

				List<Map<String, Object>> result = adminService.orderListByOrderNum(insertMap);
				model.addAttribute("orderListMap", result);
			}
		}

		return "admin/order/orderList";
	}

	// 주문 디테일 보기

	@RequestMapping(value = "/order/{ORDERS_NUM}", method = RequestMethod.GET)
	public String orderDetail(@PathVariable String ORDERS_NUM, Model model) throws Exception {

		Map<String, Object> insertMap = new HashMap<String, Object>();

		insertMap.put("ORDERS_NUM", ORDERS_NUM);

		Map<String, Object> resultMap = adminService.adminOrderDetail(insertMap);

		model.addAttribute("orderMap", resultMap);

		return "admin/order/orderDetail";
	}

	// 주문 수정하기

	@RequestMapping(value = "/order/{ORDERS_NUM}", method = RequestMethod.POST)
	public String orderUpdate(@PathVariable String ORDERS_NUM, CommandMap commandMap) throws Exception {

		Map<String, Object> insertMap = commandMap.getMap();
		insertMap.put("ORDERS_NUM", ORDERS_NUM);

		for (String a : insertMap.keySet()) {
			System.out.println("key: " + a + " value: " + insertMap.get(a));
		}

		int checkNum = adminService.adminOrderUpdate(insertMap);

		return "redirect:/admin/order";
	}

	// 주문 삭제하기

//	@RequestMapping(value = "")
//	public String orderDelete() throws Exception {
//		return null;
//	}

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

	// 공지사항 검색기능

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView noticeSearch(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/notice/noticeList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String step = request.getParameter("step");

		insertMap.put("keyword", keyword);
		insertMap.put("type", type);
		insertMap.put("title", title);
		insertMap.put("step", step);

		List<Map<String, Object>> resultMap = adminService.noticeSearching(insertMap);

		mav.addObject("list", resultMap);
		return mav;
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

		mav.setViewName("redirect:/admin/notice/1");
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

	// 큐엔에이 검색기능

	@RequestMapping(value = "/qnacategory", method = RequestMethod.GET)
	public ModelAndView qnaCategory(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/qna/qnaList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String category = request.getParameter("category");
		String wating = request.getParameter("wating");
		String success = request.getParameter("success");

		insertMap.put("category", category);
		insertMap.put("wating", wating);
		insertMap.put("success", success);

		List<Map<String, Object>> resultMap = adminService.qnaCategory(insertMap);

		mav.addObject("list", resultMap);
		return mav;
	}

	// 큐엔에이 검색기능
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public ModelAndView qnaSearch(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/qna/qnaList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");

		insertMap.put("keyword", keyword);
		insertMap.put("type", type);
		insertMap.put("title", title);
		insertMap.put("writer", writer);

		List<Map<String, Object>> resultMap = adminService.qnaSearching(insertMap);

		mav.addObject("list", resultMap);
		return mav;
	}

	// 큐엔에이 디테일보기

	@RequestMapping(value = "/qnadetail/{QNANum}")
	public ModelAndView qnaDetail(@PathVariable int QNANum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QNA_NUM", QNANum);

		Map<String, Object> resultMap = adminService.adminQNADetailA(insertMap);

		mav.addObject("AQNAMap", resultMap);

		mav.setViewName("/admin/qna/qnaDetail");

		Map<String, Object> resultMapa = adminService.adminQNADetailQ(insertMap);

		mav.addObject("QQNAMap", resultMapa);

		mav.setViewName("/admin/qna/qnaDetail");

		return mav;
	}

	// 큐엔에이 답변등록 (insert)

	@RequestMapping(value = "/qna/writer/{QNANum}/{QNASE}", method = RequestMethod.GET)
	public String qnaReplyForm(@PathVariable int QNANum, @PathVariable String QNASE, HttpServletRequest request)
			throws Exception {

		return "/admin/qna/qnaReplyForm";
	}

	// 큐엔에이 답변등록 (insert)

	@RequestMapping(value = "/qna/writer/{QNANum}/{QNASE}", method = RequestMethod.POST)
	public ModelAndView qnaReply(CommandMap commandMap, @PathVariable int QNANum, @PathVariable String QNASE,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		String QNA_SECREATE = QNASE;

		int QNA_NUM = QNANum;

		commandMap.put("MEMBER_ID", MEMBER_ID);
		commandMap.put("QNA_SECREATE", QNA_SECREATE);
		commandMap.put("QNA_NUM", QNA_NUM);

		int insert = adminService.adminQNAInsert(commandMap.getMap());

		mav.addObject(insert);
		mav.setViewName("redirect:/admin/qna/1");
		return mav;
	}

	// 큐엔에이 수정하기 (update)

	@RequestMapping(value = "/qna/update/{qnaNum}", method = RequestMethod.GET)
	public ModelAndView qnaReplyUpdateForm(@PathVariable int qnaNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("QNA_NUM", qnaNum);

		mav.setViewName("/admin/qna/qnaModify");
		return mav;
	}

	// 큐엔에이 수정하기 (update)

	@RequestMapping(value = "/qna/update/{qnaNum}", method = RequestMethod.POST)
	public ModelAndView qnaReplyUpdate(@PathVariable int qnaNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		int QNA_NUM = qnaNum;

		commandMap.put("MEMBER_ID", MEMBER_ID);
		commandMap.put("QNA_NUM", QNA_NUM);

		int resultMap = adminService.adminQNAUpdate(commandMap.getMap());

		mav.addObject(resultMap);

		mav.setViewName("redirect:/admin/qnadetail/{qnaNum}");
		return mav;
	}

	// 큐엔에이 삭제하기 (delete)

	@RequestMapping(value = "/qna/del/{qnaNum}", method = RequestMethod.GET)
	public ModelAndView qnaDelete(@PathVariable int qnaNum, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		int QNA_NUM = qnaNum;
		insertMap.put("MEMBER_ID", MEMBER_ID);
		insertMap.put("QNA_NUM", QNA_NUM);
		int resultMap = adminService.adminQNADelete(insertMap);

		mav.addObject(resultMap);
		mav.setViewName("redirect:/admin/qnadetail/{qnaNum}");
		return mav;
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

	// 리뷰문의 검색기능

	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public ModelAndView reivewSearch(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/review/reviewList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");

		insertMap.put("keyword", keyword);
		insertMap.put("type", type);
		insertMap.put("title", title);
		insertMap.put("writer", writer);

		List<Map<String, Object>> resultMap = adminService.reviewSearching(insertMap);

		mav.addObject("list", resultMap);
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

	// OneToOne // 일대일문의 리스트 보기

	@RequestMapping(value = "/oto/{pageNum}")
	public ModelAndView otoList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
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

		List<Map<String, Object>> list = adminService.adminOTOList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("/admin/oto/otoList");
		return mv;
	}

	// 일대일문의 검색기능

	@RequestMapping(value = "/otocategory", method = RequestMethod.GET)
	public ModelAndView otoCategory(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/oto/otoList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String category = request.getParameter("category");
		String wating = request.getParameter("wating");
		String success = request.getParameter("success");

		insertMap.put("category", category);
		insertMap.put("wating", wating);
		insertMap.put("success", success);

		List<Map<String, Object>> resultMap = adminService.otoCategory(insertMap);

		mav.addObject("list", resultMap);
		return mav;
	}

	// 일대일문의 검색기능

	@RequestMapping(value = "/oto", method = RequestMethod.GET)
	public ModelAndView otoSearch(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/oto/otoList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");

		insertMap.put("keyword", keyword);
		insertMap.put("type", type);
		insertMap.put("title", title);
		insertMap.put("writer", writer);

		List<Map<String, Object>> resultMap = adminService.otoSearching(insertMap);

		mav.addObject("list", resultMap);
		return mav;
	}

	// 일대일 문의 디테일 보기

	@RequestMapping(value = "/otoDetail/{OTONum}")
	public ModelAndView otoDetail(@PathVariable String OTONum, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> insertMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();

		insertMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));

		String ONETOONE_NUM = OTONum;
		insertMap.put("ONETOONE_NUM", ONETOONE_NUM);

		Map<String, Object> resultMap = adminService.adminOTODetailQ(insertMap);

		mav.addObject("QOTOMap", resultMap);

		Map<String, Object> resultMapa = adminService.adminOTODetailA(insertMap);

		mav.addObject("AOTOMap", resultMapa);
		mav.setViewName("/admin/oto/otoDetail");

		return mav;
	}

	// 일대일문의 답글 달기 폼 (insert)

	@RequestMapping(value = "/oto/writer/{OTONum}", method = RequestMethod.GET)
	public String otoReplyForm(@PathVariable int OTONum, HttpServletRequest request) throws Exception {

		return "/admin/oto/otoReplyForm";
	}

	// 일대일문의 답글 달기 (insert)

	@RequestMapping(value = "/oto/writer/{OTONum}", method = RequestMethod.POST)
	public ModelAndView qnaReply(CommandMap commandMap, @PathVariable int OTONum, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		int ONETOONE_NUM = OTONum;

		commandMap.put("MEMBER_ID", MEMBER_ID);

		commandMap.put("ONETOONE_NUM", ONETOONE_NUM);

		int insert = adminService.adminOTOInsert(commandMap.getMap());

		mav.addObject(insert);
		mav.setViewName("redirect:/admin/oto/1");
		return mav;
	}

	// 일대일 문의 답변 삭제하기 (delete)

	@RequestMapping(value = "/oto/del/{otoNum}", method = RequestMethod.GET)
	public ModelAndView otoReplyDelete(@PathVariable String otoNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String ONETOONE_NUM = otoNum;
		String MEMBER_ID = adminService.adminOTODetailB(ONETOONE_NUM);
		insertMap.put("MEMBER_ID", MEMBER_ID);

		int ONETOONE_NUMa = Integer.valueOf(ONETOONE_NUM);
		insertMap.put("ONETOONE_NUM", ONETOONE_NUMa);
		int resultMap = adminService.adminOTODelete(insertMap);

		mav.addObject(resultMap);

		mav.setViewName("redirect:/admin/oto/1");

		return mav;
	}

	// 일대일 문의 문의/답변 삭제하기 (delete)

	@RequestMapping(value = "/oto/dell/{otoNum}", method = RequestMethod.GET)
	public ModelAndView otoReplyDeleteAll(@PathVariable String otoNum) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String ONETOONE_NUM = otoNum;
		String MEMBER_ID = adminService.adminOTODetailB(ONETOONE_NUM);
		insertMap.put("MEMBER_ID", MEMBER_ID);

		int ONETOONE_NUMa = Integer.valueOf(ONETOONE_NUM);
		insertMap.put("ONETOONE_NUM", ONETOONE_NUMa);
		int resultMap = adminService.adminOTODelete(insertMap);
		int resultMapa = adminService.adminOTODeleteAll(insertMap);

		mav.addObject(resultMapa);
		mav.addObject(resultMap);

		mav.setViewName("redirect:/admin/oto/1");

		return mav;
	}

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

	// 자주묻는질문 검색기능
	@RequestMapping(value = "/fq", method = RequestMethod.GET)
	public ModelAndView fqSearch(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/fq/fqList");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String step = request.getParameter("step");

		insertMap.put("keyword", keyword);
		insertMap.put("type", type);
		insertMap.put("title", title);
		insertMap.put("step", step);

		List<Map<String, Object>> resultMap = adminService.fqSearching(insertMap);

		mav.addObject("list", resultMap);
		return mav;
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
