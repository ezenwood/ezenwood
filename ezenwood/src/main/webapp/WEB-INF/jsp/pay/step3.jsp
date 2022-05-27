<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
    <style>
        .wrapper{
            width: 1000px;
            margin: 0 auto;
        }
        body, th, td, input, select, textarea, button {
    font-size: 12px;
    line-height: 1.5;
    font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
    color: #333;
    }
        table, td, th{
            border-bottom: 1px solid #ccc;
            border-collapse: collapse;
            text-align: center;
        }
        th{
        padding: 9px 10px 10px 10px;
        background: #f7f7f7;
        border-top: 1px solid #999999;
        border-bottom: 1px solid #dbdbdb;
        background: #f7f7f7;
        font-size: 12px;
        line-height: 1.5;
        font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
       }
       
       .homebutton{
        
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
</head>
<body>
<div class="wrapper">
        <h1>주문 완료</h1>
        <hr>
        <div class="order_table_type">
            
            <table>
                <colgroup>
                    
                    <col>					<!-- 상품이미지 -->
                    <col style="width: 10%;">
                    <col style="width:5%">  <!-- 수량 -->
                    <col style="width:10%"> <!-- 상품금액 -->
                    
                    <col style="width:10%"> <!-- 배송비 -->
                    <col style="width:10%"> <!-- 합계금액 -->
                </colgroup>
                <thead>
                    <tr>
                        
                    <th colspan="2">상품/옵션정보</th>
                    <th>수량</th>
                    
                    <th>상품금액</th>
                    <th>배송비</th>
                    <th>합계금액</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="height: 600px;">이미지@@</td>
                        
                        <td><div class="상품/옵션정보">
                            <div class="상품정보"><em>상품이름</em></div><div class="옵션정보"><span class="text_type_cont">Size : 2000</span></div>
                        </div></td>
                        <td class="td_order_amount">수량@@</td>
                        <td>상품금액@@</td>
                        <td class="td_delivery">배송비@@</td>
                        <td>합계금액@@</td></tr>
                </tbody>
            </table>
        <div class="orderinfo" style="margin-top: 30px;">
            <span>주문일자</span>&nbsp;&nbsp;<span>2022/05/11</span><span style="border-left: 1px solid #ccc; margin-left: 20px; padding-left: 20px;">주문번호</span>&nbsp;&nbsp;<span>0000000</span>
            <hr>
            <h3>주문자 정보</h3>
            <table style="width: 500px;">
                <colgroup>
                <col style="width: 25%;">
                <col>
                </colgroup>
                <tr>
                    <th style="border-top: 1px solid #dbdbdb;">이름</th>
                    <td style="border-top: 1px solid #dbdbdb;">홍길동</td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>010-0000-1234</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>123423@123123.com</td>
                </tr>
            </table>
            <h3>배송 정보</h3>
            <table style="width: 500px;">
                <colgroup>
                    <col style="width: 25%;">
                    <col>
                    </colgroup>
                <tr>
                    <th style="border-top: 1px solid #dbdbdb;">우편번호</th>
                    <td style="border-top: 1px solid #dbdbdb;">홍길동</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>010-0000-1234</td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td>123423@123123.com</td>
                </tr>
            </table>
            <h3>결제 정보</h3>
            <table style="width: 500px;">
                <colgroup>
                    <col style="width: 25%;">
                    <col>
                    </colgroup>
                <tr>
                    <th style="border-top: 1px solid #dbdbdb;">총 결제금액</th>
                    <td style="border-top: 1px solid #dbdbdb;">229,000원</td>
                </tr>
                <tr>
                    <th>무통장 입금</th>
                    <td>010-0000-1234</td>
                </tr>
                
            </table>
        </div>
        
        
            <button class="homebutton">홈으로 가기</button>
        
        

    </div>
    </div>
</body>
</html>