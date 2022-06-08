<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AdmingoodsModify</title>
    <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body>
<!-- 메뉴 시작 -->
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
<div id="page-wrapper" style="min-height: 703px;">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품수정</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">상품수정 페이지입니다. 빠짐없이 입력하셔야합니다</div>
			<div class="panel-body">
						
                        <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" path="goods_name" placeholder="위틀테이블" disabled>
                        </div>
                        <div class="form-group">                            
                             <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                        <tr>
                                            <label>카테고리</label>
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
                            <label>옵션창</label>
                             <input type="text" name="texts" class="form-control" path="goods_option" placeholder="위틀테이블" style="width:40%;">

                          </div>
                            <div class="form-group">
                       <label>수량</label><input type="text" class="form-control" path="goods_store_amount" placeholder="2" style="width:20%;">
                               </div>
                               
                        <div class="form-group">
                            <label>판매가</label>
                            <input type="text" class="form-control" path="goods_price" style="width:40%;"
                            placeholder="19,900">
                            <p class="help-block">판매가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>상품이미지 수정</label>
                            <br>
                             <img src="/ezenwood/resource/image/pet1.jpg" alt="Missing Image" >
                             <br>
                             <br>
                            <input type="file" name="file[0]" size="30" value="subimage_std"/>
                            <p class="help-block">메인상품 이미지 입니다 400x600 사이즈 권장합니다</p>
                        </div>
                        
                        <div class="form-group">
                            <label>디테일 이미지</label><!-- goods_contentimage -->
                            <input type="file" name="file[1]" size="30" value="image_std"/>
                            <p class="help-block">상품설명 이미지 입니다 가로 800px사이즈 권장합니다</p>
                        
                        </div>
                  
						<button type="submit" class="btn btn-success">상품수정</button>
						<button type="reset" class="btn btn-default">작성취소</button>					
			</div>
	</div>
</div>



</body>
</html>