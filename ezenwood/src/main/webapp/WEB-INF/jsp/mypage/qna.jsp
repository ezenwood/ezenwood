<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<title>qna2</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">Home</a> &gt;마이페이지&gt;게시글
						관리&gt;Q&A
					</em>
				</div>
			</div>
			<!-- locaion_wrap-->
			<div class="sub_content">
				<div class="side_cont">
					<%@include file="/include/left.jsp"%>
					<!--sub_menu_box -->
					<script type="text/javascript">
						//메뉴선택
						$(
								'sub_menu_mypage li> a[href*="'
										+ document.location.pathname + '"]')
								.addClass('active');
					</script>
				</div>
				<!-- side_cont-->

				<div class="content">
					<div class="mypage_cont">
						<div class="mypage_lately_info">
							<h2 style="font-size: large">Q&A</h2>
						</div>
					</div>


					<!-- qna 리스트-->
					<div class="mypage_lately_info"></div>
					<div class="mypage_table_type">
						<table>
							<colgroup>
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<!--확인/리뷰 -->
							</colgroup>
							<thead>
								<tr>
									<th>문의날짜</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>문의상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>"${qna_date}"</td>
									<td>"${qna_category}"</td>
									<td><a href="#"> "${qna_title}" </a></td>
									<td>"${qna_writer}"</td>
									<td>"${qna_re_gb}"</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>