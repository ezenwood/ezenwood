<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <script type="text/javascript">
    var ddd = document.location.href;
    var idx = ddd.lastIndexOf("&");
    
    var sss = ddd.substring(0,idx+1);
    
    function fn_search(pageNo){
    	location.href = sss+"p="+pageNo;
    }    
    </script>
    <meta charset="UTF-8">
    <title>이젠 우드 - 관리자 페이지</title>
    <link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
        <div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">
       		
            <!-- 메인container-->
           	 
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">회원목록</h1>
</div>
<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> 회원목록페이지는 검색,수정,삭제가 가능한 페이지입니다.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite" style="text-align:right;">
							총 회원수 : ${totalCount}</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 6%; text-align:center;">번호</th>
										<th style="width: 8%; text-align:center;">ID</th>
										<th style="width: 8%; text-align:center;">이름</th>				
										<th style="width: 15%; text-align:center;">전화번호</th>
										<th style="width: 15%; text-align:center;">이메일</th>
										<th style="width: 10%; text-align:center;">주소</th>
										<th style="width: 10%; text-align:center;">가입일자</th>
										<th style="width: 10%; text-align:center;">탈퇴여부</th>
									</tr>
								</thead>
								<tbody>
								
								<c:choose>

                                                <c:when test="${fn:length(adminMemberListMap) > 0}">
                                                    <c:forEach items="${adminMemberListMap}" var="row">
                                                      <tr>
                                                        	<td>${row.MEMBER_NUM }</td>
                                                        	<td>
                                                        	<a href="/ezenwood/admin/memberUpdate/${row.MEMBER_ID}">${row.MEMBER_ID }</a>
                                                        	</td>
                                                        	<td>${row.MEMBER_NAME }</td>
                                                        	<td>${row.MEMBER_PHONE }</td>
                                                        	<td>${row.MEMBER_EMAIL }</td>
                                                        	<td>${row.MEMBER_ADD1}&nbsp;${row.MEMBER_ADD2}</td>
                                                            <td><fmt:formatDate value="${row.MEMBER_JOINDATE }" type="both" dateStyle="medium" timeStyle="medium" /></td>
                                                            <td>${row.MEMBER_DEL_GB }</td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td colspan="4">조회된 결과가 없습니다.</td>
                                                    </tr>
                                                </c:otherwise>
  
                                            </c:choose>									
								</tbody>
							</table>
							
						</div>
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										
										<option value="0">ID</option>
										<option value="1">이름</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch">
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
					<div class="content-center">
					<div class="pagination">
											<div class="pagination">

												<div class="insu"
													style="margin: 0 auto; text-align: center;">
													<c:if test="${not empty paginationInfo}">
														<ui:pagination paginationInfo="${paginationInfo}"
															type="text" jsFunction="fn_search" />
													</c:if>
												</div>
											</div>
										</div>
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