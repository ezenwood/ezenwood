<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="mypage.css">
    <link rel="stylesheet" href="layout.css">
    <link rel="stylesheet" href="member.css">
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="board.css">
    <link rel="stylesheet" href="common.css">
    <title>order2</title>
</head>
<body>
  <div id="container">
    <div id="contents">
        <div class="location_wrap">
    <div class="location_cont">
       <em>
           <a href="#" class="local_home">HOME</a>
            &gt;주문목록/배송조회
       </em>
    </div>
</div>
<!--location_wrap -->

 <div class="sub_content">
          <div class="side_cont">
              <div class="sub_menu_box">
                  <h2>마이페이지</h2>
                  <ul class="sub_menu_mypage">
                     <li> 
                         쇼핑정보
                         <ul class="sub_depth1">
                             <li><a href="#">- 주문목록/배송조회</a></li>
                             <li><a href="#">- 취소/반품/교환 내역</a></li>
                         </ul>
                     </li>
                      <li> 
                         게시판 관리
                         <ul class="sub_depth1">
                             <li><a href="#">- 리뷰관리</a></li>
                             <li><a href="#">- 1:1문의</a></li>
                             <li><a href="#">- Q&A</a></li>
                         </ul>
                     </li>
                     <li> 
                         회원정보
                         <ul class="sub_depth1">
                             <li><a href="#">- 회원정보 변경/탈퇴</a></li>
                         </ul>
                     </li>
                  </ul>
              </div>
              <!--sub_menu_box -->
              <script type="text/javascript">
                  //메뉴선택
                  $('sub_menu_mypage li> a[href*="' + document.location.pathname+'"]').addClass('active');
              </script>
          </div> 
          <!-- side_cont-->
          <div class="content">
             <div class="mypage_cont">
                 <div class="mypage_lately_info">
                    
                 </div>
             </div>
             
                     
             <div class="mypage_lately_info_cont">
               <div class="mypage_zone_tit">
                       <h2 style="font-size: large">주문목록/배송조회</h2>
                    </div>
                     <!-- mypage_zone_tit-->
                <span class="pick_list_num" style="text-align: center">
                   주문목록
                    <strong>0</strong>
                    건
                </span>
                 <!-- 주문상품 리스트-->
                 <div class="mypage_table_type">
                    <table>
                        <colgroup>
                            <col style="width: 14%">
                            <!-- 날짜/주문번호 -->
                            <col>
                            <!--상품명/옵션 -->
                            <col style="width: 14%">
                            <!-- 상품금액/수량-->
                            <col style="width: 14%">
                            <!--주문상태 -->
                            <col style="width: 14%">
                            <!--확인/리뷰 -->
                        </colgroup>
                        <thead>
                            <tr>
                                <th>날짜/주문번호</th>
                                <th>상품명/옵션</th>
                                <th>상품금액/수량</th>
                                <th>주문상태</th>
                                <th>확인/리뷰</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6">
                                    <p class="no_data">조회내역이 없습니다.</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                 </div>
                 <!--사유 레이어-->
                 <div id="lyReason" class="layer_wrap reson_layer dn" data-remote="./mypage/cancel.jsp"> </div>
                 <div id="lyWrtirePop" class="layer_wrap board_write_layer dn"></div>
             </div>
              
          </div>
    </div>

    </div>
</div>

</body>
</html>