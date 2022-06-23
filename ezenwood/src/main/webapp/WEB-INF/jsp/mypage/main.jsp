<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
					<em> <a href="/ezenwood/main" class="local_home">Home</a> &gt;마이페이지
					</em>
				</div>
			</div> 
			
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
				</div>
				<!-- side_cont 레프트 끝-->

				<div class="content">
					<div class="mypage_main">
						<!--마이페이지 회원 요약정보 -->
						<div class="mypage_order_info">
							<div class="mypage_zone_tit">
								<h3>진행 중인 주문</h3>
							</div>
							
							<div class="mypage_order_info_cont">
								<ol>
									<li class><b>입금대기</b> <strong style="color: black">${map.A}</strong>
									</li>
									<li class><b>결제완료</b> <strong style="color: black">${map.B}</strong>
									</li>
									<li class><b>상품준비중</b> <strong style="color: black">${map.C}</strong>
									</li>
									<li class><b>배송 중</b> <strong style="color: black">${map.D}</strong>
									</li>
									<li class><b>배송 완료</b> <strong style="color: black">${map.E}</strong>
									</li>
								</ol>
								<div class="order_case_list">
									<ul>
										<li style="color: black"><b>취소</b> <strong>${map.F}</strong></li>
									</ul>
								</div>
							</div>
							
							<!--mypage_orer_info_cont -->
						</div>
						<!-- mypage_order_info -->
					</div>

				</div>

			</div>

		</div>

	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>