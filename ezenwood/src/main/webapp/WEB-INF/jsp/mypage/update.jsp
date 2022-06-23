<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/button.css">
<title>이젠 우드</title>
<link rel="shortcut icon"
	href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						/*  var guideTextBox = document.getElementById("guide");
						 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						 if(data.autoRoadAddress) {
						     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
						     guideTextBox.style.display = 'block';

						 } else if(data.autoJibunAddress) {
						     var expJibunAddr = data.autoJibunAddress;
						     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
						     guideTextBox.style.display = 'block';
						 } else {
						     guideTextBox.innerHTML = '';
						     guideTextBox.style.display = 'none';
						 } */
					}
				}).open();
	}
</script>

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문 시작 -->
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			<div class="location_wrap">
				<div class="location_cont">
					<em><a href="/ezenwood/main" class="local_home">HOME</a> &gt;
						마이페이지 &gt; 내정보수정</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">

				<div class="side_cont">

					<%-- <%@include file="/include/left.jsp"%> --%>

					<div class="sub_menu_box">
						<h2>
							<a href="/ezenwood/mypage/main">마이페이지</a>
						</h2>
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


					<!-- //sub_menu_box -->
				</div>
				<!-- //side_cont -->

				<div class="content">
					<div class="mypage_cont">

						<div class="my_page">
							<div class="mypage_zone_tit">
								<h2 style="font-size: large">회원정보 변경</h2>
							</div>

							<div class="join_base_wrap">

								<div class="member_cont">

									<form id="formJoin" name="formJoin"
										action="${contextPath}/mypage/update" method="post"
										novalidate="novalidate">
										<input type="hidden" name="MEMBER_NUM" value="${MEMBER_NUM}">

										<!-- 회원가입/정보 기본정보 -->
										<div class="base_info_box">
											<h3>기본정보</h3>

											<div class="base_info_sec">
												<table>
													<colgroup>
														<col width="25%">
														<col width="75%">
													</colgroup>
													<tbody>
														<tr>
															<th><span class="important">*아이디</span></th>
															<td><input type="text"
																value="${sessionScope.MEMBER_ID}" disabled="disabled">
																${MEMEBR_ID} <input type="hidden" name="MEMBER_ID"
																value="${sessionScope.MEMBER_ID}"></td>

														</tr>
														<tr>
															<th><span class="important">*현재 비밀번호</span></th>
															<td>
																<div class="member_warning">
																	<input type="text" name="MEMBER_PW"
																		value="${memberMap.MEMBER_PW}" maxlength="30"
																		placeholder="변경하실 비밀번호를 입력하세요.">
																	<div id="pw_info" class="text_pass">영문
																		대소문자/숫자/특수문자 모두 포함해서 8~20자</div>
																</div>
															</td>
														</tr>



														<tr>
															<th><span class="important">*이름</span></th>
															<td>
																<div class="member_warning">
																	<input type="text" name="MEMBER_NAME"
																		value="${memberMap.MEMBER_NAME}" maxlength="30"
																		placeholder="이름을 입력하세요.">
																</div>
															</td>
														</tr>
														<tr>
															<th><span>*이메일</span></th>
															<td class="member_email">
																<div class="member_warning">
																	<input type="text" name="MEMBER_EMAIL" id="email"
																		value="${memberMap.MEMBER_EMAIL}"
																		placeholder="이메일을 입력하세요.">
																</div>
															</td>
														</tr>
														<tr>
															<th><span>*전화번호</span></th>
															<td>
																<div class="member_warning">
																	<input type="text" id="phone" name="MEMBER_PHONE"
																		maxlength="12" placeholder="- 없이 입력하세요."
																		data-pattern="gdNum" value="${memberMap.MEMBER_PHONE}">
																</div>
															</td>
														</tr>
														<tr>
															<th>주소</th>
															<td><input type="text" id="sample4_postcode"
																placeholder="우편번호" name="MEMBER_ZIP"
																value="${memberMap.MEMBER_ZIP}"> <input
																type="button" class="btn_member_zipsearch"
																onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
																<input type="text" id="sample4_roadAddress"
																placeholder="도로명주소" name="MEMBER_ADD1"
																name="MEMBER_ADD1" value="${memberMap.MEMBER_ADD1}">
																<input type="text" id="sample4_jibunAddress"
																placeholder="지번주소" name="" value=""> <span
																id="guide" style="color: #999; display: none"></span> <br>
																<input type="text" id="sample4_detailAddress"
																placeholder="상세주소" name="MEMBER_ADD2"
																value="${memberMap.MEMBER_ADD2}"> <input
																type="text" id="sample4_extraAddress" placeholder="참고항목"
																name="MEMBER_ADD3" value="${memberMap.MEMBER_ADD3}"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- //base_info_sec -->
										</div>
										<!-- //base_info_box -->
										<!-- 회원가입/정보 기본정보 -->

										<div class="btn_center_box">

											<input type="submit" class="btn_comfirm js_btn_join"
												value="정보수정" onclick="${contextPath}/mypage/update" />
										</div>
									</form>
									<form action="${contextPath}/mypage/del">
										<div class="btn_center_box">
											<button type="button" class="btn_member_cancel"
												onclick="location.href='${contextPath}/mypage/del'">탈퇴</button>
										</div>
									</form>
									<!-- //btn_center_box -->

								</div>
								<!-- //member_cont -->
							</div>
							<!-- //join_base_wrap -->

						</div>
						<!-- //my_page -->

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