<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AdmingoodsInsert</title>
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
	<h1 class="page-header">상품등록</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">상품등록 페이지입니다. 빠짐없이 입력하셔야합니다</div>
			<div class="panel-body">
						<form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" name="GOODS_TITLE" placeholder="상품명을 입력하세요.">
                        </div>
                        <div class="form-group">                            
                             <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                        <tr>
                                            <label>카테고리</label>
                                            <br>
                                            <td><select name="GOODS_CATEGORY" required="required">
                                                  
                                                    <optgroup label="Category">
                                                        <option value="table"> TABLE </option>
                                                        <option value="chair"> CHAIR</option>
                                                        <option value="sofa"> SOFA</option>
                                                        <option value="bed"> BED</option>
                                                        <option value="chest"> CHEST</option>
                                                    </optgroup>
                                                </select>
                                                <p class="value"></p>
                                            </td>
                                        </tr>
                                    </tbody>
                        </div>
                        
                        
                            <div class="form-group">
                       <label>수량</label><input type="text" class="form-control" name="GOODS_STORE_AMOUNT" placeholder="수량을 입력해주세요" style="width:20%;">
                               </div>
                               <div class="form-group">
							<label>상품 설명1</label> <br><textarea name="GOODS_CONTENT1" rows="10" cols="50" style="resize: none;" >${goodsMap.GOODS_CONTENT1}</textarea>

						</div>
						<div class="form-group">
							<label>상품 설명2</label> <br><textarea name="GOODS_CONTENT2" rows="10" cols="50" style="resize: none;" >${goodsMap.GOODS_CONTENT2}</textarea>

						</div>
                               
                        <div class="form-group">
                            <label>판매가</label>
                            <input type="text" class="form-control" name="GOODS_PRICE" style="width:40%;"
                            placeholder="판매가격을 입력해주세요">
                            <p class="help-block">판매가격 입력하세요. 0원으로 그대로 갈 경우 큰일납니다</p>
                        </div>
                        <div class="form-group">
                            <label>배송비</label>
                            <input type="text" class="form-control" name="GOODS_DCOST" style="width:40%;"
                            placeholder="배송비를 입력해주세요">
                           
                        </div>
                        <div class="form-group">
                            <label>썸네일 이미지</label>
                            <input type="file" name="subImage" size="30" />
                            <p class="help-block">썸네일 이미지 입니다 400x600 사이즈 권장합니다</p>
                        </div>
                        
                        <div class="form-group">
                            <label>메인 이미지</label><!-- goods_contentimage -->
                            <input type="file" name="mainImage" size="30" />
                            <p class="help-block">메인 이미지 입니다 가로 800px사이즈 권장합니다</p>
                        
                        </div>
                  
						<button type="submit" class="btn btn-success">상품등록</button>
						<button type="button" onclick="history.back();" class="btn btn-default">작성취소</button>	
						</form>				
			</div>
	</div>
</div>



</body>
</html>