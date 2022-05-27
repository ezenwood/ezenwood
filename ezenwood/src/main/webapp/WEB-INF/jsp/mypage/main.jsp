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
    <title>mypage_main</title>
</head>
<body>
<div id="container">
   <div id="contents">
      <!-- ����  -->
      <div class="location_wrap">
         <div class="location_cont">
             <em>
                 <a href="#" class="local_home">Home</a>
                     &gt;����������
             </em>
         </div>
      </div>
       <!-- locaion_wrap-->
       <div class="sub_content">
          <div class="side_cont">
              <div class="sub_menu_box">
                  <h2>����������</h2>
                  <ul class="sub_menu_mypage">
                     <li> 
                         ��������
                         <ul class="sub_depth1">
                             <li><a href="#">- �ֹ����/�����ȸ</a></li>
                             <li><a href="#">- ���/��ǰ/��ȯ ����</a></li>
                         </ul>
                     </li>
                      <li> 
                         �Խ��� ����
                         <ul class="sub_depth1">
                             <li><a href="#">- �������</a></li>
                             <li><a href="#">- 1:1����</a></li>
                             <li><a href="#">- Q&A</a></li>
                         </ul>
                     </li>
                     <li> 
                         ȸ������
                         <ul class="sub_depth1">
                             <li><a href="#">- ȸ������ ����/Ż��</a></li>
                         </ul>
                     </li>
                  </ul>
              </div>
              <!--sub_menu_box -->
              <script type="text/javascript">
                  //�޴�����
                  $('sub_menu_mypage li> a[href*="' + document.location.pathname+'"]').addClass('active');
              </script>
          </div> 
          <!-- side_cont-->
          
          <div class="content">
             <div class="mypage_main">
                <!--���������� ȸ�� ������� -->
                <div class="mypage_order_info">
                   <div class="mypage_zone_tit">
                      <h3> ���� ���� �ֹ� </h3>  
                   </div>
                   <div class="mypage_order_info_cont">
                      <ol>
                          <li class><b>�Աݴ��</b>
                              <strong style="color: black">0</strong>
                          </li>
                          <li class><b>�����Ϸ�</b>
                          <strong style="color: black">0</strong>
                          </li>
                          <li class><b>��ǰ�غ���</b>
                          <strong style="color: black">0</strong>
                          </li>
                          <li class><b>��� ��</b>
                          <strong style="color: black">0</strong>
                          </li>
                          <li class><b>��� �Ϸ�</b>
                          <strong style="color: black">0</strong>
                          </li>
                      </ol>
                       <div class="order_case_list">
                          <ul>
                              <li style="color: black">
                              <b>���</b>
                              <strong>0��</strong>
                              </li>
                          </ul>   
                       </div>
                   </div>
                   <!--mypage_orer_info_cont --> 
                </div>
                 <!-- mypage_order_info -->
             </div>
              
          </div>
          
       </div>
       
   </div>
    
</div>    
    
</body>
</html>