<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성/결제</title>
 <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .content-wrapper{
            width: 1000px;
            margin: 0 auto;
        }
        th{
            background-color: #ccc;

        }
        table, td, th{
            border-bottom: 1px solid #ccc;
            border-collapse: collapse;
            text-align: center;
        }
        th {
    padding: 9px 10px 10px 10px;
    border-top: 1px solid #999999;
    border-bottom: 1px solid #dbdbdb;
    background: #f7f7f7;
    font-size: 12px;
    line-height: 1.5;
    font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
    color: #333;
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}
body, th, td, input, select, textarea, button {
    font-size: 12px;
    line-height: 1.5;
    font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
    color: #333;
}
.fin{
           margin: 10px 0px;
           
           height: 90px;
           border: 1px solid #ccc;
           padding: 10px;
           padding-left: 500px;
           font-size: 24px;
       }
.fin div{
    display: inline-block;
    color: #333;
    line-height: 1.5;
    text-align: right;
    font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
}
.homebutton{
        
        width: 200px;
        height: 50px;
        padding: 0 15px 0 15px;
        color: #ffffff;
        border: 1px solid #323437;
        background: #323437;
        text-align: center;
        line-height: 28px;
        margin: 50px 400px;
       }
    </style>
</head>
<body>
 <div class="content-wrapper">
        <h1>주문서 작성/결제</h1>
        
        <div class="order_table_type">
            <form>
            <table style="width: 100%;">
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
        </form>
        
        </div>
        <div class="fin">
            <div class="price">
                <p>총 <b>1</b>개 상품 금액</p>
                <p>299,000원</p>
            </div>
            <div class="plus">
                +
            </div>
            <div class="deprice">
                <p>배송비</p>
                <p>0원</p>
            </div>
            <div class="equal">
                =
            </div>
            <div class="totalprice">
                <p>합계</p>
                <p>299,000원</p>
            </div>
        </div>
        <button class="homebutton">결제 진행</button>
    </div>

</body>
</html>