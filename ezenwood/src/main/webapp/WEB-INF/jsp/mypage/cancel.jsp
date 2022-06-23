<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon"
	href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">

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
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/main" class="local_home">HOME</a>
						&gt;취소 내역
					</em>
				</div>
			</div>
			<!-- locaion_wrap-->
			<div class="sub_content">
				<div class="side_cont">
					<%-- <%@include file="/include/left.jsp"% --%>
					
					<!--sub_menu_box -->
					<div class="sub_menu_box">
						<h2>
							<a href="/ezenwood/mypage/main">마이페이지</a>
						</h2>
						<ul class="sub_menu_mypage">
							<li>쇼핑정보
								<ul class="sub_depth1">
									<li><a href="/ezenwood/mypage/order/1">- 주문목록/배송조회</a></li>
									<li><a href="/ezenwood/mypage/cancel/1">- 취소/반품/교환 내역</a></li>
								</ul>
							</li>
							<li>게시판 관리
								<ul class="sub_depth1">

									<li><a href="/ezenwood/mypage/review/1">- 리뷰</a></li>

									<li><a href="/ezenwood/mypage/oto/1">- 1:1문의</a></li>
									<li><a href="/ezenwood/mypage/qna/1">- Q&A</a></li>
								</ul>
							</li>
							<li>회원정보
								<ul class="sub_depth1">
									<li><a href="/ezenwood/mypage/pwch">- 회원정보 변경/탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!-- side_cont 레프트 끝-->

				<div class="content">
					<div class="mypage_cont">
						<div class="mypage_lately_info"></div>
					</div>

					<div class="mypage_lately_info_cont">
						<div class="mypage_zone_tit">
							<h2 style="font-size: large">주문취소/반품/교환</h2>
						</div>
						<!-- mypage_zone_tit-->
						<span class="pick_list_num" style="text-align: left">
							취소/반품/교환 내역 총 <strong>${cancelList.size()}</strong> 건
						</span>
						<!-- 주문상품 리스트-->
						<div class="board_list_qa" align="center">
							<table class="board_list_table" style="width: 100%">
								<colgroup>
									<col style="width: 15%">
									<!-- 날짜/주문번호 -->
									<col style="width: 15%">
									<!--상품명/옵션 -->
									<col style="width: 15%">
									<!-- 상품금액/수량-->
									<col style="width: 15%">
									<!--주문상태 -->

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
								<c:forEach items="${cancelList}" var="cancel"
									varStatus="totalCount">
									<tbody>
										<tr>
											<td>
												<p>${cancel.ADATE}&nbsp;/&nbsp;${cancel.ORDERS_NUM}</p>
											</td>
											<td>
												<P>${cancel.ORDERS_GOODS_NUM}&nbsp;/&nbsp;${cancel.ORDERS_GOODS_OPTION}</P>
											</td>
											<td>
												<P>${cancel.ORDERS_PRICE}&nbsp;/&nbsp;${cancel.ORDERS_AMOUNT}</P>
											</td>
											<td>
												<P>${cancel.ORDERS_STATUS}</P>
											</td>

										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
						<!--사유 레이어-->
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
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>