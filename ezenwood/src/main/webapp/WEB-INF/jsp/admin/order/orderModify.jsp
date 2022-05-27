<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ordermodify</title>
     <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
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
    <div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문수정</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading" >주문수정 페이지입니다.</div>
			<div class="panel-body">
				<form:form commandName="orderModel" action="orderModify.dog" enctype="multipart/form-data" method="post"name="joinform" onsubmit="return validateForm()">	
				<input type="hidden" name="order_num" value="${orderModel.order_num}">
                    <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" value="리틀테이블" style="width:initial;" readonly />                             
                        </div>
						<div class="form-group">
                            <label>주문번호</label>
                            <input type="text" class="form-control" value="1234-1" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>송장번호</label>
                            <input type="text" class="form-control" value="1123454" style="width:initial;" readonly/>                             
                        </div>
                        <div style="border:1px;" class="form-group">
                             <label>옵션창</label>
                            <input type="text" class="form-control" value="기본테이블" style="width:initial;" readonly/>                            
                        </div>	
                        <p>
                        <div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>주문자정보</label>
                           <br>
                            <label>이름</label>
                            <input type="text" class="form-control" value="홍길똥" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>휴대전화 번호</label>
                            <input type="text" class="form-control" value="010-0000-0000" style="width:initial;" readonly/>                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>이메일</label>
                            <input type="text" class="form-control" value="ezen.naver.com" style="width:initial;" readonly/>   
                                             <p/>
                        </div>
                          <div class="form-group">
                           <label>배송 정보</label>
                           <br>
                            <label>이름</label>
                            <input type="text" class="form-control" value="홍길똥" style="width:initial;"/>                             
                        </div>
                        <div class="form-group">
                            <label>휴대전화 번호</label>
                            <input type="text" class="form-control" value="010-0000-0000" style="width:initial;" />                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>요청사항</label>
                            <input type="text" class="form-control" value="배송 요청 사항" style="width:initial;" />   
                                             <p/>
                        </div>
                              <tr>
                        <label>주소</label><br>
                        <td><input type="text" id="sample4_postcode"
                           placeholder="우편번호"> <input type="button"
                           onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                           <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                           <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
                           <span id="guide" style="color: #999; display: none"></span><br> <input
                           type="text" id="sample4_detailAddress" placeholder="상세주소">
                           <input type="text" id="sample4_extraAddress" placeholder="참고항목">
                        </td>
                     </tr>
                    					
						<div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>결제정보</label>
                           <br>
                            <label>상품합계 금액</label>
                            <input type="text" class="form-control" value="2,222,999" style="width:initial;" readonly/>                             
                        </div>
                        
                         <div class="form-group">                            
                             <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                        <tr>
                                            <label>배송상태</label>
                                            <br>
                                            <td><select option_product_no="#" option_select_element="option-select-finder" option_sort_no="1" option_type="T" item_listing_type="C" option_title="DESIGN" product_type="product_option" product_option_area="#" name="option1" id="product_option_id1" class="ProductOption0" option_style="select" required="true">
                                                  
                                                    <optgroup label="Category">
                                                        <option value="#"> 결제대기 중 </option>
                                                        <option value="#"> 결제 완료</option>
                                                        <option value="#"> 배송준비 중</option>
                                                        <option value="#"> 배송 중</option>
                                                        <option value="#"> 배송 완료</option>
                                                        <option value="#"> 주문 취소</option>
                                                    </optgroup>
                                                </select>
                                                <p class="value"></p>
                                            </td>
                                        </tr>
                                    </tbody>
                        </div>
						
						<button type="submit" class="btn btn-success">수정</button>
						<button type="reset" class="btn btn-default">취소</button>					
				</form:form>
                   
                    </div>
	</div>
</div>
</body>
</html>