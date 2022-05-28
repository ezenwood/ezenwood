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
    <title>update2</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

               /*  var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
            }
        }).open();
    }
</script>
    
</head>
<body>
   <div id="container">
        <div id="contents">
        <!-- ���� ���� -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; ���������� &gt; ����������</em>
                </div>
            </div>
            <!-- //location_wrap -->

            <div class="sub_content">

                <div class="side_cont">
                
<div class="sub_menu_box">
    <h2>����������</h2>
    <ul class="sub_menu_mypage">
					<li>�ֹ�����
            <ul class="sub_depth1">
                <li><a href="./mypage/order.jsp">- �ֹ����/�����ȸ</a></li>
                <li><a href="./mypage/cancel.jsp">- ��� ����</a></li>         
            </ul>
        </li> 	
        <li>�Խñ� ����
            <ul class="sub_depth1">
                <li><a href="./mypage/review.jsp">���� ����</a></li>
                <li><a href="./mypage/oto.jsp">- 1:1 ����</a></li>
                <li><a href="./mypage/qna.jsp">- Q&A</a></li>
            </ul>
        </li>
        <li>ȸ������
            <ul class="sub_depth1">
                <li><a href="./mypage/update.jsp">- ȸ������ ����/Ż��</a></li>
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
<link type="text/css" rel="stylesheet" href="/data/skin/front/mime/css/member/member.css?ts=1575598771">
    <div class="mypage_cont">

        <div class="my_page">
            <div class="mypage_zone_tit">
               <h2  style="font-size: large">ȸ������ ����</h2>
            </div>

            <div class="join_base_wrap">

                <div class="member_cont">
                    <form id="formJoin" name="formJoin" action="https://www.littlesistersfurniture.com/mypage/my_page_ps.php" method="post" novalidate="novalidate">
                        <input type="hidden" name="memNo" value="${member_num}">
                        <input type="hidden" name="memberFl" value="personal">
                        <input type="hidden" name="dupeinfo" value="">
                        <input type="hidden" name="rncheck" value="none">
                        <input type="hidden" name="mode" value="modify">
      
      <div class="location_wrap1">
                <div class="location_cont1">
                    <em><a href="#" class="local_home1" style="font-weight: bold">�����Է�</a>&gt;���ԿϷ�</em>
                </div>
            </div>
            <!-- //location_wrap -->
     <!-- ȸ������/���� �⺻���� -->
    <div class="base_info_box">
    <h3>�⺻����</h3>

    <div class="base_info_sec">
        <table border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col width="25%">
                <col width="75%">
            </colgroup>
            <tbody>
            <tr>
                <th><span class="important">*���̵�</span></th>
                <td>
                    <input type="hidden" name="memId" value="${member_id}">
                    ${member_id}
                </td>

            </tr>
            <div id="memberNewPw" class="member_pw_change" style="display: none"> 
            <tr>
                <th><span class="important">*���� ��й�ȣ</span></th>
                <td>
                     <div class="member_warning">
                        <input type="password" name="memCurrentPw" maxlength="30" placeholder="���� ��й�ȣ�� �Է��ϼ���."> 
                     </div>   
                </td>
            </tr>
              <tr>
                <th><span class="important">*�� ��й�ȣ</span></th>
                <td>
                        <div class="member_warning">
                            <input type="password" name="newPw" maxlength="30"
                             placeholder="���ο� ��й�ȣ�� �Է��ϼ���.">
                        </div>
                </td>
            </tr>  
               <tr>
                <th><span class="important">*�� ��й�ȣ Ȯ��</span></th>
                <td>
                       <div class="member_warning">
                            <input type="password" name="newPwCheck" maxlength="30" placeholder="���ο� ��й�ȣ�� �Է��ϼ���.">
                       </div>
                </td>
            </tr>  
            </div>        
                
            <tr>
                <th><span class="important">*�̸�</span></th>
                <td>
                       <div class="member_warning">
                            <input type="text" name="memNm" value="${member_name}" maxlength="30" placeholder="�̸��� �Է��ϼ���.">
                       </div>
                </td>
            </tr>
            <tr>
                <th><span>*�̸���</span></th>
                <td class="member_email">
                       <div class="member_warning">
                            <input type="text" name="email" id="email" value="" placeholder="�̸����� �Է��ϼ���.">
                       </div>
                </td>
            </tr>
            <tr>
                <th><span>*��ȭ��ȣ</span></th>
                <td>
                    <div class="member_warning">
                        <input type="text" id="phone" name="phone" maxlength="12" placeholder="- ���� �Է��ϼ���." data-pattern="gdNum" value="">
                    </div>
                </td>
            </tr>
            <tr>
                <th><span>*�ּ�</span></th>
                <td class="member_address">
                    <div class="address_postcode">
                        <input type="text" id="sample4_postcode"
                           placeholder="�����ȣ"> <input type="button"
                           onclick="sample4_execDaumPostcode()" value="�����ȣ ã��">
                        <input type="hidden" name="zipcode" value="">
                        </div>
                        
                       <div class="add">
                          <input type="text" id="sample4_roadAddress" placeholder="���θ� �ּ�">
                            <input type="text" id="sample4_jibunAddress" placeholder="���� �ּ�">  
                             <span id="guide" style="color: #999; display: none"></span>
                       </div>
                    <div class="add">
                            <input type="text" id="sample4_detailAddress" placeholder="�� �ּ�">
                            <input type="text" id="sample4_extraAddress" placeholder="�����׸�">
                        </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- //base_info_sec -->
</div>
<!-- //base_info_box --><!-- ȸ������/���� �⺻���� -->
                      
                        
                        <iframe id="ifrmHpauthdel" name="ifrmHpauth" style="width:500px;height:500px;display:none;"></iframe>
                        <div class="btn_center_box_del">
                            <button type="button" class="btn_member_del" style="display: inline-block; 
                                   min-width: 80px;
                                   height: 30px;
                                   margin: -20px 0 0 0;
                                   padding: 0px 10px 0 10px;
                                   line-height: 30px;
                                   color: #3e3d3c;
                                   font-size: 12px;
                                   font-weight: bold;
                                   border: 1px solid #cccccc;
                                   background: #ffffff;
                                   text-align: center;">Ż��</button>
                        </div>
                        <iframe id="ifrmHpauth" name="ifrmHpauth" style="width:500px;height:500px;display:none;"></iframe>
                        <div class="btn_center_box">
                            <button type="button" class="btn_member_cancel">���</button>
                            <button type="button" class="btn_comfirm js_btn_join" value="��������">��������</button>
                        </div>
                        <!-- //btn_center_box -->
                    </form>
                </div>
                <!-- //member_cont -->
            </div>
            <!-- //join_base_wrap -->

        </div>
        <!-- //my_page -->

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