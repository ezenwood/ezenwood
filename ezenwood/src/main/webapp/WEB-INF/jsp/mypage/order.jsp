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
            &gt;�ֹ����/�����ȸ
       </em>
    </div>
</div>
<!--location_wrap -->

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
                    
                 </div>
             </div>
             
                     
             <div class="mypage_lately_info_cont">
               <div class="mypage_zone_tit">
                       <h2 style="font-size: large">�ֹ����/�����ȸ</h2>
                    </div>
                     <!-- mypage_zone_tit-->
                <span class="pick_list_num" style="text-align: center">
                   �ֹ����
                    <strong>0</strong>
                    ��
                </span>
                 <!-- �ֹ���ǰ ����Ʈ-->
                 <div class="mypage_table_type">
                    <table>
                        <colgroup>
                            <col style="width: 14%">
                            <!-- ��¥/�ֹ���ȣ -->
                            <col>
                            <!--��ǰ��/�ɼ� -->
                            <col style="width: 14%">
                            <!-- ��ǰ�ݾ�/����-->
                            <col style="width: 14%">
                            <!--�ֹ����� -->
                            <col style="width: 14%">
                            <!--Ȯ��/���� -->
                        </colgroup>
                        <thead>
                            <tr>
                                <th>��¥/�ֹ���ȣ</th>
                                <th>��ǰ��/�ɼ�</th>
                                <th>��ǰ�ݾ�/����</th>
                                <th>�ֹ�����</th>
                                <th>Ȯ��/����</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6">
                                    <p class="no_data">��ȸ������ �����ϴ�.</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                 </div>
                 <!--���� ���̾�-->
                 <div id="lyReason" class="layer_wrap reson_layer dn" data-remote="./mypage/cancel.jsp"> </div>
                 <div id="lyWrtirePop" class="layer_wrap board_write_layer dn"></div>
             </div>
              
          </div>
    </div>

    </div>
</div>

</body>
</html>