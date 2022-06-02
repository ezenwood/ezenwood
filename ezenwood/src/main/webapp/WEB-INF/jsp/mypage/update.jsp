<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/button.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<title>update2</title>
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

			<div class="location_wrap">
				<div class="location_cont">
					<em><a href="/ezenwood/mypage/main" class="local_home">HOME</a> &gt; 마이페이지 &gt;
						내정보수정</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">

				<div class="side_cont">

					<%@include file="/include/left.jsp"%>
					<!-- //sub_menu_box -->
					<script type="text/javascript">
						// 메뉴 선택
						$(
								'.sub_menu_mypage li > a[href*="'
										+ document.location.pathname + '"]')
								.addClass('active');
					</script>
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
								<c:set var="contextPath"
							value="${pageContext.request.contextPath}" />
									<form id="formJoin" name="formJoin"
										action="${contextPath}/mypage/update"
										method="post" novalidate="novalidate">
										<input type="hidden" name="memNo" value="${member_num}">
										<input type="hidden" name="memberFl" value="personal">
										<input type="hidden" name="dupeinfo" value=""> <input
											type="hidden" name="rncheck" value="none"> <input
											type="hidden" name="mode" value="modify">

										<div class="location_wrap1">
											<div class="location_cont1">
												<em><a href="#" class="local_home1"
													style="font-weight: bold">정보입력</a>&gt;가입완료</em>
											</div>
										</div>
										<!-- //location_wrap -->
										<!-- 회원가입/정보 기본정보 -->
										<div class="base_info_box">
											<h3>기본정보</h3>

											<div class="base_info_sec">
												<table border="0" cellpadding="0" cellspacing="0">
													<colgroup>
														<col width="25%">
														<col width="75%">
													</colgroup>
													<tbody>
														<tr>
															<th><span class="important">*아이디</span></th>
															<td><input type="text" name="MEMBER_ID"
																value="${MEMBER_ID}" disabled="disabled"> ${MEMEBR_ID}</td>

														</tr>
														<div id="memberNewPw" class="member_pw_change"
															style="display: none">
															<tr>
																<th><span class="important">*현재 비밀번호</span></th>
																<td>
																	<div class="member_warning">
																		<input type="password" name="memCurrentPw"
																			maxlength="30" placeholder="현재 비밀번호를 입력하세요.">
																	</div>
																</td>
															</tr>
															<tr>
																<th><span class="important">*새 비밀번호</span></th>
																<td>
																	<div class="member_warning">
																		<input type="password" name="newPw" maxlength="300"
																			placeholder="새로운 비밀번호를 입력하세요.">
																	</div>
																</td>
															</tr>
															<tr>
																<th><span class="important">*새 비밀번호 확인</span></th>
																<td>
																	<div class="member_warning">
																		<input type="password" name="newPwCheck"
																			maxlength="30" placeholder="새로운 비밀번호를 입력하세요.">
																	</div>
																</td>
															</tr>
														</div>

														<tr>
															<th><span class="important">*이름</span></th>
															<td>
																<div class="member_warning">
																	<input type="text" name="memNm" value="${member_name}"
																		maxlength="30" placeholder="이름을 입력하세요.">
																</div>
															</td>
														</tr>
														<tr>
															<th><span>*이메일</span></th>
															<td class="member_email">
																<div class="member_warning">
																	<input type="text" name="email" id="email" value=""
																		placeholder="이메일을 입력하세요.">
																</div>
															</td>
														</tr>
														<tr>
															<th><span>*전화번호</span></th>
															<td>
																<div class="member_warning">
																	<input type="text" id="phone" name="phone"
																		maxlength="12" placeholder="- 없이 입력하세요."
																		data-pattern="gdNum" value="">
																</div>
															</td>
														</tr>
														<tr>
															<th>주소</th>
															<td><input type="text" id="sample4_postcode"
																placeholder="우편번호"> 
																<input type="button"
																onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
																<input type="text" id="sample4_roadAddress"
																placeholder="도로명주소"> 
																<input type="text"
																id="sample4_jibunAddress" placeholder="지번주소">
																 <span
																id="guide" style="color: #999; display: none"></span>
																<br>
																<input type="text" id="sample4_detailAddress"
																placeholder="상세주소"> 
																<input type="text"
																id="sample4_extraAddress" placeholder="참고항목"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- //base_info_sec -->
										</div>
										<!-- //base_info_box -->
										<!-- 회원가입/정보 기본정보 -->


										<iframe id="ifrmHpauthdel" name="ifrmHpauth"
											style="width: 500px; height: 500px; display: none;"></iframe>

										<iframe id="ifrmHpauth" name="ifrmHpauth"
											style="width: 500px; height: 500px; display: none;"></iframe>
										<div class="btn_center_box">
											<button type="button" class="btn_comfirm js_btn_join"
												value="정보수정">정보수정</button>
											<button type="button" class="btn_member_cancel">탈퇴</button>
										</div>
										<!-- //btn_center_box -->
									</form>
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