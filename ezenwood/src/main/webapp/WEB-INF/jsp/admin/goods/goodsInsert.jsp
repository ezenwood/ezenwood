<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AdmingoodsWrite</title>
    <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body>
<!-- �޴� ���� -->

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">��ǰ���</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">��ǰ��� �������Դϴ�. �������� �Է��ϼž��մϴ�</div>
			<div class="panel-body">
						
                        <div class="form-group">
                            <label>��ǰ��</label>
                            <input type="text" class="form-control" path="goods_name" placeholder="��ǰ���� �Է��ϼ���.">
                        </div>
                        <div class="form-group">                            
                             <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                        <tr>
                                            <label>ī�װ�</label>
                                            <br>
                                            <td><select option_product_no="#" option_select_element="option-select-finder" option_sort_no="1" option_type="T" item_listing_type="C" option_title="DESIGN" product_type="product_option" product_option_area="#" name="option1" id="product_option_id1" class="ProductOption0" option_style="select" required="true">
                                                  
                                                    <optgroup label="Category">
                                                        <option value="#"> TABLE </option>
                                                        <option value="#"> CHAIR</option>
                                                        <option value="#"> SOFA</option>
                                                        <option value="#"> BED</option>
                                                        <option value="#"> CHEST</option>
                                                    </optgroup>
                                                </select>
                                                <p class="value"></p>
                                            </td>
                                        </tr>
                                    </tbody>
                        </div>
                        
                        <div class="form-group">
                            <label>�ɼ�â</label>
                             <input type="text" name="texts" class="form-control" path="goods_option" placeholder="�ɼ��� �Է����ּ���" style="width:40%;">

                          </div>
                            <div class="form-group">
                       <label>����</label><input type="text" class="form-control" path="goods_amount" placeholder="������ �Է����ּ���" style="width:20%;">
                               </div>
                               
                        <div class="form-group">
                            <label>�ǸŰ�</label>
                            <input type="text" class="form-control" path="goods_price" style="width:40%;"
                            placeholder="�ǸŰ����� �Է����ּ���">
                            <p class="help-block">�ǸŰ��� �Է��ϼ���. 0������ �״�� �� ��� ū�ϳ��ϴ�</p>
                        </div>
                        <div class="form-group">
                            <label>��ǰ�̹���</label>
                            <input type="file" name="file[0]" size="30" value=""/>
                            <p class="help-block">���λ�ǰ �̹��� �Դϴ� 400x600 ������ �����մϴ�</p>
                        </div>
                        
                        <div class="form-group">
                            <label>������ �̹���</label><!-- goods_contentimage -->
                            <input type="file" name="file[1]" size="30" value=""/>
                            <p class="help-block">��ǰ���� �̹��� �Դϴ� ���� 800px������ �����մϴ�</p>
                        
                        </div>
                  
						<button type="submit" class="btn btn-success">��ǰ���</button>
						<button type="reset" class="btn btn-default">�ۼ����</button>					
			</div>
	</div>
</div>



</body>
</html>