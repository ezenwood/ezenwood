<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	
	var searchType2 = '${searchType}';
	var keyWord = '${keyWord}';
	
	var searchType = '${isSearch}';
	
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
	
	if(searchType2==''||searchType2==null){
		
	}else{
		
		var input_keyWord = document.createElement("input");
		var input_searchType2 = document.createElement("input");
		
		input_searchType2.setAttribute("type", "hidden");
		input_searchType2.setAttribute("name", "searchType");
		input_searchType2.setAttribute("value", searchType2);
		
		input_keyWord.setAttribute("type", "hidden");
		input_keyWord.setAttribute("name", "keyWord");
		input_keyWord.setAttribute("value", keyWord);
		
		
		
		form.appendChild(input_keyWord); 
		form.appendChild(input_searchType2); 
	}
	
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
       		
            <!-- ??????container-->
           	 
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">????????????</h1>
</div>
<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> ???????????????????????? ??????,??????,?????? ?????? ??????????????????.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/ezenwood/admin/goods?searchNum=1&amp;isSearch=6"><button type="button" class="btn btn-outline btn-default">??????</button></a>
							<select class="form-control" name="select" id="selectTag" onchange="window.open(value,'_self');">
								<option value="">--????????????--</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=1">TABLE</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=2">CHAIR</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=3">SOFA</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=4">BED</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=5">CHEST</option>
								<option value="/ezenwood/admin/goods?searchNum=1&amp;isSearch=6">??????</option>
							</select>						
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">??? ?????? ????????? : ${TOTAL_COUNT}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">??????</th>
										<th style="width: 8%; text-align:center;">????????????</th>
										<th style="width: 8%; text-align:center;">????????????</th>				
										<th style="width: 28%; text-align:center;">?????????</th>
										<th style="width: 10%; text-align:center;">??????</th>
										<th style="width: 6%; text-align:center;">??????</th>
										<th style="width: 10%; text-align:center;">????????????</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${goodsListMap }" var="goodsMap">
										<tr>
										<td>${goodsMap.GOODS_NUM }<br><a href="/ezenwood/admin/goods/${goodsMap.GOODS_NUM }">(????????????)</a></td>
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
									<form>
									<input type="hidden" name="searchNum" value="${searchNum }">
									<input type="hidden" name="isSearch" value="${isSearch }">
								
									<select class="form-control" name="searchType" id="searchNum">
										<option value="1">?????? ??????</option>
									</select>
										<input class="form-control" type="text" name="keyWord" id="isSearch">
										<span>
										<button type="submit" class="btn btn-default">??????</button>
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