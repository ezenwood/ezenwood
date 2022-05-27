<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
       .btn_order_box{overflow:hidden; padding:30px 0 0 0; text-align:right;}
.btn_order_box .btn_left_box{float:left;}
.btn_order_box .btn_right_box{float:right;}

.btn_order_choice_buy {
    min-width: 190px;
    height: 55px;
    padding: 0 20px 0 20px;
    color: #3e3d3c;
    font-weight: bold;
    font-size: 14px;
    border: 1px solid #cccccc;
    background: #fff;
    cursor: pointer;
}
.btn_order_whole_buy {
    min-width: 190px;
    height: 55px;
    padding: 0 20px 0 20px;
    color: #ffffff;
    font-size: 14px;
    border: 1px solid #323437;
    background: #323437;
    cursor: pointer;
    font-weight: bold;
}
.btn_order_choice_del {
    display: inline-block;
    min-width: 120px;
    height: 30px;
    padding: 0 15px 0 15px;
    color: #626262;
    border: 1px solid #a3a3a3;
    text-align: center;
    line-height: 28px;
}
    </style>
</head>

<body>
 <div class="content-wrapper">
        <h1>장바구니</h1>
        
        <div class="order_table_type">
            <form>
            <table>
                <colgroup>
                    <col style="width:3%">  <!-- 체크박스 -->
                    <col>					<!-- 상품이미지 -->
                    <col style="width: 10%;">
                    <col style="width:5%">  <!-- 수량 -->
                    <col style="width:10%"> <!-- 상품금액 -->
                    
                    <col style="width:10%"> <!-- 배송비 -->
                    <col style="width:10%"> <!-- 합계금액 -->
                </colgroup>
                <thead>
                    <tr>
                        <th><input type="checkbox" id="allcheck"></th>
                    <th colspan="2">상품/옵션정보</th>
                    <th>수량</th>
                    
                    <th>상품금액</th>
                    <th>배송비</th>
                    <th>합계금액</th>
                </tr>
                </thead>
                <tbody>
                    <tr><td><input type="checkbox"></td>
                        <td style="height: 600px;">이미지@@</td>
                        
                        <td><div class="상품/옵션정보">
                            <div class="상품정보"><em>상품이름</em></div><div class="옵션정보"><span class="text_type_cont">Size : 2000</span></div>
                        </div></td>
                        <td class="td_order_amount">수량@@</td>
                        <td class="td_priceP">15000</td>
                        <td class="td_priceD">10000</td>
                        <td class="td_priceT">25000</td></tr>
                </tbody>
            </table>
        </form>
        
        </div>
        <div class="fin">
            <div class="price">
                <p>총 <span id="productnumber">0</span>개 상품 금액</p>
                <p class="priceP"></p>
            </div>
            <div class="plus">
                +
            </div>
            <div class="deprice">
                <p>배송비</p>
                <p class="priceD"></p>
            </div>
            <div class="equal">
                =
            </div>
            <div class="totalprice">
                <p>합계</p>
                <p class="priceT"></p>
            </div>
        </div>
        <div class="btn_order_box">
            <span class="btn_left_box">
                <button type="button" class="btn_order_choice_del" onclick="gd_cart_process('cartDelete');">선택 상품 삭제</button>
                
            </span>
            <span class="btn_right_box">
                <button type="button" class="btn_order_choice_buy" onclick="gd_cart_process('orderSelect');">선택 상품 주문</button>
                <button type="button" class="btn_order_whole_buy" onclick="gd_order_all();">전체 상품 주문</button>
            </span>
        </div>
    </div>

</body>
</html>