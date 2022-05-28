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
    <title>qna2</title>
</head>
<body>
<div id="container">
   <div id="contents">
      <!-- ����  -->
      <div class="location_wrap">
         <div class="location_cont">
             <em>
                 <a href="#" class="local_home">Home</a>
                     &gt;����������&gt;�Խñ� ����&gt;Q&A
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
                   <h2 style="font-size: large">Q&A</h2>
                 </div>
             </div>
        
             
                 <!-- qna ����Ʈ-->
                 <div class="mypage_lately_info">
                    
                 </div>
                 <div class="mypage_table_type">
                    <table>
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <!--Ȯ��/���� -->
                        </colgroup>
                        <thead>
                            <tr>
                                <th>���ǳ�¥</th>
                                <th>ī�װ�</th>
                                <th>����</th>
                                <th>�ۼ���</th>
                                <th>���ǻ���</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                               <td>"${qna_date}"</td>                          
                               <td>"${qna_category}"</td>
                               <td><a href="#">
                               "${qna_title}"
                                   </a>
                               </td>
                               <td>"${qna_writer}"</td>
                               <td>"${qna_re_gb}"</td>        
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