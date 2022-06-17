<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이젠 우드 - 관리자 페이지</title>
    <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
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
<!-- 메뉴 시작 -->
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
<div id="page-wrapper" style="min-height: 703px;">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">회원정보수정</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">회원정보수정 페이지입니다.</div>
			<div class="panel-body">
						<form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>아이디</label>
                            <input type="text" class="form-control" name="MEMBER_ID" value="${memberUpdateMap.MEMBER_ID }" style="width:40%;" disabled>
                        </div>
                        
                        <div class="form-group">
                            <label>비밀번호</label>
                             <input type="text" name="MEMBER_PW" class="form-control" value="${memberUpdateMap.MEMBER_PW }" style="width:40%;">
                          </div>
                            <div class="form-group">
                       <label>이름</label><input type="text" class="form-control" name="MEMBER_NAME" value="${memberUpdateMap.MEMBER_NAME }" style="width:20%;">
                               </div>
    
                        <div class="form-group">                            
                             <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                        <tr>
                                            <label>탈퇴여부</label>
                                            <br>
                                            <td><select option_product_no="#" option_select_element="option-select-finder" option_sort_no="1" option_type="T" item_listing_type="C" option_title="DESIGN" product_type="member_del_gb" product_option_area="#" name="option1" id="member_del_gb" class="ProductOption0" option_style="select" required="true">
                                                  
                                                    <optgroup label="선택해주세요">
                                                        <option value="no"> N </option>
                                                        <option value="yes"> Y </option>
                                                 
                                                    </optgroup>
                                                </select>
                                                <p class="value"></p>
                                            </td>
                                        </tr>
                                    </tbody>
                        </div>
                               
                        <div class="form-group">
                            <label>전화번호</label>
                            <input type="text" class="form-control" name="MEMBER_PHONE" style="width:40%;"
                            placeholder="01011112222" value="${memberUpdateMap.MEMBER_PHONE }">
                        </div>
                           <div class="form-group">
                            <label>이메일</label>
                            <input type="text" class="form-control" name="MEMBER_EMAIL" style="width:40%;"
                            placeholder="aaa@aaa.com" value="${memberUpdateMap.MEMBER_EMAIL }">
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" id="sample4_postcode" name="MEMBER_ZIP" placeholder="우편번호" value="${memberUpdateMap.MEMBER_ZIP }"> <input type="button"
                            
										onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample4_roadAddress" name="MEMBER_ADD1" placeholder="도로명주소" value="${memberUpdateMap.MEMBER_ADD1}"> 
										<input type="text" id="sample4_jibunAddress"  placeholder="지번주소" value="${memberUpdateMap.MEMBER_ADD1}"> 
										<span id="guide" style="color: #999; display: none"></span><br> 
										<input type="text" id="sample4_detailAddress" name="MEMBER_ADD2" placeholder="상세주소" value="${memberUpdateMap.MEMBER_ADD2}">
										<input type="text" id="sample4_extraAddress" name="MEMBER_ADD3" placeholder="참고항목" value="${memberUpdateMap.MEMBER_ADD3}">
                        </div>
          
						<button type="submit" class="btn btn-success">회원수정</button>
						<button class="btn btn-default" onclick="location.href='/ezenwood/admin/memberList/1'">작성취소</button>
						</form>
			</div>
	</div>
	</div>
</div>



</body>
</html>