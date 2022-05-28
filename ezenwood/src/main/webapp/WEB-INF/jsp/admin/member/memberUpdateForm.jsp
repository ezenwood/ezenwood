<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
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
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
* {
	box-sizing: border-box;
}

body, th, td, input, select, textarea, button {
	font-size: 14px;
	line-height: 1.5;
	font-family: Lato, "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, "돋움",
		sans-serif;
	color: #333;
}

.wrapper {
	width: 1000px;
	margin: 0 auto;
}

.wrapper2 {
	width: 525px;
	margin: 0 auto;
}

.wrapper3 {
	border: 1px solid #ccc;
}

.wrapper4 {
	margin: 10px 20px;
}

.w3 {
	background-color: #dbdbdb;
	padding: 5px;
	padding-left: 15px;
}

h1 {
	margin-left: 20px;
}

table, th, td {
	border: 1px solid #ccc;
	padding: 5px 15px;
	border-collapse: collapse;
}

th {
	padding: 9px 10px 10px 10px;
	background: #f7f7f7;
	border-top: 1px solid #dbdbdb;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
	font-size: 12px;
	line-height: 1.5;
	font-family: Lato, "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, "돋움",
		sans-serif;
	text-align: left;
}

input[type=button] {
	width: 100px;
	height: 30px;
	background-color: #333;
	color: #fff;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper2">
			<h1>회원 정보 수정</h1>
			<div class="wrapper3">
				<div class="w3">회원정보를 수정합니다</div>
				<div>
					<div class="wrapper4">
						<form>
							<table>
								<colgroup>
									<col style="width: 20%;">
									<col>
								</colgroup>
								<tr>
									<th>아이디</th>
									<td>ddd</td>
								</tr>

								<tr>
									<th>비밀번호</th>
									<td>ddd</td>
								</tr>

								<tr>
									<th>이름</th>
									<td>ddd</td>
								</tr>

								<tr>
									<th>전화번호</th>
									<td>ddd</td>
								</tr>

								<tr>
									<th>이메일</th>
									<td><input type="text"> <select>
											<option value="">직접입력</option>
											<option value="네이버">naver.com</option>
											<option value="다음">daum.net</option>
											<option value="구글">google.com</option>
											<option value="이젠우드">ezenwood.cm</option>
									</select></td>
								</tr>

								<tr>
									<th>주소</th>
									<td><input type="text" id="sample4_postcode"
										placeholder="우편번호"> <input type="button"
										onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample4_roadAddress"
										placeholder="도로명주소"> <input type="text"
										id="sample4_jibunAddress" placeholder="지번주소"> <span
										id="guide" style="color: #999; display: none"></span> <input
										type="text" id="sample4_detailAddress" placeholder="상세주소">
										<input type="text" id="sample4_extraAddress"
										placeholder="참고항목"></td>
								</tr>
							</table>
						</form>
					</div>

					<div>
						<input type="button" value="수정"> <input type="button"
							value="탈퇴">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>