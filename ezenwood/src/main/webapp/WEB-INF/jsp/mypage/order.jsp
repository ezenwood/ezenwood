<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<script>
	var ddd = document.location.href;

	var idx = ddd.lastIndexOf("/");

	var sss = ddd.substring(0, idx + 1);

	function fn_search(pageNo) {
		location.href = sss + pageNo;
	}
</script>

<title>이젠 우드</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/main" class="local_home">HOME</a>
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

						<span class="pick_list_num" style="width: 100%; align: left">
							주문목록 <strong> ${orderList.size()} </strong> 건
						</span>

						<!-- 주문상품 리스트-->

						<div class="board_list_qa" align="center">
							<table class="board_list_table" style="width:100%">
								<colgroup>
									<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
									
									<!--확인/리뷰 -->
								</colgroup>
								<thead>
									<tr>
										<th>날짜/주문번호</th>
										<th>상품명/옵션</th>
										<th>상품금액/수량</th>
										<th>주문상태</th>
										
									</tr>
								</thead>
								<c:forEach items="${orderList}" var="order"
									varStatus="totalCount">
									<tbody>
										<tr>
											<td>
												<p>${order.ADATE}&nbsp;/&nbsp;${order.ORDERS_NUM}</p>
											</td>

											<td>
												<P>${order.ORDERS_GOODS_NUM}&nbsp;/&nbsp;${order.ORDERS_GOODS_OPTION}</P>
											</td>

											<td>
												<P>${order.ORDERS_PRICE}&nbsp;/&nbsp;${order.ORDERS_AMOUNT}</P>
											</td>
											<td>
												<P>${order.ORDERS_STATUS}</P>
											</td>

											
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="pagination">
						<div class="pagination">
							<!-- dsadsa -->


							<!-- dsadsa -->
							<div class="insu" style="margin: 0 auto; text-align: center;">
								<c:if test="${not empty paginationInfo}">
									<ui:pagination paginationInfo="${paginationInfo}" type="text"
										jsFunction="fn_search" />
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>