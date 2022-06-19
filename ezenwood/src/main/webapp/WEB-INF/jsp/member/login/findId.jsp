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
					<em><a href="/ezenwood/main" class="local_home">HOME</a> &gt; 아이디 찾기</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">

				<!-- //side_cont -->
				<div class="content_box">
					<div class="member_wrap">
						<div class="member_tit">
							<h2>아이디찾기</h2>
						</div>
						<!-- //member_tit -->
						<div class="member_cont">
						<c:set var="contextPath" value="${pageContext.request.contextPath}" />
							<form id="formFindId" method="POST" action="${contextPath}/member/idfind"
								novalidate="novalidate">
								<div class="find_id_box">
									<div class="find_id_sec">
										<h3>회원 아이디찾기</h3>
										<div class="login_input">
											<div>
												<input type="text" id="member_name" name="MEMBER_NAME"
													placeholder="이름"> <input type="text" id="member_email"
													name="MEMBER_EMAIL" placeholder="가입메일주소">
											</div>
											<input type="submit" value="아이디 찾기" onclick="${contextPath}/member/idfind"
											style="border: 1px solid #4f4e4d; background: #4f4e4d; float: right; width: 158px; height: 91px; 
											margin: 15px 0 0 0; color: #ffffff; font-size: 15px; font-weight: bold;">
										</div>
									</div>
									<!-- //find_id_sec -->
									<div class="btn_member_sec">
										<ul>

											<li><input type="button" value="비밀번호 찾기"
												class="btn_member_white js_btn_find_password"
												onclick="location.href='${contextPath}/member/pwfind'">
											</li>
											<li><button type="button" id="btnJoinMember"
											class="btn_member_join" onclick="location.href='/ezenwood/member/signin'">로그인하기</button></li>

										</ul>
									</div>
									<!-- //btn_member_sec -->
								</div>
								<!-- //find_id_box -->
							</form>
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