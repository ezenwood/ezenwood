<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>orderdetail</title>
     <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript">
 window.onload = function(){
	var code ="${orderModel.order_trade_type}"
	for(var i=0; i<2; i++){
	    if(document.joinform.order_trade_type.options[i].value == code){
	        document.joinform.order_trade_type.options[i].selected = true;
	        break;
	    }
	}
	
	var code2 = "${orderModel.order_trade_payer}"
	for(var i=0; i<4; i++){
	    if(document.joinform.order_trade_payer.options[i].value == code2){
	        document.joinform.order_trade_payer.options[i].selected = true;
	        break;
	    }
	}
	var code3 = "${orderModel.order_status}"
		for(var i=0; i<6; i++){
		    if(document.joinform.order_status.options[i].value == code3){
		        document.joinform.order_status.options[i].selected = true;
		        break;
		    }
		}
} 
function validateForm() {
    var x = document.forms["joinform"]["goods_name"].value;
    if (x == null || x == "") {
        alert("��ǰ���� �Է��ؾ��մϴ�");
        return false;
    }
}
</script>
</head>
<body>
    <div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">�ֹ���</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading" >�ֹ��� �������Դϴ�.</div>
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
                            <input type="text" class="form-control" value="ȫ���" style="width:initial;" readonly/>                             
                        </div>
                        <div class="form-group">
                            <label>�޴���ȭ ��ȣ</label>
                            <input type="text" class="form-control" value="010-0000-0000" style="width:initial;" readonly/>                             
                        </div>		
                        <div class="form-group" style="border-bottom: 1px dotted #999;width:550px;">
                            <label>��û����</label>
                            <input type="text" class="form-control" value="��� ��û ����" style="width:initial;" readonly/>   
                                             <p/>
                        </div>
                               <div class="form-group">
                            <label>��� �ּ�</label>
                            <br>
                            <input type="text" 
                           value="10112" disabled> <br>
                           <input type="text" placeholder="����Ư���� ������ �Ｚ��" disabled >
                           <input type="text" placeholder="����Ư���� ������ �����"  disabled>
                           <span id="guide" style="color: #999; display: none"></span><br> <input
                           type="text" placeholder="����" disabled >
                           <input type="text" placeholder="�����׸�" disabled > 
                    </div>
                                    
                    					
						<div class="form-group" style="border-top: 1px dotted #999;width:550px;">
                          <br>
                           <label>��������</label>
                           <br>
                            <label>��ǰ�հ� �ݾ�</label>
                            <input type="text" class="form-control" value="2,222,999" style="width:initial;" readonly/>                             
                        </div>
                          <div class="form-group">
                            <label>��ۻ���</label>
                            <input type="text" class="form-control" value="������� ��" style="width:initial;" readonly/>   
                        
						
						<button type="submit" class="btn btn-success">����</button>
						<button type="reset" class="btn btn-default">����</button>					
				</form:form>
                   
                    </div>
	</div>
</div>
</body>
</html>