<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AdminDelMemberList</title>
    <link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
        <div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">
       		
            <!-- 메인container-->
           	 
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">탈퇴회원목록</h1>
</div>
<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> 회원목록페이지는 검색,수정,삭제 기능 페이지입니다.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite" style="text-align:right;">총 회원 등록수 : 1</div>
						
						
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
										<th style="width: 10%; text-align:center;">복구</th>
									</tr>
								</thead>
								<tbody>
										<tr>
										<td>1</td>
                                        <td>   
                                       		admin
                                        </td>
                                        <td>
                                        홍길동
                                        </td>
                                        <td>
                                        010-1234-1235
                                        </td>
                                        <td>
                                        admin@naver.com
                                        </td>
                                        <td>
                                        서울특별시 강남구
                                        </td>
                                        <td>
                                        22-05-10
                                        </td>
                                        <td>
                                        <button id="member_del_gb" type="button" class="btn btn-default">복구</button>
                                        </td>
									  </tr>
									  
									
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
					<ul class="pagination">
	                <li class="page-item active" aria-current="page">
                      <span class="page-link">
                        1
                     <span class="sr-only">(current)</span>
                      </span>
                    </li>
	                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
                    </ul>
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