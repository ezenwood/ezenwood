<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#same").click(function(){
                
                $("#postcode").get(0).value="ddd";
                $("#roadAddress").get(0).value="ddd";
                $("#detailAddress").get(0).value="ddd";
                $("#jibunAddress").get(0).value="ddd";
                $("#extraAddress").get(0).value="ddd";
                $("#dname").get(0).value="dddd";
                $("#dphone").get(0).value="ddd";

            });

            $("#nsame").click(function(){
                
                $("#postcode").get(0).value="";
                $("#roadAddress").get(0).value="";
                $("#detailAddress").get(0).value="";
                $("#jibunAddress").get(0).value="";
                $("#extraAddress").get(0).value="";
                $("#dname").get(0).value="";
                $("#dphone").get(0).value="";
            });

        });
    </script>
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
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
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
   <div class="warpper">
<h1>결제</h1><hr>

<form>
    <div class="order_form_title">주문자 정보</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
            </colgroup>
            <tr>
                <th>주문하시는 분</th>
                <td><input type="text" placeholder="이름을 입력해주세요"></td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td><input type="text" placeholder="휴대폰 번호를 입력해주세요 ex)01012345678"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" placeholder="이메일 주소를 입력해주세요 ex)hong@naver.com"></td>
            </tr>
        </table>
        <div class="order_form_title">배송 정보</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
            </colgroup>
            <tr>
                <th>배송지 확인</th>
                <td> <input type="radio" id="same" name="deli" value="a" > 주문자 정보와 동일 <input type="radio" id="nsame" name="deli" value="a"> 직접 입력</td>
            </tr>
            <tr>
                <th>받으실 분</th>
                <td><input type="text" id="dname" placeholder="이름을 입력해주세요"></td>
            </tr>
            <tr>
                <th>받으실 곳</th>
                <td><input type="text" id="postcode" placeholder="우편번호"> <button type="button" value="우편번호 검색" onclick="sample4_execDaumPostcode()" class="postbox">우편번호 검색</button><br>
                    <input type="text" id="roadAddress" placeholder="도로명주소"><input type="text" id="jibunAddress" placeholder="지번주소"><br>
                    <input type="text" id="detailAddress" placeholder="상세주소"><input type="text" id="extraAddress" placeholder="참고사항"></td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td><input type="text" id="dphone" placeholder="휴대폰 번호를 입력해주세요 ex)01012345678"></td>
            </tr>
            <tr>
                <th>배송 요청사항</th>
                <td><input type="text" placeholder="배송 요청사항"></td>
            </tr>
        </table>
        <div class="order_form_title">결제 정보</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
            </colgroup>
            <tr>
                <th>상품합계 금액</th>
                <td>222,900원</td>
            </tr>
            <tr>
                <th>배송비</th>
                <td>0원</td>
            </tr>
            <tr>
                <th>최종합계 금액</th>
                <td>222,900원</td>
            </tr>
        </table>
        <div class="order_form_title">결제 수단</div>
        <table>
            <colgroup>
            <col width="15%">
            <col>
        </colgroup>
        <tr>
            <th>일반 결제</th>
            <td>ㅇㅇ</td>
        </tr>
        
        </table>
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
        <button class="paybutton">결제하기</button>
</form>
</div>
</body>
</html>