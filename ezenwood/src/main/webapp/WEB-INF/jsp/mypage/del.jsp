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
    <title>Document</title>
</head>
<body>
    <div id="container">
        <div id="contents">
        <!-- ���� ���� -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; ���������� &gt; ȸ��Ż��</em>
                </div>
            </div>
            <!-- //location_wrap -->

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
<!-- //sub_menu_box -->
<script type="text/javascript">
    // �޴� ����
    $('.sub_menu_mypage li > a[href*="' + document.location.pathname + '"]').addClass('active');
</script>
                </div>
                <!-- //side_cont -->

<div class="content">
    <div class="mypage_cont">
        <form id="formHackOut" name="formHackOut" action="../mypage/my_page_ps.php" method="post" novalidate="novalidate">
            <input type="hidden" name="mode" value="hackOut">
            <input type="hidden" name="snsType" value="">
            <div class="hack_out">

                <div class="mypage_zone_tit">
                    <h2>ȸ��Ż��</h2>
                </div>

                <div class="mypage_unregister">
                  

                    <div class="unregister_info">
                        �����ж����� ������ϳװ����� Ż��ȳ�<br>
<br>
ȸ���Բ��� ȸ�� Ż�� ���ϽŴٴ� ���� ���θ��� ���񽺰� ���� �����ϰ� �����߳� ���ϴ�.<br>
�����ϼ̴� ���̳� �Ҹ������� �˷��ֽø� ���� �ݿ��ؼ� ������ �������� �ذ��� �帮���� ����ϰڽ��ϴ�.<br>
<br>
�� �ƿ﷯ ȸ�� Ż����� �Ʒ� ������ �����Ͻñ� �ٶ��ϴ�.<br>
1. ȸ�� Ż�� �� ȸ������ ������ ��ǰ ��ǰ �� A/S�� ���� ���ڻ�ŷ� ����� �Һ��� ��ȣ�� ���� ������ �ǰ��� <br>
   ������ ��ȣ��å������ ���� �˴ϴ�.<br>
2. Ż�� �� ȸ���Բ��� �����ϼ̴� ���ϸ����� ���� �˴ϴ�
                    </div>
                    <!-- //unregister_info -->

                   

            </div>
            <!-- //hack_out -->

            <div class="btn_center_box">
               <button type="submit" class="btn_claim_cancel btn_prev" 
               style="display: inline-block; 
                      min-width: 80px;
                      height: 42px;
                      padding: 0 10px 0 10px;
                      line-height: 40px;
                      color: #3e3d3c;
                      font-size: 14px;
                      border: 1px solid #cccccc;
                      background: #ffffff;
                      text-align: center;">
                   <em>��������</em>
               </button>
               <button type="submit" class="btn_claim_ok" 
               style="min-width: 100px;
                      height: 44px;
                      padding: 0 10px 0 10px;
                      color: #ffffff;
                      font-size: 14px;
                      font-weight: bold;
                      border: 1px solid #323437;
                      background: #323437;
                      text-align: center;
                      vertical-align: top;">
                   <em>Ż��</em>
               </button>
            </div>
            </div>
        </form>
    </div>
    <!-- //mypage_cont -->

</div>
<!-- //content -->

            </div>
            <!-- //sub_content -->
        </div>
        <!-- //���� �� contents -->
    </div>
</body>
</html>