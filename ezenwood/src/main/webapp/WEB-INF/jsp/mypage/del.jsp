<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Document</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문 시작 -->
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			<div class="location_wrap">
				<div class="location_cont">
					<em><a href="/ezenwood/main" class="local_home">HOME</a>
						&gt; 마이페이지 &gt; 회원탈퇴</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">
				<div class="side_cont">
					<%@include file="/include/left.jsp"%>
					<!-- //sub_menu_box -->
				</div>
				<!-- //side_cont -->

				<div class="content">
					<div class="mypage_cont">
						<form name="" action="${contextPath}/mypage/del" method="post"
							novalidate="novalidate">
							<input type="hidden" name="mode" value="hackOut"> <input
								type="hidden" name="snsType" value="">
							<div class="hack_out">

								<div class="mypage_zone_tit">
									<h2>회원탈퇴 -${sessionScope.MEMBER_ID}</h2>
								</div>

								<div class="mypage_unregister">
									<div class="unregister_info">
										이젠우드 탈퇴안내<br> <br> 회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가
										많이 부족하고 미흡했나 봅니다.<br> 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의
										불편함을 해결해 드리도록 노력하겠습니다.<br> <br> ■ 아울러 회원 탈퇴시의 아래 사항을
										숙지하시기 바랍니다.<br> 1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래
										등에서의 소비자 보호에 관한 법률에 의거한 <br> 고객정보 보호정책에따라 관리 됩니다.<br>
										2. 탈퇴 시 회원님께서 보유하셨던 주문들은 삭제 됩니다
									</div>
									<!-- //unregister_info -->
								</div>
								<!-- //hack_out -->

								<div class="btn_center_box">
									<button type="submit" class="btn_claim_cancel btn_prev">
										<em>이전으로</em>
									</button>
									<input type="hidden" name="MEMBER_ID" value="${sessionScope.MEMBER_ID}">
									<input type="submit" value="탈퇴" class="btn_claim_ok" onclick="${contextPath}/mypage/del" />
								</div>
							</div>
						</form>
					</div>
					<!-- //mypage_cont -->

				</div>
				<!-- //content -->

			</div>
			<!-- //sub_content -->
		</div>
		<!-- //본문 끝 contents -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>