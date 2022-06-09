<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>주문완료</title>
    <style>
        
        table,
        td,
        th {
            border-bottom: 1px solid #ccc;
            border-collapse: collapse;
            text-align: center;
        }

        th {
            padding: 9px 10px 10px 10px;
            background: #f7f7f7;
            border-top: 1px solid #999999;
            border-bottom: 1px solid #dbdbdb;
            background: #f7f7f7;
            font-size: 12px;
            line-height: 1.5;
            font-family: Lato, "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, "돋움", sans-serif;
        }

        .homebutton {

            width: 200px;
            height: 50px;
            padding: 0 15px 0 15px;
            color: #626262;
            border: 1px solid #a3a3a3;
            text-align: center;
            line-height: 28px;
            margin: 50px 425px;
        }

    </style>
    <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/order.css" type="text/css" rel="stylesheet">
</head>

<body>
<%@include file ="/include/header.jsp" %>
    <div id="container">
        <div id="contents">
            <div class="location_wrap">
                <div class="location_cont">
                    <em>
                        <a href="#" class="local_home">HOME</a>&nbsp;> 주문완료
                    </em>
                </div>
            </div>
            <!--//location_wrap-->
            <div class="sub_content">
                <div class="content_box">
                    <form id="frmOrder" name="frmOrder" action="#" method="post" novalidate="novalidate">
                        <div class="order_wrap">
                            <div class="order_tit">
                                <h2>주문 완료</h2>
                                <ol>
                                    <li><span>01</span> 장바구니 >&nbsp;</li>
                                    <li><span>02</span> 주문서작성/결제 >&nbsp;</li>
                                    <li class="page_on"><span>03</span> 주문완료</li>
                                </ol>
                            </div>
                            <!--//order_tit-->
                            <div class="wrapper">
                                <br><br>
                                <div class="order_table_type">

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
                                                        <c:forEach items="${payInfo.payListMap }" var="payMap" >
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="orderinfo" style="margin-top: 30px; margin: 0 0 0 0; padding: 0 0 10px 0; font-size: 16px;">
                        <span>주문일자</span>&nbsp;&nbsp;<span>2022/05/11</span><span style="border-left: 1px solid #ccc; margin-left: 20px; padding-left: 20px;">주문번호</span>&nbsp;&nbsp;<span>0000000</span>
                        <hr>
                        <br>
                        <h3>주문자 정보</h3>
                        <table style="width: 100%; border: 0; border-spacing: 0; border-collapse: collapse; text-align: center; ">
                            <colgroup>
                                <col style="width: 25%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">이름</th>
                                <td style="border-top: 1px solid #dbdbdb;">${payInfo.memberMap.MEMBER_NAME }</td>
                            </tr>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">휴대폰 번호</th>
                                <td>${payInfo.memberMap.MEMBER_PHONE }</td>
                            </tr>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">이메일</th>
                                <td>${payInfo.memberMap.MEMBER_EMAIL }</td>
                            </tr>
                        </table>
                        <br>
                        <h3>배송 정보</h3>
                        <table style="width: 100%;">
                            <colgroup>
                                <col style="width: 25%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">수령인 이름</th>
                                <td style="border-top: 1px solid #dbdbdb;">${payInfo.memberMap.ORDER_RECEIVER }</td>
                            </tr>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">수령인 번호</th>
                                <td>${payInfo.memberMap.ORDER_PHONE }</td>
                            </tr>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">수령인 주소</th>
                                <td>${payInfo.memberMap.ORDER_RADD1}  ${payInfo.memberMap.ORDER_RADD2}  ${payInfo.memberMap.ORDER_RADD3}</td>
                            </tr>
                        </table>
                        <br>
                        <h3>결제 정보</h3>
                        <table style="width: 100%;">
                            <colgroup>
                                <col style="width: 25%;">
                                <col>
                            </colgroup>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">총 결제금액</th>
                                <td style="border-top: 1px solid #dbdbdb;">${payInfo.priceSum + payInfo.priceDSum }원</td> 
                            </tr>
                            <tr>
                                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">결제 수단</th>
                                <td>무통장 입금</td>
                            </tr>

                        </table>
                    </div>

                    <div class="btn_center_box" style="text-align: center">
                        <button class="homebutton" style=" vertical-align: middle; display: inline-block; width: 200px; height: 61px; line-height: 59px; color: #323437; font-size: 16px; border: 1px solid #323437; background: #ffffff; text-align: center;">홈으로 가기</button>
                    </div>



                </div>
            </div>
        </div>
    </div>
<%@include file ="/include/footer.jsp" %>
</body>

</html>
