<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>자주 묻는 질문</title>
</head>
<body>
	<div align="left">
		<p>board-자주 묻는 질문</p>
	</div>
	<hr color="gray">
	<table>
		<tr>
			<th align="left">자주묻는질문</th>
		</tr>
	</table>
	<hr color="gray">

	<div align="center">
		<table>
			<tr>
				<th width="40%">작성일</th>
				<th width="60%">제목</th>
			</tr>
		</table>
		<div align="center">
			<script type="text/javascript">
				//내용 펼치기
				$(function() {
					$(".list .q").on(
							"click",
							function() {
								$(".list li").not($(this).parents("li"))
										.removeClass("open");
								$(this).parents("li").toggleClass("open");
								return false;
							});
				});
			</script>
			<ul class="list" id="fqboardlist">
				<li class="open">
					<div class="q">
						<a href="#anser">
							<table>
								<tr>
									<td>${fqboardlist.date}</td>
									<td>${fqboardlist.content}</td>
								</tr>
							</table>
						</a>
					</div>
					<div class="a" id="anser">
						<p>${fqboardlist.anser}</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>