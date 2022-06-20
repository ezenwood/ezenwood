<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title> 이젠 우드</title>
     <link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
     <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
     <link href="/ezenwood/css/order.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function cartDelete(){
    var checked = $("td input[type=checkbox]:checked");
	var aaa=$($("td input[type=checkbox]:checked")[0]).siblings(".cartinsu")[0].value;
    for(let i = 1 ; i<checked.length; i++){
		aaa+=","+$($("td input[type=checkbox]:checked")[i]).siblings(".cartinsu")[0].value;
      
    }
    
    var obj = {"cartDeleteList" : aaa};
    
    $.ajax({
  	  url: "/ezenwood/cartDelete",
  	  type: "post",
  	  data: JSON.stringify(obj),
  	  dataType: "json",
  	  contentType: "application/json",
  	  success: function(data){
  		  if(data ==1){
  	            location.reload();
  	          }else{
  	        	location.reload();
  	          }
  	  }
    
    });
    
    

  }
  
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}
  
  
  function goodsOrder() {
	  
	  if(doubleSubmitCheck()) return;
	  
	  var orderGoodsNumArray = $($("td input[type=checkbox]:checked")[0]).siblings(".goodsNum")[0].value;
	  var orderGoodsAmountArray = $($("td input[type=checkbox]:checked")[0]).siblings(".goodsAmount")[0].value
	  
	  var checkboxnum = $("td input[type=checkbox]:checked").length;
	  
	  for(let i = 1 ; i< checkboxnum ; i++){
		  
		  orderGoodsNumArray += ","+ $($("td input[type=checkbox]:checked")[i]).siblings(".goodsNum")[0].value;
		  orderGoodsAmountArray += ","+ $($("td input[type=checkbox]:checked")[i]).siblings(".goodsAmount")[0].value;
		  
	  }
	  
	  
	  
	  
	  var form = document.createElement("form");
	  form.setAttribute("method","post");
	  form.setAttribute("action","/ezenwood/pay/step1");
	  
	  var input_GOODS_NUM = document.createElement("input");
	  var input_GOODS_AMOUNT = document.createElement("input");
	  
	    input_GOODS_NUM.setAttribute("type", "hidden");
		input_GOODS_NUM.setAttribute("name", "ORDERS_GOODS_NUM");		
		input_GOODS_NUM.setAttribute("value", orderGoodsNumArray);
		
		input_GOODS_AMOUNT.setAttribute("type", "hidden");
		input_GOODS_AMOUNT.setAttribute("name", "ORDERS_AMOUNT");
		input_GOODS_AMOUNT.setAttribute("value", orderGoodsAmountArray);
	  
		form.appendChild(input_GOODS_NUM); 
		form.appendChild(input_GOODS_AMOUNT); 
		
		
		document.body.appendChild(form);
		
		form.submit();
	  
	
}

</script>
  <script>
        $(document).ready(function(){
        	
        	
        	
        	
        	
        	
        	

            $("#allcheck").on("change",function(){
                if (this.checked){
                    $("td").children().prop("checked",true);
                    var checkboxnum = $("td input[type=checkbox]:checked").length;
                document.getElementById("productnumber").innerHTML=checkboxnum;
                var sum_td_pricePT = 0;
                for(let i = 0 ; i<$("td input[type=checkbox]:checked").length ; i++){
                    //alert($("td input[type=checkbox]:checked")[i].parent().siblings(".td_priceP").innerHTML);
                    sum_td_pricePT+=parseInt($($("td input[type=checkbox]:checked")[i]).parent().siblings("td.td_priceP").text());
                }
                var sum_td_priceDT = 0;
                for(let i = 0 ; i<$("td input[type=checkbox]:checked").length ; i++){
                    
                    sum_td_priceDT+=parseInt($($("td input[type=checkbox]:checked")[i]).parent().siblings("td.td_priceD").text());
                }     
                
                document.getElementsByClassName("priceP")[0].innerHTML= sum_td_pricePT;
                document.getElementsByClassName("priceD")[0].innerHTML= sum_td_priceDT;
                document.getElementsByClassName("priceT")[0].innerHTML= sum_td_priceDT + sum_td_pricePT;
                    
                }else{
                    $("td").children().prop("checked",false);
                    var checkboxnum = $("td input[type=checkbox]:checked").length;
                document.getElementById("productnumber").innerHTML=checkboxnum;
                var sum_td_pricePT = 0;
                for(let i = 0 ; i<$("td input[type=checkbox]:checked").length ; i++){
                    
                    sum_td_pricePT+=parseInt($($("td input[type=checkbox]:checked")[i]).parent().siblings("td.td_priceP").text());
                }
                var sum_td_priceDT = 0;
                for(let i = 0 ; i<$("td input[type=checkbox]:checked").length ; i++){
                    
                    sum_td_priceDT+=parseInt($($("td input[type=checkbox]:checked")[i]).parent().siblings("td.td_priceD").text());
                }     
                
                document.getElementsByClassName("priceP")[0].innerHTML= sum_td_pricePT;
                document.getElementsByClassName("priceD")[0].innerHTML= sum_td_priceDT;
                document.getElementsByClassName("priceT")[0].innerHTML= sum_td_priceDT + sum_td_pricePT;
                }
                
            })

            
                $("td input[type=checkbox]").change(function(){
                var checkboxnum = $("td input[type=checkbox]:checked").length;
                document.getElementById("productnumber").innerHTML=checkboxnum;
                var sum_td_pricePT = 0;
                for(let i = 0 ; i<$("td input[type=checkbox]:checked").length ; i++){
                    
                    sum_td_pricePT+=parseInt($($("td input[type=checkbox]:checked")[i]).parent().siblings("td.td_priceP").text());
                }
                var sum_td_priceDT = 0;
                for(let i = 0 ; i<$("td input[type=checkbox]:checked").length ; i++){
                    
                    sum_td_priceDT+=parseInt($($("td input[type=checkbox]:checked")[i]).parent().siblings("td.td_priceD").text());
                }     
                
                document.getElementsByClassName("priceP")[0].innerHTML= sum_td_pricePT;
                document.getElementsByClassName("priceD")[0].innerHTML= sum_td_priceDT;
                document.getElementsByClassName("priceT")[0].innerHTML= sum_td_priceDT + sum_td_pricePT;
            
                
                });
         
        });
 
    </script>
</head>
<body>
   
<%@include file ="/include/header.jsp" %>

    <div id="container">
        <div id="contents">
        <!-- 본문 시작 -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; 장바구니</em>
                </div>
            </div>
            <!-- //location_wrap -->

            <div class="sub_content">

                <!-- //side_cont -->

<div class="content_box">
    <div class="order_wrap">
        <div class="order_tit">
            <h2>장바구니</h2>
            <ol>
                <li class="page_on"><span>01</span> 장바구니 <span><img src="/data/skin/front/mime/img/member/icon_join_step_on.png" alt=""></span></li>
                <li><span>02</span> 주문서작성/결제<span><img src="/data/skin/front/mime/img/member/icon_join_step_off.png" alt=""></span></li>
                <li><span>03</span> 주문완료</li>
            </ol>
        </div>
        <!-- //order_tit -->

        <div class="cart_cont">

            <form id="frmCart" name="frmCart" method="post" target="ifrmProcess">
                <input type="hidden" name="mode" value="">
                <input type="hidden" name="cart[cartSno]" value="">
                <input type="hidden" name="cart[goodsNo]" value="">
                <input type="hidden" name="cart[goodsCnt]" value="">
                <input type="hidden" name="cart[addGoodsNo]" value="">
                <input type="hidden" name="cart[addGoodsCnt]" value="">
                <input type="hidden" name="useBundleGoods" value="1">
                <!-- 장바구니 상품리스트 시작 -->

                <div class="cart_cont_list">
                    <div class="order_cart_tit">
                    </div>
                    <!-- //order_cart_tit -->

                    <div class="order_table_type">
                        <table>
                            <colgroup>
                                <col style="width:3%">  <!-- 체크박스 -->
                                <col style="width:25%">	<!-- 상품명/옵션 -->
                                <col style="width:5%">  <!-- 수량 -->
                                <col style="width:10%"> <!-- 상품금액 -->
                                <col style="width:10%"> <!-- 합계금액 -->
                                <col style="width:10%"> <!-- 배송비 -->
                            </colgroup>
                            <thead>
                            <tr>
                                <th>
                                   <input type="checkbox" id="allcheck" class="gd_select_all_goods" >
                                    <label for="allCheck1" class="check_s on"></label>
                                    </th>
                                <th>상품/옵션 정보</th>
                                <th>수량</th>
                                <th>상품금액</th>  
                                <th>배송비</th>
                                <th>합계금액</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${cartListMap }" var="cartMap" >
                            <tr>
                                <td class="td_chk">
                                    
                                        <input type="checkbox" id="cartSno1_17181" name="cartSno[]" value="17181">
                                        <input type="hidden" class="cartinsu" value="${cartMap.BASKET_NUM }"  >
                                        <input type="hidden" class="goodsNum" value="${cartMap.goodsMap.GOODS_NUM }"  >
                                        <input type="hidden" class="goodsAmount" value="${cartMap.BASKET_GOODS_AMOUNT }"  >
                                        <label for="cartSno1_17181" class="check_s on"></label>
                                   
                                </td>
                                <td class="td_left">
                                    <div class="pick_add_cont">
                                        <span class="pick_add_img">
                                            <a href="/ezenwood/goods?idx=${cartMap.goodsMap.GOODS_NUM }"><img src="/ezenwood/resource/image/${cartMap.subImage }" width="400" height="300" alt="pet1" title="pet1" class="middle"></a>
                                        </span>
                                    </div>
                                    <!-- //pick_add_cont -->

                                    <!-- //pick_add_list -->

                                </td>
                                <td class="td_order_amount">
                                    <div class="order_goods_num">
                                        <strong>${cartMap.BASKET_GOODS_AMOUNT }개</strong>
                    
                                    </div>
                                </td>
                                <td class="td_priceP"><strong>${cartMap.goodsMap.GOODS_PRICE * cartMap.BASKET_GOODS_AMOUNT }</strong></td>
                               
                                <td class="td_priceD"><strong>${cartMap.goodsMap.GOODS_DCOST}</strong></td>
                          
                                <td class="td_priceT"><strong>${cartMap.goodsMap.GOODS_PRICE * cartMap.BASKET_GOODS_AMOUNT + cartMap.goodsMap.GOODS_DCOST }</strong></td>
                            </tr>
                            
                            </c:forEach>

                            </tbody>


                        </table>
                    </div>

                </div>
                <!-- //cart_cont_list -->
                <!-- 장바구니 상품리스트 끝 -->


            </form>

            <div class="btn_left_box">
                <a href="/ezenwood/main" class="shop_go_link"><em>&lt; 쇼핑 계속하기</em></a>
            </div>

            <div class="price_sum">
                <div class="price_sum_cont">
                    <div class="price_sum_list">
                        <dl>
                            <dt>총 <strong id="productnumber">0</strong> 개의 상품금액 </dt>
                            <dd><p class="priceP"></p></dd>
                        </dl>
                          <span>+</span>
                        <dl>
                            <dt>배송비</dt>
                            <dd><p class="priceD"></p></dd>
                        </dl>
                        <span>=</span>
                        <dl class="price_total">
                            <dt>합계</dt>
                            <dd> <p class="priceT"></p>
                            </dd>
                        </dl>
                    </div>
                    <em id="deliveryChargeText" class="tobe_mileage"></em>
                </div>
                <!-- //price_sum_cont -->
            </div>
            <!-- //price_sum -->

            <div class="btn_order_box" style="text-align:center ">
               
                <span class="btn_center_box">
                   <button type="button" class="btn_order_whole_buy" onclick="cartDelete()">상품 삭제</button>
                    <button type="button" class="btn_order_whole_buy" onclick="goodsOrder()">상품 주문</button>
                </span>
            </div>
            <!-- //btn_order_box -->
            <!-- //sub_content -->
        </div>
        <!-- //본문 끝 contents -->
    </div>
        

   </div>
            </div>
            <!-- //pay_box -->
        </div>
        <!-- //cart_cont -->
    </div>
    <!-- //order_wrap -->
</div>
<%@include file ="/include/footer.jsp" %>

</body>
</html>