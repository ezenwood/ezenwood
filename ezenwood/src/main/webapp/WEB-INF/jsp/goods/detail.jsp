<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var doubleSubmitFlag = false;
	    function doubleSubmitCheck(){
	        if(doubleSubmitFlag){
	            return doubleSubmitFlag;
	        }else{
	            doubleSubmitFlag = true;
	            return false;
	        }
	    }
		
		
		$("#buyinsu").click(function(){
			
			if(doubleSubmitCheck()) return;
			
			var form = document.createElement("form");
			
			form.setAttribute("method","post");
			
			form.setAttribute("action","/ezenwood/pay/step1");
			
			
			var input_GOODS_NUM = document.createElement("input");
			var input_GOODS_AMOUNT = document.createElement("input");
			
			input_GOODS_NUM.setAttribute("type", "hidden");
			input_GOODS_NUM.setAttribute("name", "ORDERS_GOODS_NUM");
			input_GOODS_NUM.setAttribute("value", "${GOODS_MAP.GOODS_NUM}");
			
			input_GOODS_AMOUNT.setAttribute("type", "hidden");
			input_GOODS_AMOUNT.setAttribute("name", "ORDERS_AMOUNT");
			input_GOODS_AMOUNT.setAttribute("value", $("#option_box1_quantity")[0].value);
			
			
			
			form.appendChild(input_GOODS_NUM); 
			form.appendChild(input_GOODS_AMOUNT); 
			
			
			document.body.appendChild(form);
			
			form.submit();
			
			
			
			
			
		});
		
		

		$("#cartButton").click(function() {

			var GOODS_NUM = '${GOODS_MAP.GOODS_NUM}';

			var GOODS_AMOUNT = $("#option_box1_quantity")[0].value;
			var obj = {
				"BASKET_GOODS_NUM" : GOODS_NUM,
				"BASKET_GOODS_AMOUNT" : GOODS_AMOUNT
			};

			$.ajax({
				url : "/ezenwood/cart",
				type : "post",
				data : JSON.stringify(obj),
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					if (data == 1) {
						alert("장바구니 추가 성공");
					} else {
						alert("fail");
					}
				}

			});

		});

	});
	
	
	
	
</script>
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/goods_detail.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="sub_content">
				<div id="detail_inner">

					<!-- 상단 제품 정보  -->
					<div class="xans-element- xans-product xans-product-detail">

						<div class="detailArea">
							<!-- 이미지 영역 -->
							<div
								class="xans-element- xans-product xans-product-image imgArea ">
								<div class="keyImg">
									<div class="thumbnail">
										<a href="#none" alt="P00000TJ"> <img
											src="/ezenwood/resource/image/${GOODS_MAP.GOODS_SUBIMAGE }" alt="May Table"
											class="BigImage ">
										</a>
									</div>
								</div>

								<!-- //참고 -->

							</div>
							<!-- //이미지 영역 -->

							<!-- 상세정보 내역 -->
							<div class="infoArea">
								<div class="product_title titleicon ">
									${GOODS_MAP.GOODS_TITLE } <span class="delivery displaynone"></span>
								</div>

								<div class="custom_pro displaynone  dj_count0">
									<span class="dj-mov-fade-in-out2">0%</span>
								</div>
								<div class="www_clear">
									<div
										class="xans-element- xans-product xans-product-detaildesign www_price">
										<!--
                    출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
                    count = 10
                -->
										<div border="0" summary="">
											<ul>
												<li style="display: none"
													class=" product_name_css xans-record-"><span
													class="title"><span
														style="font-size: 16px; color: #555555;">${GOODS_MAP.GOODS_TITLE }</span></span>
													<span class="con"><span
														style="font-size: 16px; color: #555555;">${GOODS_MAP.GOODS_TITLE }</span></span>
												</li>
												<li class=" simple_desc_css xans-record-"><span
													class="title"><span
														style="font-size: 12px; color: #555555;">상품간략설명</span></span> <span
													class="con"><span
														style="font-size: 12px; color: #555555;">${GOODS_MAP.GOODS_CONTENT1 }
													</span></span></li>
												<li class=" product_price_css xans-record-"><span
													class="title"><span
														style="font-size: 12px; color: #000000; font-weight: bold;">판매가</span></span>
													<span class="con"><span
														style="font-size: 12px; color: #000000; font-weight: bold;"><strong
															id="span_product_price_text">${GOODS_MAP.GOODS_PRICE }</strong></span></span>
												</li>
												<li class=" quantity_css xans-record-"><span
													class="title"><span
														style="font-size: 12px; color: #555555;">수량</span></span> <span
													class="con"><span
														style="font-size: 12px; color: #555555;"><span
															id="NewProductQuantityDummy"><span
																class="quantity"><img
																	src="/ezenwood/resource/image/btn_basketUp.gif"
																	class="QuantityUp" alt="수량증가"><img
																	src="/ezenwood/resource/image/btn_basketDown.gif"
																	class="QuantityDown" alt="수량감소"></span></span></span></span></li>
											</ul>
										</div>
									</div>

								</div>



								<table border="0" summary=""
									class="xans-element- xans-product xans-product-option xans-record-">
									<caption>상품 옵션</caption>
									<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
									<tbody></tbody>
									<tbody
										class="xans-element- xans-product xans-product-option xans-record-">
										<tr>
											<th scope="row">OPTION</th>
											<td><select option_product_no="503"
												option_select_element="ec-option-select-finder"
												option_sort_no="1" option_type="T" item_listing_type="C"
												option_title="DESIGN" product_type="product_option"
												product_option_area="product_option_503_0" name="option1"
												id="product_option_id1" class="ProductOption0"
												option_style="select" required="true">
													<option value="*" selected="" link_image="">- [필수]
														옵션을 선택해 주세요 -</option>
													<option value="**" disabled="" link_image="">-------------------</option>
													<optgroup label="Option">
														<option value="P00000TJ000B">Oak</option>
														<option value="P00000TJ000C">Dark Brown</option>
													</optgroup>
											</select>
												<p class="value"></p></td>
										</tr>
									</tbody>
									<tbody>
										<tr class="displaynone" id="">
											<td colspan="2" class="selectButton"><a href="#none"
												onclick=""><img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_manual_select.gif"
													alt="옵션 선택"></a></td>
										</tr>
									</tbody>
									<!-- //참고 -->
								</table>
								<div class="guideArea ">
									<span class="sizeGuide displaynone"><a href="#none"
										class="size_guide_info" product_no="503">사이즈 가이드</a></span>
								</div>
								<!-- form start -->
								
									<div id="totalProducts" class=" ">
										<table border="0" summary>
											<caption>상품 목록</caption>
											<colgroup>
												<col style="width: 284px;">
												<col style="width: 80px;">
												<col style="width: 110px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">상품명</th>
													<th scope="col">상품수</th>
													<th scope="col">가격</th>
												</tr>
											</thead>
											<tbody class="displaynone">
												<tr>
													<td>${GOODS_MAP.GOODS_TITLE }</td>
													<td><span class="quantity"> <a href="#none"><img
																src="/ezenwood/resource/image/btn_basketUp.gif"
																alt="수량증가" class="QuantityUp up"></a> <a href="#none"><img
																src="/ezenwood/resource/image/btn_basketDown.gif"
																alt="수량감소" class="QuantityDown down"></a>
													</span></td>
													<td class="right"><span class="quantity_price">${GOODS_MAP.GOODS_PRICE }</span>
													</td>
												</tr>
											</tbody>
											<!-- 참고 : 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다.-->
											<tbody class="option_products">
												<tr class="option_product " data-option-index="1"
													target-key="#">
													<td>

														<p class="product">${GOODS_MAP.GOODS_TITLE }</p>
													</td>
													<td><span class="quantity" style="width: 65px;"><input
															type="hidden" name="ORDERS_GOODS_NUM"
															value="${GOODS_MAP.GOODS_NUM }"> <input
															type="text" id="option_box1_quantity"
															name="ORDERS_AMOUNT"
															class="quantity_opt eProductQuantityClass" value="1"
															product-no="503"><a href="#none"
															class="up eProductQuantityUpClass"
															data-target="option_box1_up"><img
																src="/ezenwood/resource/image/btn_basketUp.gif"
																id="option_box1_up" class="option_box_up" alt="수량증가"></a>
															<a href="#none" class="down eProductQuantityDownClass"
															data-target="option_box1_down"> <img
																src="/ezenwood/resource/image/btn_basketDown.gif"
																id="option_box1_down" class="option_box_down" alt="수량감소"></a>
													</span> <a href="#none" class="delete"><img
															src="/ezenwood/resource/image/btn_scroll_list_del.png"
															alt="삭제" id="option_box1_del" class="option_box_del"></a>
													</td>
													<td class="right"><span id="option_box1_price">

															<span class="ec-front-product-item-price"
															code="P00000TJ000B" product-no="503">${GOODS_MAP.GOODS_PRICE }
																won</span>

													</span></td>
												</tr>





											</tbody>
											<!-- //참고 -->
										</table>
								
							</div>
							<!-- //참고 -->

							<div id="totalPrice" class="totalPrice">
								<strong>TOTAL</strong> : <span class="total"><strong><em>0</em></strong>
									(0개)</span>
							</div>

							<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
							<div class="xans-element- xans-product xans-product-action ">
								<div class="ec-base-button">
									<a href="#none" class="first dj-btn-1  wwwbuy"
										onclick="product_submit(1, '#', this)" id="buyinsu" >buy now</a> <a
										href="#none" id="cartButton" class="dj-btn-1-2  wwwcart"
										onclick="product_submit(2, '#', this)">add cart</a> <span
										class="dj-btn-1-2 displaynone wwwsoldout">SOLD OUT</span>

								</div>



							</div>
							<!-- //참고 -->
						</div>
					</div>

				</div>
				<!-- //상단 제품 정보 -->

				<!-- 쿠폰 다운로드 -->
				<!-- //쿠폰 다운로드 -->


				<!-- 추가구성상품 -->
				<div
					class="xans-element- xans-product xans-product-detail set_prd_all "></div>
				<!--// 추가구성상품 -->








				<div class="xans-element- xans-product xans-product-additional">
					<!-- 상품상세정보 -->
					<div id="prdDetail" class="ec-base-tab_detail grid5 ">
						<div class="tab_margin"></div>
						<div class="detail_tap_inner">
							<ul class="menu">
								<li class="selected"><a href="#prdDetail">상품상세정보</a></li>
								<li><a href="#prdInfo">상품구매안내</a></li>
								<li><a href="#prdReview" class="wwwreview">상품후기 <span
										class="count">0</span></a></li>
								<li><a href="#prdQnA" class="wwwqna">상품Q&amp;A <span
										class="count">0</span></a></li>
							</ul>
						</div>

						<div class="xans-element- xans-product xans-product-detail ">

						</div>


						<div class="cont">
							<div class="edibot-product-detail"
								style="width: 1000px; max-width: 100%; margin: 0 auto;">

								<div style="position: relative;" class="edb-img-tag-w">
									<img alt="#" src="/ezenwood/resource/image/${GOODS_MAP.GOODS_IMAGE }"
										style="margin: 0 auto; display: block; max-width: 100%;">
								</div>

								<div style="position: relative;" class="edb-img-tag-w">
									<div
										style="width: 100%; height: 100%; position: relative; font-family: &amp; quot; malgun gothic&amp;quot; , sans-serif; font-size: 14px; color: #000000; font-style: normal; font-weight: 400; text-align: center; line-height: 1.5; letter-spacing: 0; word-spacing: 0; background-color: rgba(255, 255, 255, 0); text-decoration-skip-ink: none;">
										<div style="text-align: left;">
											<span
												style="font-size: 13px; background-color: rgba(0, 0, 0, 0);">
												${GOODS_MAP.GOODS_CONTENT2 } </span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- //상품상세정보 -->
					<!-- 상품구매안내 -->
					<div id="prdInfo" class="ec-base-tab_detail grid5 ">
						<div class="tab_margin"></div>
						<div class="detail_tap_inner">
							<ul class="menu">
								<li><a href="#prdDetail">상품상세정보</a></li>
								<li class="selected"><a href="#prdInfo">상품구매안내</a></li>
								<li><a href="#prdReview" class="wwwreview">상품후기 <span
										class="count">0</span></a></li>
								<li><a href="#prdQnA" class="wwwqna">상품Q&amp;A <span
										class="count">0</span></a></li>
							</ul>
						</div>

						<div class="cont_all">
							<ul>
								<li class="cont">
									<div class="cont_inner">
										<h3>배송정보</h3>
										<ul class="delivery">
											<li>배송 방법 : 택배</li>
											<li>배송 지역 : 전국지역</li>
											<li>배송 비용 : 50,000 won</li>
											<li>배송 기간 : 5일 ~ 10일</li>
											<li>배송 안내 : <br> 1. 5일 ~ 10일의 배송 기간은 영업일 기준, 주말 및
												공휴일을 제외한 기간입니다.<br> 2. 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는
												경우가 있습니다.<br> 3. 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만,
												상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
											</li>
										</ul>
									</div>
								</li>
								<li class="cont">
									<div class="cont_inner">
										<h3>교환 및 반품정보</h3>
										<b>교환 및 반품이 가능한 경우</b><br> - 상품을 공급 받으신 날로부터 7일이내.&nbsp;
										<div>
											- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br> &nbsp;&nbsp;다르거나 다르게
											이행된 경우에는 공급받은 날로부터 7일이내.
										</div>
										<div>
											<br> <b>교환 및 반품이 불가능한 경우</b>
											<div>
												- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
												&nbsp;&nbsp;포장 등을 훼손한 경우는 제외
											</div>
											<div>
												- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우.<br> - 시간의
												경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br> - 복제가 가능한
												상품등의 포장을 훼손한 경우<br> &nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1
												E-MAIL상담을 이용해 주시기 바랍니다.)<br>
												<br>*고객님의 단순변심으로 인해 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야
												합니다.<br> &nbsp;&nbsp;(색상 교환, 사이즈 교환 등 포함)
											</div>
											<div>&nbsp;모니터마다 표현하는 색상이 다르기때문에, 색상이 생각한것과 다르다는 이유는
												반품사유가 되지 않습니다</div>
											<div>
												반품을 원할 시 비용은 고객님께서 부담하셔야 합니다.<br>
												<div>
													<br>
												</div>
												<div>
													<br>
												</div>
												<div>
													<br>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>

						</div>
					</div>
					<!-- //상품구매안내 -->

					<!-- 상품사용후기 -->
					<div class="item_goods_sec"
						style="margin: 100px 0 0 0; position: relative;">
						<div id="prdReview" class="ec-base-tab_detail grid5 "
							style="padding-top: 100px; margin: 100px 0 0 0;">
							<div class="tab_margin"></div>
							<div class="detail_tap_inner">
								<ul class="menu">
									<li><a href="#prdDetail">상품상세정보</a></li>
									<li><a href="#prdInfo">상품구매안내</a></li>
									<li class="selected"><a href="#prdReview"
										class="wwwreview">상품후기 <span class="count">0</span></a></li>
									<li><a href="#prdQnA" class="wwwqna">상품Q&amp;A <span
											class="count">0</span></a></li>
								</ul>
							</div>

							<div class="board">
								<div class="ec-base-button typeBorder">
									<span>
										<h3>REVIEW</h3>
									</span> <span class="gRight"> <a
										href="/ezenwood/goods/review/write?GOODS_NUM=${GOODS_MAP.GOODS_NUM }"
										class="dj-btn-2">WRITE</a> <a
										href="/ezenwood/goods/review?GOODS_NUM=${GOODS_MAP.GOODS_NUM }&p=1"
										class="dj-btn-2">LIST</a>
									</span>
								</div>
								<table>
									<c:forEach items="${reviewListMap }" var="reviewMap"
										varStatus="status">
										<tr>
											<td style="width: 70%"><a
												href="goods/review/${reviewMap.REVIEW_NUM }">${reviewMap.REVIEW_TITLE }</a>
											</td>
										 	<%-- <td style="width: 10%">${reviewMap.REVIEW_WRITER }</td> --%>
										 	<td style="width: 10%">${MEMBER_NAME}</td>
											<td style="width: 20%"><fmt:formatDate
													value="${reviewMap.REVIEW_DATE }" dateStyle="medium" /></td>

										</tr>
									</c:forEach>
								</table>

							</div>
							<!-- //상품사용후기 -->
							<!-- 상품 Q&A -->
							<div id="prdQnA" class="ec-base-tab_detail grid5 ">
								<div class="tab_margin"></div>
								<div class="detail_tap_inner">
									<ul class="menu">
										<li><a href="#">상품상세정보</a></li>
										<li><a href="#">상품구매안내</a></li>
										<li><a href="#" class="wwwreview">상품후기 <span
												class="count">0</span></a></li>
										<li class="selected"><a href="#prdQnA" class="wwwqna">상품Q&amp;A
												<span class="count">0</span>
										</a></li>
									</ul>
								</div>


								<div class="board">
									<div class="ec-base-button typeBorder">
										<span>
											<h3>Q &amp; A</h3>
										</span> <span class="gRight"> <a
											href="/ezenwood/goods/qna/write?GOODS_NUM=${GOODS_MAP.GOODS_NUM }"
											class="dj-btn-2">WRITE</a> <a
											href="/ezenwood/goods/qna?GOODS_NUM=${GOODS_MAP.GOODS_NUM }&p=1"
											class="dj-btn-2">LIST</a>
										</span>
									</div>
									<table>
										<c:forEach items="${QNAListMap }" var="QNAMap"
											varStatus="status">
											<tr>
												<td style="width: 70%"><a
													href="goods/qna/${QNAMap.QNA_NUM }">${QNAMap.QNA_TITLE }</a>
												</td>
												<%-- <td style="width: 10%">${QNAMap.QNA_WRITER }</td> --%>
												<td style="width: 10%">${MEMBER_NAME}</td>
												<td style="width: 20%"><fmt:formatDate
														value="${QNAMap.QNA_DATE }" dateStyle="medium" /></td>

											</tr>
										</c:forEach>
									</table>

								</div>
							</div>
							<!-- //상품Q&A -->
						</div>


					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>