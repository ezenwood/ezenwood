<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="/ezenwood/css/css/button.css">
<title>이젠 우드</title>

<style type="text/css">
.btn_pw_cancel {
    display: inline-block;
    min-width: 80px;
    height: 42px;
    padding: 0 10px 0 10px;
    line-height: 40px;
    color: #3e3d3c;
    font-size: 14px;
    border: 1px solid #cccccc;
    background: #ffffff;
    text-align: center;
    cursor: pointer;
}

.btn_pw_certify {
    min-width: 100px;
    height: 44px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 14px;
    font-weight: bold;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    vertical-align: top;
}

</style>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/main" class="local_home">Home</a>
						&gt; 회원정보 변경
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
					<div class="mypage_main">
						<!--마이페이지 회원 요약정보 -->
						<div class="my_page_password">
							<div class="mypage_zone_tit">
								<h3>회원정보 변경</h3>
							</div>
							<form id="formFind" method="post"
								action="${contextPath}/mypage/pwch">
								<div class="id_pw_cont" style="border-width: 3px 0px 3px 0px">
									<dl>
										<dt>아이디</dt>
										<dd>
											<strong><input type="hidden" name="MEMBER_ID" value="${MEMBER_ID}">${MEMBER_ID}</strong>
										</dd>
									</dl>
									<dl>
										<dt>비밀번호</dt>
										<dd>
											<div class="member_warning">
										
										<input type="password" name="MEMBER_PW" id="pw"
													onchange="check_pw()">
											</div>
										</dd>
									</dl>
								</div>
								<div class="btn_center_box">
									<a class="btn_pw_cancel" href="/ezenwood/mypage/main">
										<em>취소</em>
									</a>
									<button type="submit" class="btn_pw_certify" onclick="${contextPath}/mypage/update">
										<em>인증하기</em>
									</button>
								</div>
							</form>
						</div>
						<!--mypage_password -->
					</div>
					<!-- mypage_ocont -->
				</div>
				<!--content -->

			</div>

		</div>

	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>