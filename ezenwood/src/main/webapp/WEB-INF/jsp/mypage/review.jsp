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
    <title>review2</title>
</head>
<body>
<div id="container">
   <div id="contents">
      <!-- ����  -->
      <div class="location_wrap">
         <div class="location_cont">
             <em>
                 <a href="#" class="local_home">Home</a>
                     &gt;����������&gt;�Խ��� ����&gt;1:1����
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
             <div class="mypage_cont">
                 <div class="mypage_lately_info">
                    <h2 style="font-size: large">��ǰ�ı�</h2>
                 </div>
             </div>
        
             
                 <!-- review ����Ʈ-->
                 <div class="mypage_table_type">
                    <table>
                        <colgroup>
                            <col style="width: 6%">
                            <col>
                            <col style="width: 35%">
                            <col style="width: 12%">
                            <col style="width: 7%">
                            <col style="width: 15%">
                            <col style="width: 6%">
                            <!--Ȯ��/���� -->
                        </colgroup>
                        <thead>
                            <tr>
                                <th>��ȣ</th>
                                <th>�̹���</th>
                                <th>����</th>
                                <th>��¥</th>
                                <th>�ۼ���</th>
                                <th>��ȸ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-sno="${review_num}" data-auth="y" style="height: 10px">
                               <td>"${review_num}"</td>
                               <td><!-- �̹���-->
                                   <div class="board_img">
                                       <a href="jsvascript:gd_btn_view('goodsreview','${review_num}','y')">
                                           <img src="/mypage/board/upload/review/${image_std}" width="105" height="70" class="js_image_load">
                                       </a>
                                   </div>
                               </td>
                               <td class="board_tit"><!-- ����-->
                                   <a href="jsvascript:gd_btn_view('goodsreview','${review_num}','y'">
                                      <strong>${review_title}</strong>
                                   </a>
                               </td>
                               <td>${review_date}</td>
                               <td>${review_writer}</td> 
                               <td>0</td>   
                            </tr>
                        </tbody>
                    </table>
                 </div>
           </div>
       </div>
    </div>
    </div>
</body>
</html>