<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/order.css" type="text/css" rel="stylesheet">
    <title>주문서 작성</title>

</head>

<body>
<%@include file ="/include/header.jsp" %>
    <div id="container">
        <div id="contents">
            <div class="location_wrap">
                <div class="location_cont">
                    <em>
                        <a href="#" class="local_home">HOME</a>&nbsp;>주문서 작성 / 결제
                    </em>
                </div>
            </div>
            <!--//location_wrap-->
            <div class="sub_content">
                <div class="content_box">
                    <form id="frmOrder" name="frmOrder" action="#" method="post" novalidate="novalidate">
                        <div class="order_wrap">
                            <div class="order_tit">
                                <h2>주문서작성</h2>
                                <ol>
                                    <li><span>01</span> 장바구니 >&nbsp;</li>
                                    <li class="page_on"><span>02</span> 주문서작성/결제 >&nbsp;</li>
                                    <li><span>03</span> 주문완료</li>
                                </ol>
                            </div>
                            <!--//order_tit-->
                            <div class="order_cont">
                                <div class="cart_cont_list">
                                    <div class="order_cart_tit">
                                        <h3>주문상세내역</h3>
                                    </div>
                                    <!--//order_cart_tit-->
                                    <div class="order_table_type">
                                        <table>
                                            <colgroup>
                                                <col> <!-- 상품명/옵션 -->
                                                <col style="width:5%"> <!-- 수량 -->
                                                <col style="width:10%"> <!-- 상품금액 -->
                                                <col style="width:13%"> <!-- 할인/적립 -->
                                                <col style="width:10%"> <!-- 합계금액 -->
                                                <col style="width:10%"> <!-- 배송비 -->
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>상품 정보</th>
                                                    <th>수량</th>
                                                    <th>상품금액</th>
                                                    <th>배송비</th>
                                                    <th>합계금액</th>
                                                    <th>옵션</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                               <c:forEach items="${payListMap }" var="payMap" >
                                                <tr class="order-goods-layout" data-goodsno="상품번호">
                                                    <td class="td_left">
                                                        이미지
                                                        <div class="pick_add_cont">
                                                            <span class="pick_add_img">
                                                                <a href="/ezenwood/goods?idx=${payMap.GOODS_NUM }">
                                                                    <img src="/ezenwood/resource/image/${payMap.subImage }" width="400" height="600">
                                                                </a>
                                                            </span>
                                                            <div class="pick_add_info">
                                                                <em style="text-align: center">
                                                                    <a href="/ezenwood/goods?idx=${payMap.GOODS_NUM }">${payMap.GOODS_TITLE }</a>
                                                                </em>
                                                            </div>
                                                        </div>
                                                        <!--//pick_add_cont-->
                                                        <div class="pick_add_list">
                                                            <div class="pick_add_cont">
                                                                <div class="pick_option_box">
                                                                    <em><b>사이즈</b>
                                                                        :&nbsp;사이즈
                                                                    </em>
                                                                </div>
                                                            </div>
                                                            <!--//pick_add_cont-->
                                                        </div>
                                                        <!--//pick_add_list-->
                                                    </td>
                                                    <td class="td_order_amount">
                                                        <div class="order_goods_num">
                                                            <strong>${payMap.GOODS_AMOUNT }</strong>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <strong class="order_sum_txt price">${payMap.GOODS_PRICE * payMap.GOODS_AMOUNT }</strong>
                                                    </td>
                                                    <td class="td_delivery" rowspan="1">
                                                       ${payMap.GOODS_DCOST }
                                                    </td>
                                                    <td>
                                                        <strong class="order_sum_txt">${payMap.GOODS_PRICE * payMap.GOODS_AMOUNT + payMap.GOODS_DCOST }</strong>
                                                    </td>
                                                    <td class="order_option">
                                                        <strong>옵션</strong>
                                                    </td>

                                                </tr>

                                               
                                               
                                               </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--//cart_cont_list-->
                                <div class="btn_left_box">
                                    <a href="#" class="shop_go_link">
                                        <em>
                                            << 장바구니 가기 </em>
                                    </a>
                                </div>
                                <div class="price_sum">
                                    <div class="price_sum_cont">
                                        <div class="price_sum_list">
                                            <dl>
                                                <dt>총
                                                    <strong>${payInfo.goodsQuantity }</strong>개의 상품금액
                                                </dt>
                                                <dd><strong>${payInfo.priceSum }</strong></dd>
                                            </dl>
                                            <span>
                                                +
                                            </span>
                                            <dl>
                                                <dt>배송비</dt>
                                                <dd><strong>${payInfo.priceDSum }</strong>원</dd>
                                            </dl>
                                            <span>=</span>
                                            <dl class="price_total">
                                                <dt>합계</dt>
                                                <dd><strong>${payInfo.priceSum + payInfo.priceDSum }</strong>
                                                    원
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <!--//price_sum_cont-->
                                </div>
                                <!--//price_sum-->
                                <div class="payment_final">
                                    <div class="btn_center_box">
                                        <input type="button" name="btn_order_buy" onclick="location.href='/ezenwood/pay/step2'"   value="결제 진행하기" style="display: inline-block; width: 300px; height: 61px; line-height: 59px; color: #fff; font-size: 20px; border: 1px solid #323437; background: #323437; text-align: center">

                                    </div>
                                </div>
                            </div>
                            <!--//order_cont-->

                        </div>
                        <!--//order_wrap-->
                    </form>
                </div>
                <!--//content_box-->
            </div>
        </div>

    </div>
<%@include file ="/include/footer.jsp" %>
</body></html>
