<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<title>review2</title>
</head>

<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">Home</a>
						&gt;마이페이지&gt;게시판 관리&gt;리뷰
					</em>
				</div>
			</div>
			<!-- locaion_wrap-->
			<div class="sub_content">
				<div class="side_cont">
					<%@include file="/include/left.jsp"%>
					<!--sub_menu_box -->

				</div>
				<!-- side_cont-->

				<div class="content">
					<div class="mypage_cont">
						<div class="mypage_lately_info">
							<h2 style="font-size: large">상품후기</h2>
						</div>
					</div>


					<!-- review 리스트-->
					<div class="mypage_table_type">
						<table>
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
										<td><img src="/ezenwood/resource/image/pet1.jpg"></td>
										<td>${review.TITLE}</td>

										<td class="board_tit">
											<!-- 제목--> <a
											href="jsvascript:gd_btn_view('goodsreview','${review.REVIEW_NUM}','y'">
												<strong>${review.REVIEW_TITLE}</strong>
										</a>
										</td>
										<td>${review.REVIEW_DATE}</td>
										<td>${review.REVIEW_WRITER}</td>

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