<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
	var ddd = document.location.href;

	var idx = ddd.lastIndexOf("/");

	var sss = ddd.substring(0, idx + 1);

	function fn_search(pageNo) {

		location.href = sss + pageNo;
	}
</script>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<title>이젠 우드</title>
</head>

<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/main" class="local_home">Home</a>
						&gt;마이페이지&gt;리뷰
					</em>
				</div>
			</div>
			<!-- locaion_wrap-->
			<div class="sub_content">
				<div class="side_cont">
					<%-- <%@include file="/include/left.jsp"%> --%>
					
					<div class="sub_menu_box">
		<h2><a href="/ezenwood/mypage/main">마이페이지</a></h2>
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
					<!--sub_menu_box -->

				</div>
				<!-- side_cont-->

				<div class="content">
					<div class="mypage_cont">

						<div class="mypage_lately_info">
							<h2 style="font-size: large">상품후기</h2>
						</div>
					</div>
					<c:set var="contextPath" value="${pageContext.request.contextPath}" />

					<!-- review 리스트-->
					<div class="board_list_qa" align="center">
						<table class="board_list_table" style="width:100%">
							<colgroup>
								<col style="width: 6%">
								<col style="width: 25%">
								<col style="width: 22%">
								<col style="width: 20%">
								<col style="width: 12%">
								<col style="width: 15%">

								<!--확인/리뷰 -->
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>상품</th>
									<th>상품명</th>
									<th>제목</th>
									<th>날짜</th>
									<th>작성자</th>

								</tr>
							</thead>
							<c:forEach items="${list}" var="review">
								<tbody>

									<tr data-sno="${review.REVIEW_NUM}" data-auth="y"
										style="height: 10px">
										<td>${review.REVIEW_NUM}</td>
										<td>
										 
												<img src="/ezenwood/resource/image/${review.GOODS_SUBIMAGE}" width="200"
												height="300" alt="상품 이름" title="상품 이름" class="middle">
									
												
										</td>
										<td>${review.GOODS_TITLE}</td>

										<td class="board_tit">
											<!-- 제목--> 
											<a href="/ezenwood/goods/review/${review.REVIEW_NUM}">
												<strong>${review.REVIEW_TITLE}</strong>
										</a>
										</td>
										<td>${review.REVIEW_DATE}</td>
										<td>${MEMBER_NAME}</td>

									</tr>

								</tbody>
							</c:forEach>
						</table>
						<div class="pagination">
							<div class="pagination">

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