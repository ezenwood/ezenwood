<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/admin_layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">

<title>이젠 우드</title>

<style type="text/css">
.paging {
	text-align: center;
	height: 32px;
	margin-top: 5px;
	margin-bottom: 15px;
}

.paging a, .paging strong {
	display: inline-block;
	width: 36px;
	height: 32px;
	line-height: 28px;
	font-size: 14px;
	border: 1px solid #e0e0e0;
	margin-left: 5px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	-moz-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
}

.paging a:first-child {
	margin-left: 0;
}

.paging strong {
	color: #fff;
	background: #337AB7;
	border: 1px solid #337AB7;
}

.paging .page_arw {
	font-size: 11px;
	line-height: 30px;
}
</style>
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
	<div id="container">
		
		<div id="contents">

			<!--location_wrap -->

			<div class="sub_content">

				<div id="wrapper">
					<div id="page-wrapper">

						<!-- 메인container-->

						<div class="row">
							<h1 class="page-header" style="width :100% ;align:center">관리자페이지에 오신걸 환영합니다</h1>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-clock-o fa-fw"></i> 관리자 공지사항
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<ul class="timeline">
									<li>
										<div class="timeline-badge">
											<i class="fa fa-check"></i>
										</div>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">관리자 홈으로 이동</h4>
											</div>
											<div class="timeline-body">
												<p><a href="/ezenwood/admin">관리자 홈 바로가기</a></p>
											</div>
										</div>
									</li>
									<li class="timeline-inverted">
										<div class="timeline-badge warning">
											<i class="fa fa-credit-card"></i>
										</div>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">쇼핑몰 홈으로 이동</h4>
											</div>
											<div class="timeline-body">
												<p><a href="/ezenwood/main">쇼핑몰 홈 바로가기</a></p>
											</div>
										</div>
									</li>
									<li>
										<div class="timeline-badge danger">
											<i class="fa fa-bomb"></i>
										</div>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">상품관리</h4>
											</div>
											<div class="timeline-body">
												<p><a href="/ezenwood/admin/goods">상품목록 이동 - 상품리스트를 볼 수있습니다</a></p>
												<p><a href="/ezenwood/admin/goods/write">상품등록 이동 - 바로상품등록 할 수있습니다</a></p>
											</div>
										</div>
									</li>
									<li class="timeline-inverted">
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">회원관리</h4>
											</div>
											<div class="timeline-body">
												<p><a href="/ezenwood/admin/memberList">회원목록 이동 - 회원목록을 볼수 있습니다</a></p>
												<p><a href="/ezenwood/admin/delmemberList">탈퇴회원목록 이동 - 탈퇴회원목록을 볼수 있습니다</a></p>
											</div>
										</div>
									</li>

									<li>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">주문관리</h4>
											</div>
											<div class="timeline-body">
												<p><a href="/ezenwood/admin/order">주문목록 - 주문목록 확인및 관리</a></p>
											</div>
										</div>
									</li>
									<li>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">게시판 관리</h4>
											</div>
											<div class="timeline-body">
												<p><a href="/ezenwood/admin/notice/1">공지사항 - 게시판 등록,수정,삭제 등 관리</a></p>
												<p><a href="/ezenwood/admin/qna/1">Q&amp;A - 게시판 수정,삭제 등 관리</a></p>
												<p><a href="/ezenwood/admin/review/1">리뷰 - 게시판 삭제 관리</a></p>
												<p><a href="/ezenwood/admin/oto/1">1:1문의 - 게시판 답변,수정,삭제 등 관리</a></p>
												<p><a href="/ezenwood/admin/fqlist/1">자주묻는질문 - 게시판 등록,수정,삭제 등 관리</a></p>
				
											</div>
										</div>
									</li>
								</ul>
							</div>
							<!-- /.panel-body -->
						</div>


						<!-- // container -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>