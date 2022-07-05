<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/member.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">

<style>
.btn_member_white:hover {
    color: #333333;
    border: 1px solid #bbbbbb;
}
.btn_member_white {
    width: 150px;
    height: 45px;
    color: #3e3d3c;
    font-weight: bold;
    font-size: 13px;
    border: 1px solid #cccccc;
    background: #fff;
    cursor: pointer;
}

</style>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문 시작 -->

			<div class="location_wrap">
				<div class="location_cont">
					<em><a href="/ezenwood/main" class="local_home">HOME</a> &gt; 이메일인증</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">

				<!-- //side_cont -->
				<div class="content_box">
					<div class="member_wrap">
						<div class="member_tit">
							<h2>이메일인증</h2>
						</div>
						<!-- //member_tit -->
						<div class="member_cont">
						<c:set var="contextPath" value="${pageContext.request.contextPath}" />
									<div class="find_id_box">
									<div class="find_id_sec">
										
										<div class="login_input">
											<div>
												<h3 style="text-align:center; font-weight: bold;">이메일인증 유효시간 경과안내</h3><br>
												<h3>인증 유효시간 10분이 지나서 다시 인증해주시기 바랍니다.</h3>
											</div>
											
										</div>
									</div>
									<!-- //find_id_sec -->
									<div class="btn_member_sec">
										<ul>

											
											<li><button type="button" id="btnJoinMember"
											class="btn_member_join" onclick="location.href='/ezenwood/member/signin'">로그인하기</button></li>

										</ul>
									</div>
									<!-- //btn_member_sec -->
								</div>
								<!-- //find_id_box -->
						</div>
						<!-- //member_cont -->
					</div>
					<!-- //member_wrap -->
				</div>
				<!-- //content_box -->

			</div>
			<!-- //sub_content -->
		</div>
		<!-- //본문 끝 contents -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>