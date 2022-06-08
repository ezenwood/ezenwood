<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<script>
	function fn_search(pageNo) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/mypage/order'/>");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
	}
</script>
<title>order2</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">HOME</a>
						&gt;주문목록/배송조회
					</em>
				</div>
			</div>
			<!--location_wrap -->

			<div class="sub_content">
				<div class="side_cont">
					<%@include file="/include/left.jsp"%>
					<!--sub_menu_box -->
				</div>
				<!-- side_cont-->
				<div class="content">

					<div class="mypage_cont">
						<div class="mypage_lately_info"></div>
					</div>
					<div class="mypage_lately_info_cont">
						<div class="mypage_zone_tit">
							<h2 style="font-size: large">주문목록/배송조회</h2>
						</div>
						<!-- mypage_zone_tit-->
						<c:forEach items="${count}" var="count">
						<span class="pick_list_num" style="width: 100%; align: left">
							주문목록 <strong>
							"${count}"
							</strong> 건
						</span>
						</c:forEach>
						<!-- 주문상품 리스트-->

						<div class="mypage_table_type">
							<table>
								<colgroup>
									<col style="width: 14%">
									<!-- 날짜/주문번호 -->
									<col>
									<!--상품명/옵션 -->
									<col style="width: 14%">
									<!-- 상품금액/수량-->
									<col style="width: 14%">
									<!--주문상태 -->
									<col style="width: 14%">
									<!--확인/리뷰 -->
								</colgroup>
								<thead>
									<tr>
										<th>날짜/주문번호</th>
										<th>상품명/옵션</th>
										<th>상품금액/수량</th>
										<th>주문상태</th>
										<th>확인/리뷰</th>
									</tr>
								</thead>
								<c:forEach items="${orderList}" var="order" varStatus="totalCount">
									<tbody>
										<tr>
											<th><input type="hidden" name="date"
												value="${order.ORDERS_DATE}" /> <input type="hidden"
												name="order_num" value="${order.ORDERS_NUM}" />
												<p>${order.ORDERS_DATE}&nbsp;/&nbsp;${order.ORDERS_NUM}</p></th>

											<th><input type="hidden" name="goods_num"
												value="${order.ORDERS_GOODS_NUM}" /> <input type="hidden"
												name="goods_option" value="${order.ORDERS_GOODS_OPTION}" />
												<P>${order.ORDERS_GOODS_NUM}&nbsp;/&nbsp;${order.ORDERS_GOODS_OPTION}</P>
											</th>

											<th><input type="hidden" name="price"
												value="${order.ORDERS_PRICE}" /> <input type="hidden"
												name="amount" value="${order.ORDERS_AMOUNT}" />
												<P>${order.ORDERS_PRICE}&nbsp;/&nbsp;${order.ORDERS_AMOUNT}</P></th>
											<th><input type="hidden" name="status"
												value="${order.ORDERS_STATUS}" />
												<P>${order.ORDERS_STATUS}</P></th>

											<th>확인 리뷰 란은 뭐죠>??</th>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>

					<c:if test="${not empty paginationInfo}">
						<ui:pagination paginationInfo="${paginationInfo}" type="text"
							jsFunction="fn_search" />
					</c:if>
					<input type="hidden" id="currentPageNo" name="currentPageNo" />

				</div>
			</div>

		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>