<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ordermodify</title>
     <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
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
    <div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">�ֹ�����</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading" >�ֹ����� �������Դϴ�.</div>
			<div class="panel-body">
				<form:form commandName="orderModel" action="orderModify.dog" enctype="multipart/form-data" method="post"name="joinform" onsubmit="return validateForm()">	
				<input type="hidden" name="order_num" value="${orderModel.order_num}">
                    <div class="form-group">
                            <label>��ǰ��</label>
                            <input type="text" class="form-control" value="��Ʋ���̺�" style="width:initial;" readonly />                             
                        </div>
						<div class="form-group">
                            <label>�ֹ���ȣ</label>
                            <input type="text" class="form-control" value="1234-1" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>�����ȣ</label>
                            <input type="text" class="form-control" value="1123454" style="width:initial;" readonly/>                             
                        </div>
                        <div style="border:1px;" class="form-group">
                             <label>�ɼ�â</label>
                            <input type="text" class="form-control" value="�⺻���̺�" style="width:initial;" readonly/>                            
                        </div>	
                        <p>
                        <div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>�ֹ�������</label>
                           <br>
                            <label>�̸�</label>
                            <input type="text" class="form-control" value="ȫ���" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>�޴���ȭ ��ȣ</label>
                            <input type="text" class="form-control" value="010-0000-0000" style="width:initial;" readonly/>                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>�̸���</label>
                            <input type="text" class="form-control" value="ezen.naver.com" style="width:initial;" readonly/>   
                                             <p/>
                        </div>
                          <div class="form-group">
                           <label>��� ����</label>
                           <br>
                            <label>�̸�</label>
                            <input type="text" class="form-control" value="ȫ���" style="width:initial;"/>                             
                        </div>
                        <div class="form-group">
                            <label>�޴���ȭ ��ȣ</label>
                            <input type="text" class="form-control" value="010-0000-0000" style="width:initial;" />                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>��û����</label>
                            <input type="text" class="form-control" value="��� ��û ����" style="width:initial;" />   
                                             <p/>
                        </div>
                              <tr>
                        <label>�ּ�</label><br>
                        <td><input type="text" id="sample4_postcode"
                           placeholder="�����ȣ"> <input type="button"
                           onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
                           <input type="text" id="sample4_roadAddress" placeholder="���θ��ּ�">
                           <input type="text" id="sample4_jibunAddress" placeholder="�����ּ�">
                           <span id="guide" style="color: #999; display: none"></span><br> <input
                           type="text" id="sample4_detailAddress" placeholder="���ּ�">
                           <input type="text" id="sample4_extraAddress" placeholder="�����׸�">
                        </td>
                     </tr>
                    					
						<div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>��������</label>
                           <br>
                            <label>��ǰ�հ� �ݾ�</label>
                            <input type="text" class="form-control" value="2,222,999" style="width:initial;" readonly/>                             
                        </div>
                        
                         <div class="form-group">                            
                             <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                        <tr>
                                            <label>��ۻ���</label>
                                            <br>
                                            <td><select option_product_no="#" option_select_element="option-select-finder" option_sort_no="1" option_type="T" item_listing_type="C" option_title="DESIGN" product_type="product_option" product_option_area="#" name="option1" id="product_option_id1" class="ProductOption0" option_style="select" required="true">
                                                  
                                                    <optgroup label="Category">
                                                        <option value="#"> ������� �� </option>
                                                        <option value="#"> ���� �Ϸ�</option>
                                                        <option value="#"> ����غ� ��</option>
                                                        <option value="#"> ��� ��</option>
                                                        <option value="#"> ��� �Ϸ�</option>
                                                        <option value="#"> �ֹ� ���</option>
                                                    </optgroup>
                                                </select>
                                                <p class="value"></p>
                                            </td>
                                        </tr>
                                    </tbody>
                        </div>
						
						<button type="submit" class="btn btn-success">����</button>
						<button type="reset" class="btn btn-default">���</button>					
				</form:form>
                   
                    </div>
	</div>
</div>
</body>
</html>