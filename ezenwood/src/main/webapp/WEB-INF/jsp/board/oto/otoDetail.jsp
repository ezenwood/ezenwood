<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1��1����_�ڼ���</title>
</head>
<body>
	<div>
		<div>
			<em><a href="#" class="board�ΰ���">board</a> &gt; 1��1����</em>
		</div>
		<div>
			<div>
				<h2>1��1����</h2>
			</div>
			<div>
				<c:forEach var="list" items="noticeboarddetail">
					<table style="width: 100%">
						<colgroup>
							<col style="width: 50%">
		          <col style="width: 30%">
              <col style="width: 20%">
						</colgroup>
						<tr>
							<th align="center">�����ڵ�</th>
              <th align="center">������</th>
							<th align="center">��¥�ڵ�</th>
						</tr>
					</table>
				</c:forEach>
				<c:forEach var="image" items="image">
          <input type="hidden" id="�۹�ȣ" name="�� �±� ����" value="���Ѱ���">
					<div align="center">
						<img>�̹��� �ڵ�</img>
					</div>
				</c:forEach>
				<c:forEach var="list" items="otoclientcontent">
					<p align="center">��۹����մϴ� ct��</p>
				</c:forEach>
			</div>
			<hr>
    <c:forEach var="list" items="otoclientcontent">
    <div align="center">
      <p>������ �亯 �޾ƿ���</p>
    </div>
    </c:forEach>
			<div align="center">
				<button type="submit" href="������� ���� url">���</button>
			</div>
		</div>
	</div>
</body>
</html>