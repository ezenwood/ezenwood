<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/ezenwood/css/mypage.css">
    <link rel="stylesheet" href="/ezenwood/css/layout.css">
    <link rel="stylesheet" href="/ezenwood/css/member.css">
    <link rel="stylesheet" href="/ezenwood/css/reset.css">
    <link rel="stylesheet" href="/ezenwood/css/board.css">
    <link rel="stylesheet" href="/ezenwood/css/common.css">
    <title>oto2</title>
</head>
<body>
<%@include file ="/include/header.jsp" %>
<div id="container">
   <div id="contents">
      <!-- 본문  -->
      <div class="location_wrap">
         <div class="location_cont">
             <em>
                 <a href="#" class="local_home">Home</a>
                     &gt;마이페이지&gt;게시판 관리&gt;1:1문의
             </em>
         </div>
      </div>
       <!-- locaion_wrap-->
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
                    <h2 style="font-size: large">1:1 문의</h2>
                 </div>
             </div>
        
             
                 <!-- oto 리스트-->
                 <div class="mypage_table_type">
                    <table>
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <!--확인/리뷰 -->
                        </colgroup>
                        <thead>
                            <tr>
                                <th>문의날짜</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>문의상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                               <td>"${oto_date}"</td>                          
                               <td><a href="#">
                               "${onetoone_title}"
                                   </a>
                               </td>
                               <td>"${onetoone_writer}"</td>
                               <td>"${onetoone_re_gb}"</td>    
                            </tr>
                        </tbody>
                    </table>
                 </div>
           </div>
       </div>
    </div>
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>
</html>