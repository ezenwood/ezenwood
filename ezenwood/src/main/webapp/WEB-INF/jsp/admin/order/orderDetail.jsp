<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>orderdetail</title>
     <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript">
 window.onload = function(){
	var code ="${orderModel.order_trade_type}"
	for(var i=0; i<2; i++){
	    if(document.joinform.order_trade_type.options[i].value == code){
	        document.joinform.order_trade_type.options[i].selected = true;
	        break;
	    }
	}
	
	var code2 = "${orderModel.order_trade_payer}"
	for(var i=0; i<4; i++){
	    if(document.joinform.order_trade_payer.options[i].value == code2){
	        document.joinform.order_trade_payer.options[i].selected = true;
	        break;
	    }
	}
	var code3 = "${orderModel.order_status}"
		for(var i=0; i<6; i++){
		    if(document.joinform.order_status.options[i].value == code3){
		        document.joinform.order_status.options[i].selected = true;
		        break;
		    }
		}
} 
function validateForm() {
    var x = document.forms["joinform"]["goods_name"].value;
    if (x == null || x == "") {
        alert("상품명은 입력해야합니다");
        return false;
    }
}
</script>
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
        <div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">
    <div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문상세</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading" >주문상세 페이지입니다.</div>
			<div class="panel-body">
				<form:form  method="post"  >
				<input type="hidden" name="order_num" value="${orderModel.order_num}">
                    <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" value="${orderMap.GOODS_TITLE }" style="width:initial;" readonly />                             
                        </div>
						<div class="form-group">
                            <label>주문번호</label>
                            <input type="text" class="form-control" value="${orderMap.ORDERS_NUM }" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>송장번호</label>
                            <input type="text" class="form-control" name="ORDERS_TRACK" value="${orderMap.ORDERS_TRACK}" style="width:initial;" />                             
                        </div>
                        
                        <p>
                        <div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>주문자정보</label>
                           <br>
                            <label>이름</label>
                            <input type="text" class="form-control" value="${orderMap.MEMBER_NAME }" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>휴대전화 번호</label>
                            <input type="text" class="form-control" value="${orderMap.MEMBER_PHONE }" style="width:initial;" readonly/>                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>이메일</label>
                            <input type="text" class="form-control" value="${orderMap.MEMBER_EMAIL }" style="width:initial;" readonly/>   
                                             <p/>
                        </div>
                          <div class="form-group">
                           <label>배송 정보</label>
                           <br>
                            <label>이름</label>
                            <input type="text" class="form-control" value="${orderMap.ORDERS_RECEIVER }" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>휴대전화 번호</label>
                            <input type="text" class="form-control" value="${orderMap.ORDERS_PHONE }" style="width:initial;" readonly/>                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>요청사항</label>
                            <input type="text" class="form-control" value="${orderMap.ORDERS_DMEMO }" style="width:initial;" readonly/>   
                                             <p/>
                        </div>
                               <div class="form-group">
                            <label>배송 주소</label>
                            <br>
                            <input type="text" 
                           value="${orderMap.ORDERS_ZIPCODE }" readonly="readonly"> <br>
                           <input type="text" value="${orderMap.ORDERS_RADD1 }" readonly="readonly" >
                           <input type="text" value="jibun"  readonly="readonly">
                           <span id="guide" style="color: #999; display: none"></span><br> <input
                           type="text" value="${orderMap.ORDERS_RADD2 }" readonly="readonly" >
                           <input type="text" value="${orderMap.ORDERS_RADD3 }" readonly="readonly" > 
                    </div>
                                    
                    					
						<div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>결제정보</label>
                           <br>
                            <label>상품합계 금액</label>
                            <input type="text" class="form-control" value="${orderMap.ORDERS_TCOST }" style="width:initial;" readonly/>                             
                        </div>
                          <div class="form-group">
                            <label>배송상태</label>
                            <select name="ORDERS_STATUS" id="selectTag">
                            <option value="1">결제대기 중</option>
                            <option value="2">결제 완료</option>
                            <option value="3">배송준비 중</option>
                            <option value="4">배송 중</option>
                            <option value="5">배송 완료</option>
                            <option value="6">주문 취소</option>
                            </select>
                            <input type="text" class="form-control" value="${orderMap.DELIVERY_STATUES }" style="width:initial;" readonly/>   
                        
						
						<button type="submit" class="btn btn-success">수정</button>
						<button type="button" onclick="history.back()" class="btn btn-default">취소</button>					
				</form:form>
                   
                    </div>
	</div>
</div>
</div>
</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	var selectedOption = '${orderMap.ORDERS_STATUS}';
	$('#selectTag').val(selectedOption).prop("selected", true);

	});
	</script>
</html>