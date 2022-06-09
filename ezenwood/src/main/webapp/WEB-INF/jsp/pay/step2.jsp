<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/order.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        $(document).ready(function(){
            $("#same").click(function(){
                
                $("#sample4_postcode").get(0).value="${memberMap.MEMBER_ZIP}";
                $("#sample4_roadAddress").get(0).value="${memberMap.MEMBER_ADD1}";
                $("#sample4_detailAddress").get(0).value="${memberMap.MEMBER_ADD2}";
                $("#sample4_jibunAddress").get(0).value="";
                $("#sample4_extraAddress").get(0).value="${memberMap.MEMBER_ADD3}";
                $("#dname").get(0).value="${memberMap.MEMBER_NAME}";
                $("#dphone").get(0).value="${memberMap.MEMBER_PHONE}";

            });

            $("#nsame").click(function(){
                
                $("#sample4_postcode").get(0).value="";
                $("#sample4_roadAddress").get(0).value="";
                $("#sample4_detailAddress").get(0).value="";
                $("#sample4_jibunAddress").get(0).value="";
                $("#sample4_extraAddress").get(0).value="";
                $("#dname").get(0).value="";
                $("#dphone").get(0).value="";
            });

        });
    </script>

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

               
            }
        }).open();
    }
</script>
   
    <title>결제 페이지</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
        }
       
        .warpper{
            width: 1000px;
           margin: 0 auto;
          
       }
       .order_form_title{
           margin: 20px 0px;
           font-size: 24px;
           font-weight: 500;
       }
       table, td, th{
          
           border: 1px solid #ccc;
           border-collapse: collapse;
           text-align: left;
          
       }
       td{
        padding: 9px 10px 10px 10px;
       }
       input:not([type=radio]){
        border: 1px solid #ccc;
        height: 30px;
        width: 330px;
        padding: 5px 15px;
        margin: 1px 15px;
        border-radius: 3px;
       }
       
       th{
        padding: 9px 10px 10px 10px;
        background: #f7f7f7;
        border-top: 1px solid #dbdbdb;
        border-bottom: 1px solid #dbdbdb;
        background: #f7f7f7;
            font-size: 12px;
        line-height: 1.5;
            font-family: Lato,"Malgun Gothic","맑은 고딕",AppleGothic,Dotum,"돋움",sans-serif;
       }
       table{
           width: 1000px;
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
       form{
           margin: 0 auto;
        }
        .paybutton{
        
        width: 200px;
        height: 50px;
        padding: 0 15px 0 15px;
        color: #ffffff;
        border: 1px solid #323437;
        background: #323437;
        text-align: center;
        line-height: 28px;
        margin: 50px 425px;
       }
       .postbox{
        margin: 0px 15px;
        padding: 0 15px 0 15px;
        color: #323437;
        border: 1px solid #323437;
        background: #ffffff;
        text-align: center;
        
        
       }
       

    </style>
</head>
<body>
<%@include file ="/include/header.jsp" %>
   <div id="container">
        <div id="contents">
            <div class="location_wrap">
                <div class="location_cont">
                    <em>
                        <a href="#" class="local_home">HOME</a>&nbsp;> 주문서 작성 / 결제
                    </em>
                </div>
            </div>
            <!--//location_wrap-->
            <div class="sub_content">
                <div class="content_box">
                    
                        <div class="order_wrap">
                            <div class="order_tit">
                                <h2>주문서작성/결제</h2>
                                <ol>
                                    <li><span>01</span> 장바구니 >&nbsp;</li>
                                    <li class="page_on"><span>02</span> 주문서작성/결제 >&nbsp;</li>
                                    <li><span>03</span> 주문완료</li>
                                </ol>
                            </div>
                            <!--//order_tit-->
   <div class="warpper">



    <div class="order_form_title">주문자 정보</div>
    <form action="/ezenwood/pay/step3" method="post">
        <table>
            <colgroup>
            <col width="15%">
            <col>
            </colgroup>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">주문하시는 분</th>
                <td><input type="text" name="MEMBER_NAME" placeholder="이름을 입력해주세요" value="${memberMap.MEMBER_NAME }" readonly="readonly" ></td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">휴대폰 번호</th>
                <td><input type="text" name="MEMBER_PHONE" placeholder="휴대폰 번호를 입력해주세요 ex)01012345678"  value="${memberMap.MEMBER_PHONE }" readonly="readonly" ></td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">이메일</th>
                <td><input type="text" name="MEMBER_EMAIL" placeholder="이메일 주소를 입력해주세요 ex)hong@naver.com" value="${memberMap.MEMBER_EMAIL }"  readonly="readonly" ></td>
            </tr>
        </table>
        <div class="order_form_title">배송 정보</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
            </colgroup>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">배송지 확인</th>
                <td> <input type="radio" id="same" name="deli" value="a" > 주문자 정보와 동일 &nbsp;&nbsp; <input type="radio" id="nsame" name="deli" value="a"> 직접 입력</td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">받으실 분</th>
                <td><input type="text" id="dname" name="ORDER_RECEIVER" placeholder="이름을 입력해주세요"></td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">받으실 곳</th>
                <td><input type="text" name="ORDER_RZIPCODE" id="sample4_postcode" placeholder="우편번호"> <button type="button" value="우편번호 검색" onclick="sample4_execDaumPostcode()" class="postbox">우편번호 검색</button><br>
                    <input type="text" name="ORDER_RADD1" id="sample4_roadAddress" placeholder="도로명주소"><input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
                    <input type="text" name="ORDER_RADD2"  id="sample4_detailAddress" placeholder="상세주소"><input type="text" id="sample4_extraAddress" name="ORDER_RADD3" placeholder="참고사항"></td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">휴대폰 번호</th>
                <td><input type="text" name="ORDER_PHONE" id="dphone" placeholder="휴대폰 번호를 입력해주세요 ex)01012345678"></td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">배송 요청사항</th>
                <td><input type="text" name="ORDER_DMEMO" placeholder="배송 요청사항"></td>
            </tr>
        </table>
        <div class="order_form_title">결제 정보</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
            </colgroup>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">상품합계 금액</th>
                <td>${payInfo.priceSum }원</td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">배송비</th>
                <td>${payInfo.priceDSum }원</td>
            </tr>
            <tr>
                <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">최종합계 금액</th>
                <td>${payInfo.priceSum + payInfo.priceDSum }원</td>
            </tr>
        </table>
        <div class="order_form_title">결제 수단</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
        </colgroup>
        <tr>
            <th style="padding: 15px 10px 14px 30px; border-top: none 0; background: #f7f7f7; text-align: left; border-top: 1px solid #dbdbdb;">일반 결제</th>
            <td>ㅇㅇ</td>
        </tr>
        
        </table>
        <div class="fin">
            <div class="price">
                <p>총 <b>${payInfo.goodsQuantity }</b>개 상품 금액</p>
                <p>${payInfo.priceSum }원</p>
            </div>
            <div class="plus">
                +
            </div>
            <div class="deprice">
                <p>배송비</p>
                <p>${payInfo.priceDSum }원</p>
            </div>
            <div class="equal">
                =
            </div>
            <div class="totalprice">
                <p>합계</p>
                <p>${payInfo.priceSum + payInfo.priceDSum }원</p>
            </div>
        </div>
        <button class="paybutton" style=" vertical-align: middle; display: inline-block; width: 200px; height: 61px; line-height: 59px; color: #fff; font-size: 20px; border: 1px solid #323437; background: #323437; text-align: center">결제하기</button>
</form>
</div>
       </div>
                    
                </div>
            </div>
       </div></div>
       <%@include file ="/include/footer.jsp" %>
</body>
</html>