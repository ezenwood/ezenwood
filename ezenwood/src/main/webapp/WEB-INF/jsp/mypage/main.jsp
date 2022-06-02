<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<title>mypage_main</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>

	<div id="container">
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">Home</a> &gt;마이페이지
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
					<div class="mypage_main">
						<!--마이페이지 회원 요약정보 -->
						<div class="mypage_order_info">
							<div class="mypage_zone_tit">
								<h3>진행 중인 주문</h3>
							</div>
							<div class="mypage_order_info_cont">
								<ol>
									<li class><b>입금대기</b> <strong style="color: black">0</strong>
									</li>
									<li class><b>결제완료</b> <strong style="color: black">0</strong>
									</li>
									<li class><b>상품준비중</b> <strong style="color: black">0</strong>
									</li>
									<li class><b>배송 중</b> <strong style="color: black">0</strong>
									</li>
									<li class><b>배송 완료</b> <strong style="color: black">0</strong>
									</li>
								</ol>
								<div class="order_case_list">
									<ul>
										<li style="color: black"><b>취소</b> <strong>0건</strong></li>
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