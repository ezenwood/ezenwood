<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>

<script type="text/javascript">

var ddd = document.location.href;

var idx = ddd.lastIndexOf("=");

var sss = ddd.substring(idx+1);




function fn_search(pageNo) {
	
	var searchType ='6';
	
	if(sss!=null){
		if(sss.length<3)
		searchType=sss;
		}
	
	
	
	var form = document.createElement("form");
	
	form.setAttribute("method","get");
	
	form.setAttribute("action","/ezenwood/admin/goods");
	
	
	var input_pageNum = document.createElement("input");
	var input_searchType = document.createElement("input");
	
	input_pageNum.setAttribute("type", "hidden");
	input_pageNum.setAttribute("name", "searchNum");
	input_pageNum.setAttribute("value", pageNo);
	
	input_searchType.setAttribute("type", "hidden");
	input_searchType.setAttribute("name", "isSearch");
	input_searchType.setAttribute("value", searchType);
	
	form.appendChild(input_pageNum); 
	form.appendChild(input_searchType); 
	
	document.body.appendChild(form);
	
	form.submit();

	
}
</script>
    <meta charset="UTF-8">
    <title>AdminGoodsList</title>
    <link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
        <div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">
       		
            <!-- 메인container-->
           	 
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품목록</h1>
</div>
<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> 상품목록페이지는 검색,수정,삭제 기능 페이지입니다.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/pet/admin/goodsadminList.dog?searchNum=0&amp;isSearch="><button type="button" class="btn btn-outline btn-default">전체</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value="">--카테고리--</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=1">TABLE</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=2">CHAIR</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=3">SOFA</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=4">BED</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=5">CHEST</option>
							</select>						
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품 등록수 : ${TOTAL_COUNT}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">번호</th>
										<th style="width: 8%; text-align:center;">상품사진</th>
										<th style="width: 8%; text-align:center;">카테고리</th>				
										<th style="width: 28%; text-align:center;">상품명</th>
										<th style="width: 10%; text-align:center;">가격</th>
										<th style="width: 6%; text-align:center;">수량</th>
										<th style="width: 10%; text-align:center;">등록일자</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${goodsListMap }" var="goodsMap">
										<tr>
										<td>${goodsMap.GOODS_NUM }<br><a href="/ezenwood/admin/goods/${goodsMap.GOODS_NUM }">(상품수정)</a></td>
                                        <td> 
                                        <a href="/ezenwood/goods?idx=${goodsMap.GOODS_NUM }"><img src="/ezenwood/resource/image/${goodsMap.subImage }" alt="Missing Image"></a>  
                                        
                                        </td>
                                        <td>
                                        ${goodsMap.GOODS_CATEGORY }
                                        </td>
                                        <td>
                                        <a href="/ezenwood/goods?idx=${goodsMap.GOODS_NUM }">
                                        ${goodsMap.GOODS_TITLE }</a>
                                        </td>
                                        <td>
                                        ${goodsMap.GOODS_PRICE }
                                        </td>
                                        <td>
                                        ${goodsMap.GOODS_STORE_AMOUNT }
                                        </td>
                                        <td>
                                      <fmt:formatDate value="${goodsMap.GOODS_DATE }" type="date" dateStyle="medium"  />
                                        </td>
									  </tr>
									  
										</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">상품 제목</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch">
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
					<div class="content-center" style="text-align: center;" >
					<c:if test="${not empty paginationInfo}">
										<ui:pagination paginationInfo="${paginationInfo}" type="text"
											jsFunction="fn_search" />
									</c:if>
                    </div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
    </div>
            </div>
            </div>
    </div>
</body>
</html>