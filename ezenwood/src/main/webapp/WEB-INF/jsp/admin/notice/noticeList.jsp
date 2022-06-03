<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
   <link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/ezenwood/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="/ezenwood/resource/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">

<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
.col-sm-8 button {
	min-width: 30px;
    height: 40px;
    padding: 0 20px 0 20px;
    color: #ffffff;
    font-size: 14px;
    border: 1px solid #323437;
    background: #323437;
    cursor: pointer;
    font-weight: bold;
    border-radius: 6px;
    float: right;
    margin: 0 20% 0 0;
}
</style>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">공지사항</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         공지사항  수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/ezenwood/admin/notice?searchNum=0&amp;isSearch="><button type="button" class="btn btn-outline btn-default">전체</button></a>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 게시물수 : 0</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 12%; text-align:center;">번호</th>
										<th style="width: 20%; text-align:center;">제목</th>
										<th style="width: 12%; text-align:center;">작성자</th>							
										<th style="width: 12%; text-align:center;">등록일자</th>
										<th style="width: 12%; text-align:center;">중요도</th>
										
									</tr>
								</thead>
								<tbody>
								
								<!--  등록된 상품이 없을때 -->
									
										<tr style="text-align:center;">
										<td>1</td>
										<td>사이트오픈</td>
										<td>admin</td>
										<td>22-06-03</td>
										<td>1</td>
										</tr>
									 
								</tbody>
								
							</table>
							
                    
						</div>
							<div class="col-sm-8">
	<button type="button" onclick="location.href='http://localhost:9001/ezenwood/admin/notice/write'">쓰기</button>
                    </div>
					</div>
				
					<div class="paging">
						<strong>1</strong>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>

            <!-- // container -->
        </div>
        <!-- /#page-wrapper -->

    </div>
</body>
</html>