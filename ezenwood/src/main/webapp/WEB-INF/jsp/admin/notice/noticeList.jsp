<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>noticeList</title>
</head>
<body>
<div>
  <div>
    <h1>공지사항</h1>
  </div>
<div>
	<div>
		<div>
                         공지사항  검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div>
			<div>
				<div>
					<div style="margin-bottom:5px;">
						<div>
							<a href=""><button type="button">전체</button></a>													
						</div>
						<div style="text-align:right;">
							<div>총 게시물수 :</div>
						</div>
						
					</div>
					<div>
						<div >
							<table>
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">번호</th>
										
										<th style="width: 50%; text-align:center;">제목</th>
										
										<th style="width: 15%; text-align:center;">작성자</th>										
										<th style="width: 15%; text-align:center;">등록일</th>
										<th style="width: 10%; text-align:center;">중요도</th>
									</tr>
								</thead>
								<tbody>
																						
									<tr class="gradeA even" role="row">
									<td style="text-align:center;vertical-align:middle;">번호자리</td>
									
									<td style="text-align:center;vertical-align:middle;"><a href="제목을 통한 경로">제목자리</a></td>
									
									<td style="text-align:center;vertical-align:middle;">작성자자리</td>
									<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${list.regdate}"pattern="YY.MM.dd HH:mm" />등록일자리</td>
									<td style="text-align:center;vertical-align:middle;">중요도자리</td>										
									</tr>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(list) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
</div>
</body>
</html>