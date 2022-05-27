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
<!-- 메뉴 시작 -->

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품등록</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">상품등록 페이지입니다. 빠짐없이 입력하셔야합니다</div>
			<div class="panel-body">
						
                        <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" path="goods_name" placeholder="상품명을 입력하세요.">
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
                             <input type="text" name="texts" class="form-control" path="goods_option" placeholder="옵션을 입력해주세요" style="width:40%;">

                          </div>
                            <div class="form-group">
                       <label>수량</label><input type="text" class="form-control" path="goods_amount" placeholder="수량을 입력해주세요" style="width:20%;">
                               </div>
                               
                        <div class="form-group">
                            <label>판매가</label>
                            <input type="text" class="form-control" path="goods_price" style="width:40%;"
                            placeholder="판매가격을 입력해주세요">
                            <p class="help-block">판매가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>상품이미지</label>
                            <input type="file" name="file[0]" size="30" value=""/>
                            <p class="help-block">메인상품 이미지 입니다 400x600 사이즈 권장합니다</p>
                        </div>
                        
                        <div class="form-group">
                            <label>디테일 이미지</label><!-- goods_contentimage -->
                            <input type="file" name="file[1]" size="30" value=""/>
                            <p class="help-block">상품설명 이미지 입니다 가로 800px사이즈 권장합니다</p>
                        
                        </div>
                  
						<button type="submit" class="btn btn-success">상품등록</button>
						<button type="reset" class="btn btn-default">작성취소</button>					
			</div>
	</div>
</div>



</body>
</html>